import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Item {
    id: item1
    width: 400
    height: 400
    property alias calloriesEditText: calloriesEdit.text
    property alias stepsGoalEditText: stepsGoalEdit.text
    property alias stepsEditText: stepsEdit.text
    property alias batteryEditText: batteryEdit.text
    property alias dateEditText: dateEdit.text
    property alias timeEditText: timeEdit.text
    //parent: none.none

    //    anchors.fill: parent
    ColumnLayout {
        id: column
        anchors.fill: parent

        Rectangle {
            id: timeParams
            //            width: 200
            //            height: 200
            color: "#7a6e6e"

            //            Layout.preferredHeight: 200
            Layout.preferredHeight: 100
            Layout.maximumHeight: 100
            Layout.fillWidth: true
            //            anchors.//            Layout.fillHeight: true
            Flow {
                id: flow1
                //anchors.bottomMargin: 124
                //                anchors.top: parent.top
                anchors.topMargin: 10
                spacing: 5

                //Layout.alignment: Qt.AlignVCenter
                anchors.fill: parent

                Text {
                    id: text1
                    text: qsTr("Time")
                    //anchors.verticalCenter: timeEdit.verticalCenter
                    font.pixelSize: 12
                }

                TextField {
                    id: timeEdit
                    width: 80
                    //height: 20
                    text: app.globalSettings.time //qsTr("")
                    font.pixelSize: 12
                }

                Text {
                    id: text2
                    text: qsTr("Date")
                    //anchors.verticalCenter: dateEdit.verticalCenter
                    font.pixelSize: 12
                }

                TextField {
                    id: dateEdit
                    width: 80
                    //height: 20
                    text: app.globalSettings.Date //qsTr("")
                    font.pixelSize: 12
                }

                Text {
                    id: text3
                    text: qsTr("Battery")
                    //anchors.verticalCenter: batteryEdit.verticalCenter
                    font.pixelSize: 12
                }

                TextField {
                    id: batteryEdit
                    width: 80
                    //height: 20
                    text: app.globalSettings.Battery //qsTr("")
                    font.pixelSize: 12
                }
            }
        }

        Rectangle {
            id: fitParams
            //            width: 200
            //            height: 200
            color: "#afafaf"
            //            Layout.fillHeight: true
            Layout.preferredHeight: 100
            Layout.maximumHeight: 150
            Layout.fillWidth: true
            Flow {
                id: fitFlow
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.fill: parent
                //Layout.margins:
                spacing: 5
                Text {
                    id: text4
                    text: qsTr("Steps")
                    //anchors.verticalCenter: stepsEdit.verticalCenter
                    font.pixelSize: 12
                }

                TextField {
                    id: stepsEdit
                    width: 80
                    //height: 20
                    text: app.globalSettings.Steps //qsTr("")
                    selectionColor: "#00801c"
                    font.pixelSize: 12
                }

                Text {
                    id: text5
                    text: qsTr("Steps goal")
                    //anchors.verticalCenter: stepsGoalEdit.verticalCenter
                    font.pixelSize: 12
                }

                TextField {
                    id: stepsGoalEdit
                    width: 80
                    //height: 20
                    text: app.globalSettings.StepsGoal //qsTr("")
                    font.pixelSize: 12
                }

                Text {
                    id: text6
                    text: qsTr("Callories")
                    //anchors.verticalCenter: calloriesEdit.verticalCenter
                    font.pixelSize: 12
                }

                TextField {
                    id: calloriesEdit
                    width: 80
                    //height: 20
                    text: app.globalSettings.Callories //qsTr("")
                    font.pixelSize: 12
                }
            }
        }

        Rectangle {
            id: sysParams
            //            width: 200
            //            height: 200
            color: "#afafaf"
            Layout.preferredHeight: 100
            Layout.maximumHeight: 200
            //Layout.fillHeight: true
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
