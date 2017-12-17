import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "Utitilies.js" as Utils

Item {
    id: baseImg

    Rectangle {
        x: 50
        y: 50
        width: 300
        height: 300
        id: topRect

        clip: true
        color: 'green'

        border.width: 2
        border.color: 'lime'
        RowLayout {
            anchors.fill: parent
            Rectangle {
                id: contentRect
                color: 'transparent'
                border.color: 'blue'
                border.width: 2
                width: 50
                height: 50
                clip: true
                Layout.alignment: Qt.AlignRight | Qt.AlignBottom

                //anchors.fill: parent
                RowLayout {
                    anchors.fill: parent
                    id: repeaterLayout
                    Repeater {
                        model: 5
                        anchors.fill: parent
                        Text {
                            id: test
                            text: modelData
                            //Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                        }
                    }
                }
            }
        }
    }
}
