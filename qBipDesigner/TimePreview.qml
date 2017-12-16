import QtQuick 2.9
import QtGraphicalEffects 1.0
import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser
    // Here we expect time in format HH:MM:SS
    property string modelData
    property string elementDesc
    property int idx

    Rectangle {
        x: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).X
        y: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).Y
        width: Utils.getNestedValue(parent.jsonParser_lcl,
                                    parent.basePath).BottomRightX - x
        height: Utils.getNestedValue(parent.jsonParser_lcl,
                                     parent.basePath).BottomRightY - y

        clip: true
        color: 'transparent'
        id: topRect

        Image {
            id: timeImage
            source: fileHelper.getFilename(Utils.getNestedValue(
                                               jsonParser_lcl,
                                               basePath).ImageIndex + Number(
                                               modelData.charAt(idx)) + '.png')
            Rectangle {
                id: borderBox
                anchors.fill: parent
                border.color: app.gridColor
                border.width: 2
                color: "transparent"
                visible: false
                property var boxOverlay: myOverlay
                property var topRect: topRect
                property string elementDesc: baseImg.elementDesc
            }
        }

        ColorOverlay {
            id: myOverlay
            anchors.fill: timeImage
            source: timeImage
            color: app.gridColor
            visible: false
        }
        MouseArea {
            anchors.fill: timeImage
            onClicked: {
                console.log("Clicked on:" + baseImg.elementDesc)
                if (selectedElement) {
                    if (selectedElement.visible === true) {
                        selectedElement.visible = false
                    }
                }

                borderBox.visible = !borderBox.visible
                if (selectedElement != borderBox) {
                    selectedElement = borderBox
                } else {
                    selectedElement = null
                }
            }
        }
    }

    //    Connections {
    //        target: app
    //        onJsonParserChanged: {
    //            console.log("detected json data change in activity preview")
    //            timeImage.sourceChanged("dummy")
    //            //            itemModel.onMydataChanged
    //        }
    //    }
}
