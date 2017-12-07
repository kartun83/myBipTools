import QtQuick 2.7
import QtQuick.Layouts 1.3
import "Utitilies.js" as Utils

Item {
    width: 178
    height: 178

    Layout.leftMargin: 10

    Rectangle {
        property string basePath: 'Background.Image'
        x: Utils.getNestedValue(jsonParser, basePath).X
        y: Utils.getNestedValue(jsonParser, basePath).Y
        border.color: "green"
        border.width: 2
        Image {
            id: background
            source: fileHelper.getFilename(
                        Utils.getNestedValue(
                            jsonParser, parent.basePath).ImageIndex + '.png')
        }
    }

    //    Rectangle {
    //        property string basePath: 'Time.Hours.Tens'
    //        x: Utils.getNestedValue(jsonParser, basePath).X
    //        y: Utils.getNestedValue(jsonParser, basePath).Y
    //        Image {
    //            id: hoursTens
    //            source: fileHelper.getFilename(
    //                        Utils.getNestedValue(
    //                            jsonParser, parent.basePath).ImageIndex + '.png')
    //            //            onSourceChanged: {
    //            //                console.log("Eval:" + Utils.getNestedValue(jsonParser,
    //            //                                                           parent.basePath))
    //            //            }
    //        }
    //    }

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
}
