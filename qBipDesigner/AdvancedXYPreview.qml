import QtQuick 2.9
import QtGraphicalEffects 1.0
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
        //        color: 'black'
        border.width: 0
        border.color: app.gridColor
        visible: true

        RowLayout {
            anchors.fill: parent
            id: baseRowLayout
            property string elementDesc: baseImg.elementDesc
            property var topRect: topRect
            Rectangle {
                id: contentRect
                color: 'transparent'
                //color: border.color
                //border.color: 'blue'
                //border.width: 2
                //TODO :: Confirm
                width: 20 // For now it's streching and not clipping
                height: 20 //topRect.height
                clip: true
                Layout.alignment: alignmentConv[Utils.getNestedValue(
                                                    jsonParser_lcl,
                                                    basePath).Alignment]
                //anchors.fill: parent
                RowLayout {
                    anchors.fill: parent
                    id: repeaterLayout
                    Repeater {
                        model: itemModel
                        anchors.fill: parent
                        Text {
                            id: test
                            text: modelData
                            //Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
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
            console.log(contentRect.Layout.alignment)
            //            itemModel.onMydataChanged
            console.log(alignmentConv[Utils.getNestedValue(jsonParser_lcl,
                                                           basePath).Alignment])
            console.log(contentRect.Layout.alignment)
            console.log('junk')
        }
    }
}
