import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQml.Models 2.1

import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser
    property alias modelData: itemModel.mydata

    ListModel {
        id: itemModel
        property int mydata

        onMydataChanged: {
            itemModel.clear()
            var string = (mydata / 1000).toFixed(2).toString()
            console.log("Evaluated distance:" + string)
            for (var i = 0; i < string.length; i++) {
                itemModel.append({
                                     num: string[i]
                                 })
            }
        }
    }

    Rectangle {
        x: Utils.getNestedValue(parent.jsonParser_lcl,
                                parent.basePath).Number.TopLeftX
        y: Utils.getNestedValue(parent.jsonParser_lcl,
                                parent.basePath).Number.TopLeftY
        border.color: "white"
        border.width: 2

        Row {
            spacing: Utils.getNestedValue(jsonParser_lcl,
                                          basePath).Number.Spacing
            Repeater {
                model: itemModel
                Image {
                    id: timeImage
                    source: if (modelData === '.') {
                                fileHelper.getFilename(
                                            Utils.getNestedValue(
                                                jsonParser_lcl,
                                                basePath).DecimalPointImageIndex + '.png')
                            } else {
                                fileHelper.getFilename(
                                            Utils.getNestedValue(
                                                jsonParser_lcl,
                                                basePath).Number.ImageIndex + Number(
                                                modelData) + '.png')
                            }
                }
            }
            Image {
                id: suffixImg
                source: fileHelper.getFilename(
                            Utils.getNestedValue(
                                jsonParser_lcl,
                                basePath).SuffixImageIndex + '.png')
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
    }
}
