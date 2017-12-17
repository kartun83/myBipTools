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
        x: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).TopLeftX
        y: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).TopLeftY
        width: Utils.getNestedValue(parent.jsonParser_lcl,
                                    parent.basePath).BottomRightX - x
        height: Utils.getNestedValue(parent.jsonParser_lcl,
                                     parent.basePath).BottomRightY - y

        clip: true
        color: 'transparent'
        border.width: 2
        border.color: 'lime'

        Row {
            spacing: Utils.getNestedValue(jsonParser_lcl, basePath).Spacing
            Repeater {
                model: itemModel
                Image {
                    id: timeImage
                    source: fileHelper.getFilename(
                                Utils.getNestedValue(
                                    jsonParser_lcl,
                                    basePath).ImageIndex + modelData + '.png')
                }
            }
            //            Layout.alignment: alignmentConv[Utils.getNestedValue(
            //                                                jsonParser_lcl,
            //                                                basePath).Alignment]
            Layout.alignment: Qt.AlignBottom | Qt.AlignRight
            //            Layout.anchors.right:
            Layout.onAlignmentChanged: {
                console.log("Alignment changed")
                console.log('Alignment:' + Utils.getNestedValue(
                                jsonParser_lcl, basePath).Alignment + '=>')
            }

            Component.onCompleted: {
                console.log(alignmentConv)

                console.log('Alignment:' + Utils.getNestedValue(
                                jsonParser_lcl, basePath).Alignment + '=>')
                /*+ alignmentConv[Utils.getNestedValue(
                                                jsonParser_lcl,
                                                basePath).Alignment])*/
                console.log("Completed")
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
