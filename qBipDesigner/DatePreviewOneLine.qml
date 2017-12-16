import QtQuick 2.9
import QtGraphicalEffects 1.0
import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser
    // We expect date in format dd.MM
    property alias modelData: itemModel.mydata
    property string suffix
    property string suffix2
    // TwoDightsMonth
    property string checkAttr1
    // TwoDightsDay
    property string checkAttr2

    ListModel {
        id: itemModel
        property string mydata

        onMydataChanged: {
            itemModel.clear()
            console.log("Checking:" + Utils.getNestedValue(
                            jsonParser_lcl, basePath + '.' + checkAttr1))
            var check1 = Utils.getNestedValue(jsonParser_lcl,
                                              basePath + '.' + checkAttr1)
            var check2 = Utils.getNestedValue(jsonParser_lcl,
                                              basePath + '.' + checkAttr2)
            var checks = [check2, check1]
            var res = mydata.split(".")
            var string_final
            for (var i = 0; i < res.length; i++) {
                string_final = res[i]
                if (checks[i] == 1 && Number(res[i]) < 10) {
                    var numberX = Number(res[i])
                    string_final = '0' + parseInt(numberX, 10).toString()
                }
                if (i === 0) {
                    string_final += '.'
                }

                for (var k = 0; k < string_final.length; k++) {
                    itemModel.append({
                                         num: string_final[k]
                                     })
                }
            }
            console.log("One line date")
        }
    }

    Rectangle {
        x: Utils.getNestedValue(
               parent.jsonParser_lcl,
               basePath + '.' + suffix + '.' + suffix2).TopLeftX
        y: Utils.getNestedValue(
               parent.jsonParser_lcl,
               basePath + '.' + suffix + '.' + suffix2).TopLeftY
        width: Utils.getNestedValue(parent.jsonParser_lcl,
                                    parent.basePath).BottomRightX - x
        height: Utils.getNestedValue(parent.jsonParser_lcl,
                                     parent.basePath).BottomRightY - y

        clip: true
        color: 'transparent'

        Row {
            spacing: Utils.getNestedValue(
                         jsonParser_lcl,
                         basePath + '.' + suffix + '.' + suffix2).Spacing
            Repeater {
                model: itemModel
                Image {
                    id: timeImage
                    //@formatter:off
                    source: {
                        if (modelData === '.') {

                            return fileHelper.getFilename(
                                        Utils.getNestedValue(
                                            jsonParser_lcl,
                                            basePath + '.' + suffix).DelimiterImageIndex + '.png')
                        } else {
                            return fileHelper.getFilename(
                                        Utils.getNestedValue(
                                            jsonParser_lcl,
                                            basePath + '.' + suffix + '.'
                                            + suffix2).ImageIndex + Number(
                                            modelData) + '.png')
                        }
                    }
                    //@formatter:on
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
