import QtQuick 2.9
import QtQuick.Controls 2.3


//Item {
Button {
    id: fileButton
    text: qsTr("Insert")
    onClicked: menu.open()

    Menu {
        id: menu
        y: fileButton.height

        Menu {
            title: qsTr("Time")
            Action {
                text: qsTr("Simple")
            }
        }
        MenuItem {
            text: qsTr("Date")
        }
        MenuItem {
            text: qsTr("Activity")
        }
        Menu {
            title: qsTr("Status")
            id: statusMenu
            MenuItem {
                text: qsTr('Bluetooth')
            }
            MenuItem {
                text: qsTr('Alarm')
            }
            MenuItem {
                text: qsTr('DND')
            }
            MenuItem {
                text: qsTr('Locked')
            }
        }
    }
} //}
