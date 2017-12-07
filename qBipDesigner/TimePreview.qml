import QtQuick 2.7
import QtGraphicalEffects 1.0
import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser

    Rectangle {
        x: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).X
        y: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).Y
        border.color: "white"
        border.width: 2

        Image {
            id: timeImage
            source: fileHelper.getFilename(Utils.getNestedValue(
                                               jsonParser_lcl,
                                               basePath).ImageIndex + '.png')

            onSourceChanged: {
                console.log("Eval3:" + Utils.getNestedValue(jsonParser_lcl,
                                                            basePath))
            }
        }

        //        Rectangle {
        //            id: mask
        //            //            color: '#FEFE00'
        //            color: "green"
        //            width: timeImage.width + 10
        //            height: timeImage.height + 10
        //            //            source: "images/butterfly.png"
        //            //            sourceSize: Qt.size(parent.width, parent.height)
        //            smooth: true
        //            visible: false
        //        }

        //        OpacityMask {
        //            anchors.fill: timeImage
        //            source: timeImage
        //            maskSource: mask
        //        }
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
