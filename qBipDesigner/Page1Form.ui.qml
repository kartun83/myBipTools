import QtQuick 2.7
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
    //    property alias gridCanvas: drawingCanvas
    //    property alias dpCanvas: designPreviewScaled
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
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    id: dpScaledRect

                    color: "grey"

                    //                    Canvas {
                    //                        id: drawingCanvas
                    //                        anchors.fill: parent
                    DesignPreview {
                        id: designPreviewScaled
                        Layout.leftMargin: 10
                        contolHeight: parent.height
                        controlWidth: parent.width
                        //                        }
                    }
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

        onWidthChanged: {
            console.log("Resizing:", dpScaledRect.height / dpReqHeight,
                        dpScaledRect.width / dpReqWidth)
            designPreviewScaled.scale = Math.min(
                        dpScaledRect.height / dpReqHeight,
                        dpScaledRect.width / dpReqWidth)
        }
    }

    Connections {
        target: appWindow

        onVisibleChanged: {
            console.log("On visible changed")
        }

        onWindowStateChanged: {
            dpScaledRect.onWidthChanged()
        }
    }
}
