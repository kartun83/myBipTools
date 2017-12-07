import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    property alias jsonFilename: jsonFilename
    property alias browseButton: browseButton
    property alias refreshButton: refreshButton
    property alias jsonData: jsonData.text

    ColumnLayout {
        width: 640
        height: 480
        spacing: 2

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.topMargin: 20
            anchors.top: parent.top

            TextField {
                id: jsonFilename
                placeholderText: qsTr("Select file")
            }

            Button {
                id: browseButton
                text: qsTr("Browse")
            }
            Button {
                id: saveButton
                text: qsTr("Save")
            }
        }

        TextInput {
            id: jsonData
            text: "test"
            wrapMode: TextEdit.Wrap
            selectByMouse: true
            //anchors.fill: parent
            width: parent.width
            height: parent.height
        }

        Button {
            id: refreshButton
            text: qsTr("Refresh")
        }
    }
}
