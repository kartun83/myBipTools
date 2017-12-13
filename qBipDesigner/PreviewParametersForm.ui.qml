import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Item {
    id: item1
    //width: 400
    //height: 200
    property alias calloriesEditText: calloriesEdit.text
    property alias stepsGoalEditText: stepsGoalEdit.text
    property alias stepsEditText: stepsEdit.text
    property alias batteryEditText: batteryEdit.text
    property alias dateEditText: dateEdit.text
    property alias timeEditText: timeEdit.text
    property alias pulseEditText: pulseEdit.text
    property alias distanceEditText: distanceEdit.text
    property alias alarmCheck: alarmSwitch.checked
    property alias bluetoothCheck: bluetoothSwitch.checked
    property alias dndCheck: dndSwitch.checked
    property alias lockedCheck: lockedSwitch.checked

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
            Layout.preferredHeight: 50
            Layout.maximumHeight: 150
            Layout.fillWidth: true
            //            anchors.//            Layout.fillHeight: true
            RowLayout {

                //                id: flow1
                //                //anchors.bottomMargin: 124
                //                //                anchors.top: parent.top
                //                anchors.topMargin: 10
                spacing: 5
                Layout.preferredWidth: 250
                anchors.top: parent.top
                anchors.topMargin: 10

                //                //Layout.alignment: Qt.AlignVCenter
                anchors.fill: parent
                Text {
                    id: text1
                    text: qsTr("Time")
                    //anchors.verticalCenter: timeEdit.verticalCenter
                    font.pixelSize: 12
                }

                TextField {
                    id: timeEdit
                    Layout.preferredWidth: 80
                    //height: 20
                    text: mySettingsModel.Time //qsTr("")
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
                    Layout.preferredWidth: 80
                    text: mySettingsModel.Date
                    font.pixelSize: 12
                }

                Text {
                    id: text3
                    text: qsTr("Battery")
                    font.pixelSize: 12
                }

                TextField {
                    id: batteryEdit
                    Layout.preferredWidth: 80
                    text: mySettingsModel.Battery //qsTr("")
                    font.pixelSize: 12
                }
                Text {
                    id: text9
                    text: qsTr("Weather day")
                    font.pixelSize: 12
                }

                TextField {
                    id: weatherDayEdit
                    Layout.preferredWidth: 80
                    text: mySettingsModel.WeatherDay //qsTr("")
                    font.pixelSize: 12
                }
                Text {
                    id: text10
                    text: qsTr("Weather night")
                    font.pixelSize: 12
                }

                TextField {
                    id: weatherNightEdit
                    Layout.preferredWidth: 80
                    text: mySettingsModel.WeatherNight //qsTr("")
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
            Layout.preferredHeight: 50
            Layout.maximumHeight: 150
            Layout.fillWidth: true
            RowLayout {
                id: fitFlow
                anchors.top: parent.top
                anchors.topMargin: 10
                Layout.preferredWidth: 250
                //                anchors.fill: parent
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
                    Layout.preferredWidth: 80
                    //height: 20
                    text: mySettingsModel.Steps //qsTr("")
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
                    Layout.preferredWidth: 80
                    //height: 20
                    text: mySettingsModel.StepsGoal //qsTr("")
                    font.pixelSize: 12
                }

                Text {
                    id: text6
                    text: qsTr("Calories")
                    //anchors.verticalCenter: calloriesEdit.verticalCenter
                    font.pixelSize: 12
                }

                TextField {
                    id: calloriesEdit
                    Layout.preferredWidth: 80
                    //height: 20
                    text: mySettingsModel.Calories //qsTr("")
                    font.pixelSize: 12
                }
                Text {
                    id: text7
                    text: qsTr("Pulse")
                    //anchors.verticalCenter: calloriesEdit.verticalCenter
                    font.pixelSize: 12
                }

                TextField {
                    id: pulseEdit
                    Layout.preferredWidth: 80
                    //height: 20
                    text: mySettingsModel.Pulse //qsTr("")
                    font.pixelSize: 12
                }

                Text {
                    id: text8
                    text: qsTr("Distance")
                    //anchors.verticalCenter: calloriesEdit.verticalCenter
                    font.pixelSize: 12
                }

                TextField {
                    id: distanceEdit
                    Layout.preferredWidth: 80
                    //height: 20
                    text: mySettingsModel.Distance //qsTr("")
                    font.pixelSize: 12
                }
            }
        }

        Rectangle {
            id: sysParams
            //            width: 200
            //            height: 200
            color: "#afafaf"
            Layout.preferredHeight: 70
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
                    checked: mySettingsModel.Alarm
                }

                Switch {
                    id: bluetoothSwitch
                    text: qsTr("Bluetooth")
                    checked: mySettingsModel.Bluetooth
                }

                Switch {
                    id: dndSwitch
                    text: qsTr("DND")
                    checked: mySettingsModel.DND
                }

                Switch {
                    id: lockedSwitch
                    text: qsTr("Locked")
                    checked: mySettingsModel.Locked
                }
            }
        }
    }
}
