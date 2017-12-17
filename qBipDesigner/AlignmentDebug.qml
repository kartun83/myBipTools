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
        color: 'green' //'transparent'
        border.width: 2
        border.color: 'lime'

        RowLayout {

            Repeater {
                Layout.alignment: Qt.AlignRight | Qt.AlignBottom
                model: 5
                Text {
                    id: textInRepeater
                    text: modelData
                }
            }
        }
    }
}
