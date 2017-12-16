import QtQuick 2.9
import QtGraphicalEffects 1.0
import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser
    property alias modelData: itemModel.mydata
    property string suffix
    property string checkAttr

    ListModel {
        id: itemModel
        property int mydata

        onMydataChanged: {
            itemModel.clear()
            console.log("Checking:" + Utils.getNestedValue(
                            jsonParser_lcl, basePath + '.' + checkAttr))
            var check = Utils.getNestedValue(jsonParser_lcl,
                                             basePath + '.' + checkAttr)
            var numberX = Number(mydata)
            var string = parseInt(numberX, 10).toString()
            if (check == 1 && numberX < 10) {
                // Beware of leading zero
                string = '0' + parseInt(mydata, 10).toString()
            }

            for (var i = 0; i < string.length; i++) {
                itemModel.append({
                                     num: string[i]
                                 })
            }
        }
    }

    Rectangle {
        x: Utils.getNestedValue(parent.jsonParser_lcl,
                                basePath + '.' + suffix).TopLeftX
        y: Utils.getNestedValue(parent.jsonParser_lcl,
                                basePath + '.' + suffix).TopLeftY
        width: Utils.getNestedValue(
                   parent.jsonParser_lcl,
                   parent.basePath + '.' + suffix).BottomRightX - x
        height: Utils.getNestedValue(
                    parent.jsonParser_lcl,
                    parent.basePath + '.' + suffix).BottomRightY - y

        clip: true
        color: 'transparent'

        Row {
            spacing: Utils.getNestedValue(jsonParser_lcl,
                                          basePath + '.' + suffix).Spacing
            Repeater {
                model: itemModel
                Image {
                    id: timeImage
                    source: fileHelper.getFilename(
                                Utils.getNestedValue(
                                    jsonParser_lcl,
                                    basePath + '.' + suffix).ImageIndex + Number(
                                    modelData) + '.png')
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: //container.clicked(container.cellColor)
            {
                console.log("Eval2:" + fileHelper.getFilename(
                                Utils.getNestedValue(
                                    jsonParser_lcl,
                                    basePath).ImageIndex + modelData - 1 + '.png'))
            }
        }
    }

    Connections {
        target: app
        onJsonParserChanged: {
            console.log("detected json data change in activity preview")
            itemModel.modelReset()
            itemModel.mydataChanged()
            //            itemModel.onMydataChanged
        }
    }
}
