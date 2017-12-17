import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
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
        border.width: 2
        border.color: 'lime'

        RowLayout {
            anchors.fill: parent
            Rectangle {
                id: contentRect
                //                color: 'transparent'
                color: border.color
                border.color: 'blue'
                border.width: 2
                width: 20 //topRect.width
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
            onClicked: //container.clicked(container.cellColor)
            {
                console.log("Eval2:" + fileHelper.getFilename(
                                Utils.getNestedValue(
                                    jsonParser_lcl,
                                    basePath).ImageIndex + modelData - 1 + '.png'))
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
