import QtQuick 2.7
import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: app.jsonParser

    width: 40
    height: 25

    Rectangle {
        id: rectangle
        border.color: "white"
        color: "blue"
        anchors.fill: parent
        x: 34
        y: 34
    }

    MouseArea {
        anchors.fill: parent
        onClicked: //container.clicked(container.cellColor)
        {
            console.log("Eval2:" + fileHelper.getFilename(
                            Utils.getNestedValue(
                                jsonParser_lcl,
                                parent.basePath).ImageIndex + '.png'))
        }
    }

    //property var jsonParser: app.jsonParser
    Rectangle {
        x: Utils.getNestedValue(jsonParser_lcl, parent.basePath).X
        y: Utils.getNestedValue(jsonParser_lcl, parent.basePath).Y
        Component.onCompleted: {
            console.log("Test")
            console.log("App:" + jsonParser_lcl)
        }
        Image {
            //id: anotherImage
            source: fileHelper.getFilename(
                        Utils.getNestedValue(
                            jsonParser_lcl,
                            parent.basePath).ImageIndex + '.png')
            onSourceChanged: {
                console.log("Eval3:" + Utils.getNestedValue(jsonParser_lcl,
                                                            parent.basePath))
            }
        }
    }
} //Item {//    id: container//    property string basePath//    property var jsonParser_lcl: app.jsonParser//    property alias cellColor: rectangle.color//    signal clicked(color cellColor)//    width: 40//    height: 25//    Rectangle {//        id: rectangle
//        border.color: "white"
//        anchors.fill: parent
//    }

//    MouseArea {
//        anchors.fill: parent
//        onClicked: //container.clicked(container.cellColor)
//        {
//            console.log("Eval2:" + fileHelper.getFilename(
//                            Utils.getNestedValue(
//                                jsonParser_lcl,
//                                parent.basePath).ImageIndex + '.png'))
//        }
//    }
//}

