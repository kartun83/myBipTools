import QtQuick 2.9
import QtGraphicalEffects 1.0
import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser
    // Here we expect time in format HH:MM:SS
    property string modelData
    property int idx

    Rectangle {
        x: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).X
        y: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).Y
        border.color: "white"
        border.width: 2

        Image {
            id: timeImage
            source: fileHelper.getFilename(Utils.getNestedValue(
                                               jsonParser_lcl,
                                               basePath).ImageIndex + Number(
                                               modelData.charAt(idx)) + '.png')

            //            onSourceChanged: {
            //                console.log("Eval3:" + Utils.getNestedValue(jsonParser_lcl,
            //                                                            basePath))
            //            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: //container.clicked(container.cellColor)
            {
                console.log("Eval2:" + fileHelper.getFilename(
                                Utils.getNestedValue(
                                    jsonParser_lcl,
                                    basePath).ImageIndex + modelData + '.png'))
            }
        }
    }
}
