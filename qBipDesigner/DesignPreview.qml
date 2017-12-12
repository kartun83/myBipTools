import QtQuick 2.7
import QtQuick.Layouts 1.3
import "Utitilies.js" as Utils

Item {
    //width: 178
    //height: 178
    id: designPreviewTopBox
    property alias controlWidth: designPreviewTopBox.width
    property alias contolHeight: designPreviewTopBox.height
    //    property alias scale: designPreview.scale
    transformOrigin: Item.TopLeft

    Layout.leftMargin: 10

    Rectangle {
        id: designPreviewRect
        property string basePath: 'Background.Image'
        x: Utils.getNestedValue(jsonParser, basePath).X
        y: Utils.getNestedValue(jsonParser, basePath).Y
        Layout.fillHeight: parent.height
        Layout.fillWidth: parent.width
        Layout.alignment: Qt.AlignLeft | Qt.AlignTop

        border.color: "green"
        border.width: 2
        Image {
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            id: background
            source: fileHelper.getFilename(
                        Utils.getNestedValue(
                            jsonParser, parent.basePath).ImageIndex + '.png')
            //scale: 2.0
            //scale: 1.0
        }
    }

    // Time
    BaseXYPreview {
        basePath: 'Time.Hours.Tens'
        id: hoursTens
    }

    BaseXYPreview {
        basePath: 'Time.Hours.Ones'
        id: hoursOnes
    }
    BaseXYPreview {
        basePath: 'Time.Minutes.Tens'
        id: minutesTens
    }
    BaseXYPreview {
        basePath: 'Time.Minutes.Ones'
        id: minutesOnes
    }

    BaseXYPreview {
        basePath: 'Time.Seconds.Tens'
        id: secondsTens
    }
    BaseXYPreview {
        basePath: 'Time.Seconds.Ones'
        id: secondsOnes
    }
    // Date
    DatePreview {
        id: dateTextPreview
        basePath: 'Date.MonthAndDay.OneLine'
    }

    BaseXYPreview {
        basePath: 'Date.WeekDay'
        id: dateWeekdayPreview
    }

    // Activity
    ActivityPreview {
        id: steps
        basePath: "Activity.Steps"
    }
    ActivityPreview {
        id: calories
        basePath: "Activity.Calories"
    }
    ActivityPreview {
        id: pulse
        basePath: "Activity.Pulse"
    }

    // Status Icons
    StatusPreview {
        id: bluetooth
        basePath: "Status.Bluetooth"
    }
    StatusPreview {
        id: alarm
        basePath: "Status.Alarm"
    }
    StatusPreview {
        id: lock
        basePath: "Status.Lock"
    }
    StatusPreview {
        id: dnd
        basePath: "Status.DoNotDisturb"
    }

    // Battery
    BaseXYPreview {
        id: batteryIconPreview
        basePath: "Battery.Icon"
    }
    BaseXYPreview {
        id: batteryTextPreview
        basePath: "Battery.Text"
    }

    Component.onCompleted: {
        steps.modelData = Qt.binding(function () {
            return app.globalSettings.Steps
        })
        calories.modelData = Qt.binding(function () {
            return app.globalSettings.Calories
        })
        pulse.modelData = Qt.binding(function () {
            return app.globalSettings.Pulse
        })
    }
}
