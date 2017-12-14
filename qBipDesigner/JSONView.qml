import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import MyBipTools 1.0

Item {
    anchors.fill: parent
    Shortcut {
        id: refreshShortcut
        sequence: "Ctrl+R"
        onActivated: refreshButton.onClicked()
    }

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
                    //textFormat: Text.PlainText
                    persistentSelection: true

                    //anchors.fill: parent
                    //                width: parent.width
                    //                height: parent.height
                    color: "#000eff"
                    text: app.jsonData
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    onCursorRectangleChanged: flick.ensureVisible(
                                                  cursorRectangle)
                    //                    onTextChanged: {
                    //                        testTextArea.text = text
                    //                    }

                    //                    text: testTextArea.text

                    //                    JSONHighlighterComponent {
                    //                        id: testTextArea
                    //                        Component.onCompleted: onCompleted()
                    //                    }
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

                text: qsTr("Refresh (" + refreshShortcut.sequence + ")")

                anchors.fill: parent
                Layout.alignment: Qt.AlignLeft | Qt.AlignBottom

                onClicked: {
                    console.log("Refreshing JSON from editor")
                    fileHelper.fileContent = jsonDataEdit.text
                    app.validateJson(fileHelper.fileContent)
                    jsonParser = JSON.parse(jsonDataEdit.text)
                    myHighlighter.myRehighlight()
                }
            }
        }
    }
}
