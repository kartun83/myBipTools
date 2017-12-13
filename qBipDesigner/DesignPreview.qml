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
    TimePreview {
        basePath: 'Time.Hours.Tens'
        id: hoursTens
        modelData: mySettingsModel.Time
        idx: 0
    }

    TimePreview {
        basePath: 'Time.Hours.Ones'
        id: hoursOnes
        modelData: mySettingsModel.Time
        idx: 1
    }
    TimePreview {
        basePath: 'Time.Minutes.Tens'
        id: minutesTens
        modelData: mySettingsModel.Time
        idx: 3
    }
    TimePreview {
        basePath: 'Time.Minutes.Ones'
        id: minutesOnes
        modelData: mySettingsModel.Time
        idx: 4
    }

    TimePreview {
        basePath: 'Time.Seconds.Tens'
        id: secondsTens
        modelData: mySettingsModel.Time
        idx: 6
    }
    TimePreview {
        basePath: 'Time.Seconds.Ones'
        id: secondsOnes
        modelData: mySettingsModel.Time
        idx: 7
    }
    // Date
    DatePreviewSeparate {
        id: dateTextPreviewSeparate1
        basePath: 'Date.MonthAndDay'
        modelData: mySettingsModel.DateMonth
        suffix: 'Separate.Month'
        checkAttr: 'TwoDigitsMonth'
    }
    DatePreviewSeparate {
        id: dateTextPreviewSeparate2
        basePath: 'Date.MonthAndDay'
        modelData: mySettingsModel.DateDay
        suffix: 'Separate.Day'
        checkAttr: 'TwoDigitsDay'
    }

    //    DatePreview {
    //        id: dateTextPreview2
    //        basePath: 'Date.MonthAndDay.OneLine'
    //        //basePath: 'MonthAndDay.Separate'
    //        modelData: mySettingsModel.Date
    //    }
    BaseXYPreview {
        basePath: 'Date.WeekDay'
        id: dateWeekdayPreview
        modelData: mySettingsModel.DayNumber
    }

    // Activity
    ActivityPreview {
        id: steps
        basePath: "Activity.Steps"
        modelData: mySettingsModel.Steps
    }
    ActivityPreview {
        id: calories
        basePath: "Activity.Calories"
        modelData: mySettingsModel.Calories
    }
    ActivityPreview {
        id: pulse
        basePath: "Activity.Pulse"
        modelData: mySettingsModel.Pulse
    }

    // Weather
    WeatherPreview {
        id: weatherCurrent
        basePath: "Weather.Temperature.Current"
        modelData: mySettingsModel.WeatherCurrent
    }

    WeatherPreview {
        id: weatherToday
        basePath: "Weather.Temperature.Today.Separate.Day"
        modelData: mySettingsModel.WeatherDay
    }
    WeatherPreview {
        id: weatherNight
        basePath: "Weather.Temperature.Today.Separate.Night"
        modelData: mySettingsModel.WeatherNight
    }

    //    WeatherPreview {
    //        id: weatherToday
    //        basePath: "Weather.Temperature.Today.Separate.Day"
    //        modelData: mySettingsModel.Pulse
    //    }
    DistancePreview {
        id: distance
        basePath: "Activity.Distance"
        modelData: mySettingsModel.Distance
    }

    // Status Icons
    StatusPreview {
        id: bluetooth
        basePath: "Status.Bluetooth"
        modelData: mySettingsModel.Bluetooth
    }
    StatusPreview {
        id: alarm
        basePath: "Status.Alarm"
        modelData: mySettingsModel.Alarm
    }
    StatusPreview {
        id: lock
        basePath: "Status.Lock"
        modelData: mySettingsModel.Locked
    }
    StatusPreview {
        id: dnd
        basePath: "Status.DoNotDisturb"
        modelData: mySettingsModel.DND
    }

    // Battery
    BatteryIconPreview {
        id: batteryIconPreview
        basePath: "Battery.Icon"
        modelData: mySettingsModel.Battery
    }
    AdvancedXYPreview {
        id: batteryTextPreview
        basePath: "Battery.Text"
        modelData: mySettingsModel.Battery
    }
}
