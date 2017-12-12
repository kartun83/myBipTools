import QtQuick 2.9
import QtGraphicalEffects 1.0
import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser
    property int modelData

    Rectangle {
        x: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).TopLeftX
        y: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).TopLeftY
        border.color: "white"
        border.width: 2

        Image {
            id: timeImage
            source: fileHelper.getFilename(
                        Utils.getNestedValue(
                            jsonParser_lcl,
                            basePath).ImageIndex + modelData + '.png')

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
                                    basePath).ImageIndex + modelData - 1 + '.png'))
            }
        }
    }
}
