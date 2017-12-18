import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQml.Models 2.1
import QtQml 2.2
import QtQuick.Layouts 1.3

import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser
    property alias modelData: itemModel.mydata
    property string elementDesc

    ListModel {
        id: itemModel
        property int mydata

        onMydataChanged: {
            console.log("Rebuilding activity")
            itemModel.clear()
            var string = mydata.toString()
            for (var i = 0; i < string.length; i++) {
                itemModel.append({
                                     num: Number(string[i])
                                 })
            }
        }
    }

    Rectangle {
        id: topRect
        x: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).TopLeftX
        y: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).TopLeftY
        width: Utils.getNestedValue(parent.jsonParser_lcl,
                                    parent.basePath).BottomRightX - x
        height: Utils.getNestedValue(parent.jsonParser_lcl,
                                     parent.basePath).BottomRightY - y

        clip: true
        color: 'transparent'

        RowLayout {
            anchors.fill: parent
            id: baseRowLayout
            property string elementDesc: baseImg.elementDesc
            property var topRect: topRect
            Rectangle {
                id: contentRect
                color: 'transparent'
                property int baseWidth
                property int baseHeight
                visible: true
                //TODO :: Confirm
                //width: 20 // For now it's streching and not clipping
                //height: 20 //topRect.height
                // TODO :: Find proper way to calculate dimentions
                //                width: 50
                //                height: 50
                clip: false
                Layout.alignment: alignmentConv[Utils.getNestedValue(
                                                    jsonParser_lcl,
                                                    basePath).Alignment]
                //anchors.fill: parent
                RowLayout {
                    Layout.margins: 2
                    anchors.fill: parent
                    id: repeaterLayout
                    spacing: Utils.getNestedValue(jsonParser_lcl,
                                                  basePath).Spacing
                    Repeater {
                        model: itemModel
                        id: repeater
                        Image {
                            id: timeImage
                            source: fileHelper.getFilename(
                                        Utils.getNestedValue(
                                            jsonParser_lcl,
                                            basePath).ImageIndex + modelData + '.png')
                            onStatusChanged: {
                                if (this.status == Image.Ready) {
                                    contentRect.baseWidth = Math.max(
                                                contentRect.baseWidth,
                                                implicitWidth)
                                    contentRect.baseHeight = Math.max(
                                                contentRect.baseWidth,
                                                implicitHeight)
                                }
                            }
                        }
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Clicked on:" + baseImg.elementDesc)
                topRect.border.width === app.borderWidth ? topRect.border.width
                                                           = 0 : topRect.border.width
                                                           = app.borderWidth
                if (selectedElement != baseRowLayout) {
                    selectedElement = baseRowLayout
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
            contentRect.width = contentRect.baseWidth * itemModel.count
            contentRect.height = contentRect.baseHeight //* itemModel.count
            //            itemModel.onMydataChanged
        }
    }
}
