import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser
    property alias modelData: itemModel.mydata
    property string suffix
    property string checkAttr
    property string elementDesc

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
        id: topRect
        clip: true
        color: 'transparent'

        Rectangle {
            id: borderBox
            anchors.fill: parent
            border.color: app.gridColor
            border.width: 0
            color: "transparent"
            //visible: false
            visible: true
            //            property var boxOverlay: myOverlay
            property var topRect: topRect
            property string elementDesc: baseImg.elementDesc

            Row {
                spacing: Utils.getNestedValue(jsonParser_lcl,
                                              basePath + '.' + suffix).Spacing
                Layout.alignment: alignmentConv[Utils.getNestedValue(
                                                    jsonParser_lcl,
                                                    basePath + '.' + suffix).Alignment]
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
                Component.onCompleted: {
                    console.log(alignmentConv)
                    console.log(alignmentConv[Utils.getNestedValue(
                                                  jsonParser_lcl,
                                                  basePath + '.' + suffix).Alignment])
                }
            }
        }
        //        ColorOverlay {
        //            id: myOverlay
        //            anchors.fill: borderBox
        //            source: timeImage
        //            color: app.gridColor
        //            visible: false
        //        }
        MouseArea {
            anchors.fill: borderBox
            onClicked: {
                console.log("Clicked on:" + baseImg.elementDesc)
                borderBox.border.width
                        === app.borderWidth ? borderBox.border.width
                                              = 0 : borderBox.border.width = app.borderWidth
                if (selectedElement != borderBox) {
                    selectedElement = borderBox
                } else {
                    selectedElement = null
                }
            }
        }
        onWidthChanged: {
            validateViewBox(basePath, x, y, width, height)
        }

        onHeightChanged: {
            validateViewBox(basePath, x, y, width, height)
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
