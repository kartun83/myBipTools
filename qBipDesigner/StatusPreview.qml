import QtQuick 2.9
import QtGraphicalEffects 1.0
import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser

    Rectangle {
        x: Utils.getNestedValue(parent.jsonParser_lcl,
                                parent.basePath + '.Coordinates').X
        y: Utils.getNestedValue(parent.jsonParser_lcl,
                                parent.basePath + '.Coordinates').Y
        border.color: "white"
        border.width: 2

        Image {
            id: timeImage
            source: fileHelper.getFilename(Utils.getNestedValue(
                                               jsonParser_lcl,
                                               basePath).ImageIndex + '.png')

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
                                    basePath).ImageIndexOn + '.png'))
            }
        }
    }
}
