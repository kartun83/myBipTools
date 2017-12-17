import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQml.Models 2.3

Popup {
    property var alignments: [18, 24, 20, 66, 72, 68, 34, 40, 36]
    property var jsonEditor
    id: alignmentPopup
    x: 0
    y: 0
    //width: 200
    //height: 300
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    Rectangle {
        anchors.fill: parent

        GridLayout {
            id: gridLayout
            anchors.fill: parent
            rows: 3
            columns: 3

            Repeater {
                anchors.fill: parent
                model: alignments

                Rectangle {
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 50

                    border.width: 1
                    border.color: 'black'

                    RowLayout {
                        anchors.fill: parent

                        Text {
                            id: alignmentText
                            anchors.margins: 2
                            text: modelData
                            Layout.alignment: alignmentConv[modelData]
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            jsonEditor.insert(jsonEditor.cursorPosition,
                                              modelData.toString())
                            alignmentPopup.close()
                        }
                    }
                }
            }
        }
    }
}
