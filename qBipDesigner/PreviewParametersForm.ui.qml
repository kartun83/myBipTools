import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Item {
    id: item1
    width: 400
    height: 400

    //    anchors.fill: parent
    ColumnLayout {
        id: column
        anchors.fill: parent

        Rectangle {
            id: timeParams
            width: 200
            height: 200
            color: "#afafaf"
            Layout.fillWidth: true
            Layout.fillHeight: true
            Flow {
                id: flow1
                spacing: 5
                anchors.fill: parent

                Text {
                    id: text1
                    text: qsTr("Time")
                    font.pixelSize: 12
                }

                TextField {
                    id: timeEdit
                    width: 80
                    height: 20
                    text: qsTr("")
                    font.pixelSize: 12
                }

                Text {
                    id: text2
                    text: qsTr("Date")
                    font.pixelSize: 12
                }

                TextField {
                    id: dateEdit
                    width: 80
                    height: 20
                    text: qsTr("")
                    font.pixelSize: 12
                }

                Text {
                    id: text3
                    text: qsTr("Battery")
                    font.pixelSize: 12
                }

                TextField {
                    id: batteryEdit
                    width: 80
                    height: 20
                    text: qsTr("")
                    font.pixelSize: 12
                }
            }
        }

        Rectangle {
            id: fitParams
            width: 200
            height: 200
            color: "#afafaf"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Flow {
                id: fitFlow
                spacing: 5
                anchors.fill: parent
                Text {
                    id: text4
                    text: qsTr("Steps")
                    font.pixelSize: 12
                }

                TextField {
                    id: stepsEdit
                    width: 80
                    height: 20
                    text: qsTr("")
                    selectionColor: "#00801c"
                    font.pixelSize: 12
                }

                Text {
                    id: text5
                    text: qsTr("Steps goal")
                    font.pixelSize: 12
                }

                TextField {
                    id: stepsGoalEdit
                    width: 80
                    height: 20
                    text: qsTr("")
                    font.pixelSize: 12
                }

                Text {
                    id: text6
                    text: qsTr("Callories")
                    font.pixelSize: 12
                }

                TextField {
                    id: calloriesEdit
                    width: 80
                    height: 20
                    text: qsTr("")
                    font.pixelSize: 12
                }
            }
        }

        Rectangle {
            id: sysParams
            width: 200
            height: 200
            color: "#afafaf"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Flow {
                id: sysFlow
                anchors.fill: parent
                spacing: 10
                //                rows: 2
                //                columns: 2
                Switch {
                    id: alarmSwitch
                    text: qsTr("Alarm")
                }

                Switch {
                    id: bluetoothSwitch
                    text: qsTr("Bluetooth")
                }

                Switch {
                    id: dndSwitch
                    text: qsTr("DND")
                }

                Switch {
                    id: lockedSwitch
                    text: qsTr("Locked")
                }
            }
        }
    }
}
