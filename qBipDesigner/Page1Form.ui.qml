import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    id: mainUI
    anchors.fill: parent

    //    property alias jsonFilename: fileSelector. jsonFilename
    //    property alias browseButton: browseButton
    //    property alias jsonData: jsonData.text
    property int dpReqHeight: 178
    property int dpReqWidth: 178
    property alias dpScaledPreview: designPreviewScaled
    property alias dpScaledRect: dpScaledRect
    //    property alias gridCanvas: drawingCanvas
    property alias myCanvas: myCanvas
    ColumnLayout {
        id: column
        anchors.fill: parent

        Rectangle {
            id: rectangleTop
            width: parent.width
            height: 200
            color: "#ffffff"
            anchors.topMargin: 0
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop

            RowLayout {
                id: rowLayout
                anchors.fill: parent

                DesignPreview {
                    id: designPreview
                    controlWidth: dpReqWidth
                    contolHeight: dpReqHeight
                    scale: 1.0
                }

                ColumnLayout {
                    id: columnLayout

                    //                    width: 100
                    //                    height: 100
                    FileSelector {
                        id: fileSelector
                        //Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.minimumHeight: 50
                    }

                    PreviewParameters {
                        id: previewParameters
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }
        }

        Rectangle {
            id: rectangle1
            width: parent.width
            height: 200
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            color: "#ffffff"
            Layout.minimumHeight: 250
            Layout.minimumWidth: 300
            Layout.fillHeight: true
            Layout.fillWidth: true

            RowLayout {
                id: rowLayout1
                anchors.fill: parent
                ColumnLayout {
                    anchors.fill: parent
                    Rectangle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        id: dpScaledRect

                        color: "grey"

                        DesignPreview {
                            id: designPreviewScaled
                            Layout.leftMargin: 10
                            contolHeight: parent.height
                            controlWidth: parent.width
                            MovingShortCut {
                            }
                        }
                        Canvas {
                            id: myCanvas
                            width: dpScaledRect.width
                            height: dpScaledRect.height
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                        }
                    }
                    Rectangle {
                        Layout.preferredHeight: 30
                        Layout.fillWidth: true
                        Text {
                            id: selectedElementText
                        }
                    }
                }
                ColorPanel {
                    Layout.minimumHeight: 50
                    Layout.minimumWidth: 50
                    Layout.preferredHeight: 50
                    Layout.preferredWidth: 50
                    Layout.alignment: Qt.AlignCenter | Qt.AlignTop
                }

                Rectangle {
                    Layout.fillHeight: true
                    //Layout.fillWidth: true
                    color: "green"
                    Layout.alignment: Qt.AlignRight | Qt.AlignTop
                    Layout.minimumHeight: 250
                    Layout.minimumWidth: 400
                    Layout.preferredHeight: Layout.minimumHeight
                    //Layout.preferredWidth: Layout.preferredWidth
                    JSONView {
                        id: jSONView
                        anchors.fill: parent
                    }
                }
            }
        }
    }

    Connections {

        target: dpScaledRect

        onWidthChanged: resizePreview()
    }

    Connections {
        target: appWindow
        onWindowStateChanged: {
            console.log("React on window state changed from Page1")
            //            dpScaledRect.onWidthChanged()
            resizePreview()
        }
    }

    Connections {
        target: myCanvas
        onPaint: drawGrid()
    }

    Connections {
        target: app
        onSelectedElementChanged: {
            selectedElementText.text = qsTr("Selected element: %1").arg(
                        (selectedElement) ? selectedElement.elementDesc : qsTr(
                                                "none"))
        }
    }
}
