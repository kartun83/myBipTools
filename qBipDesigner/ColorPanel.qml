import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQml.Models 2.3

Item {
    property var colors: ['#000000', '#0000FF', '#00FF00', '#FF0000', '#00FFFF', '#FF00FF', '#FFFF00', '#FFFFFF'] //, '#FEFE00']

    Row {
        //anchors.fill: parent
        Rectangle {
            color: "green"
            anchors.fill: parent
            Column {
                Repeater {
                    model: colors.length //itemModel
                    Rectangle {
                        id: coloredBox
                        color: colors[index]
                        Layout.minimumHeight: 50
                        Layout.minimumWidth: 50
                        width: 50
                        height: 50
                        border.color: "grey"
                        border.width: 2
                        MouseArea {
                            anchors.fill: coloredBox
                            onClicked: //container.clicked(container.cellColor)
                            {
                                console.log("Clicked on:" + coloredBox.color)
                                if (selectedElement) {
                                    selectedElement.boxOverlay.visible = true
                                    selectedElement.boxOverlay.color = coloredBox.color

                                    //                                    if (selectedElement.visible == true) {
                                    //                                        selectedElement.visible = false
                                    //                                    }
                                }

                                //                                borderBox.visible = !borderBox.visible
                                //                                borderBox.overlay = myOverlay
                                //                                selectedElement = borderBox
                            }
                        }
                    }
                }
            }
        }
    }
}
