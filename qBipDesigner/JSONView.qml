import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    anchors.fill: parent
    ColumnLayout {
        anchors.fill: parent

        spacing: 2

        Rectangle {
            id: rectangle
            width: 200
            height: 200
            color: "#ffffff"
            Layout.fillHeight: true
            Layout.fillWidth: true
            anchors.fill: parent

            Flickable {
                id: flick

                anchors.fill: parent

                contentWidth: parent.width
                contentHeight: jsonDataEdit.paintedHeight
                clip: true

                function ensureVisible(r) {
                    if (contentX >= r.x)
                        contentX = r.x
                    else if (contentX + width <= r.x + r.width)
                        contentX = r.x + r.width - width
                    if (contentY >= r.y)
                        contentY = r.y
                    else if (contentY + height <= r.y + r.height)
                        contentY = r.y + r.height - height
                }

                TextEdit {
                    id: jsonDataEdit
                    //                text: "test"
                    anchors.fill: parent
                    wrapMode: Text.WordWrap
                    selectByMouse: true
                    text: app.jsonData

                    //anchors.fill: parent
                    //                width: parent.width
                    //                height: parent.height
                    color: "blue"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    onCursorRectangleChanged: flick.ensureVisible(
                                                  cursorRectangle)
                }
            }
        }

        Rectangle {
            id: rectangle1
            color: "#ffffff"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            Layout.maximumHeight: 50

            Button {
                id: refreshButton

                text: qsTr("Refresh")

                anchors.fill: parent
                Layout.alignment: Qt.AlignLeft | Qt.AlignBottom

                onClicked: {
                    console.log("Refreshing JSON from editor")
                    fileHelper.fileContent = jsonDataEdit.text
                    jsonParser = JSON.parse(jsonDataEdit.text)
                }
            }
        }
    }
}
