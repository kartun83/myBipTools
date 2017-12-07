import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    property alias jsonFilename: jsonFilename
    Flow {
        anchors.horizontalCenterOffset: 5
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        spacing: 5
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
            onClicked: {
                console.log("Loding file " + jsonFilename.text)
                fileDialog.visible = true
                jsonFilename.text = fileHelper.filename
            }
        }
        Button {
            id: saveButton
            text: qsTr("Save")
            onClicked: {
                console.log("Saving file " + jsonFilename.text)
                //fileDialog.visible = true
                //fileHelper.fileContent = jsonData
                fileHelper.saveFile()
                //jsonFilename.text = fileHelper.filename
            }
        }
    }
}
