import QtQuick 2.9
import QtGraphicalEffects 1.0
import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser
    property bool modelData

    Rectangle {
        x: Utils.getNestedValue(parent.jsonParser_lcl,
                                parent.basePath + '.Coordinates').X
        y: Utils.getNestedValue(parent.jsonParser_lcl,
                                parent.basePath + '.Coordinates').Y
        border.color: "white"
        border.width: 2

        Image {
            id: timeImage
            source: {
                if (modelData == true) {
                    fileHelper.getFilename(Utils.getNestedValue(
                                               jsonParser_lcl,
                                               basePath).ImageIndexOn + '.png')
                } else {
                    fileHelper.getFilename(Utils.getNestedValue(
                                               jsonParser_lcl,
                                               basePath).ImageIndexOff + '.png')
                }
            }

            onSourceChanged: {
                console.log("Eval status preview:" + Utils.getNestedValue(
                                jsonParser_lcl, basePath).ImageIndexOn + '.png')
            }
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

    Connections {
        target: app
        onJsonParserChanged: {
            console.log("detected json data change in activity preview")
            // There is no true binging, so it's safe to use this trick.
            // I've not found in docs how to force image reloading
            timeImage.sourceChanged("dummy")
            //            itemModel.onMydataChanged
        }
    }
}
