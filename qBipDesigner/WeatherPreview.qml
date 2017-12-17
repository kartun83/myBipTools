import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQml.Models 2.1

import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser
    property alias modelData: itemModel.mydata
    property string suffix

    ListModel {
        id: itemModel
        property int mydata

        onMydataChanged: {
            itemModel.clear()
            var string = mydata.toString()
            for (var i = 0; i < string.length; i++) {
                itemModel.append({
                                     num: string[i]
                                 })
            }
        }
    }

    Rectangle {
        x: Utils.getNestedValue(parent.jsonParser_lcl,
                                parent.basePath + '.' + suffix).TopLeftX
        y: Utils.getNestedValue(parent.jsonParser_lcl,
                                parent.basePath + '.' + suffix).TopLeftY
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
                    source: if (modelData === '-') {
                                fileHelper.getFilename(
                                            Utils.getNestedValue(
                                                jsonParser_lcl,
                                                basePath).MinusImageIndex + '.png')
                            } else {
                                fileHelper.getFilename(
                                            Utils.getNestedValue(
                                                jsonParser_lcl,
                                                basePath + '.' + suffix).ImageIndex + Number(
                                                modelData) + '.png')
                            }
                }
            }

            Image {
                id: degreesImage
                source: fileHelper.getFilename(
                            Utils.getNestedValue(
                                jsonParser_lcl,
                                basePath).DegreesImageIndex + '.png')
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: //container.clicked(container.cellColor)
            {
                console.log("Eval2:" + fileHelper.getFilename(
                                Utils.getNestedValue(
                                    jsonParser_lcl,
                                    basePath).ImageIndex + '.png'))
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
            console.log("detected json data change in weather preview")
            itemModel.modelReset()
            itemModel.mydataChanged()
            //            itemModel.onMydataChanged
        }
    }
}
