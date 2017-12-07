import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    id: mainUI
    anchors.fill: parent

    //    property alias jsonFilename: fileSelector. jsonFilename
    //    property alias browseButton: browseButton
    //    property alias jsonData: jsonData.text
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
                }

                ColumnLayout {
                    id: columnLayout

                    //                    width: 100
                    //                    height: 100
                    FileSelector {
                        id: fileSelector
                        Layout.fillHeight: true
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

            JSONView {
                id: jSONView
                anchors.fill: parent
            }
        }
    }
}
