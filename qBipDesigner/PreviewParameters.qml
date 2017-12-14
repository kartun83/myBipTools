import QtQuick 2.9

PreviewParametersForm {

    // Stupid, need to define two way binding separatly
    Binding {
        target: mySettingsModel
        property: "Battery"
        value: batteryEditText
    }

    Binding {
        target: mySettingsModel
        property: "Steps"
        value: stepsEditText
    }

    Binding {
        target: mySettingsModel
        property: "StepsGoal"
        value: stepsGoalEditText
    }

    Binding {
        target: mySettingsModel
        property: "Calories"
        value: calloriesEditText
    }

    Binding {
        target: mySettingsModel
        property: "Pulse"
        value: pulseEditText
    }

    Binding {
        target: mySettingsModel
        property: "Time"
        value: timeEditText
    }

    Binding {
        target: mySettingsModel
        property: "Steps"
        value: stepsEditText
    }

    Binding {
        target: mySettingsModel
        property: "StepsGoal"
        value: stepsGoalEditText
    }

    Binding {
        target: mySettingsModel
        property: "Calories"
        value: calloriesEditText
    }

    Binding {
        target: mySettingsModel
        property: "Distance"
        value: distanceEditText
    }

    Binding {
        target: mySettingsModel
        property: "Date"
        value: dateEditText
    }

    Binding {
        target: mySettingsModel
        property: "WeatherDay"
        value: weatherDayText
    }

    Binding {
        target: mySettingsModel
        property: "WeatherNight"
        value: weatherNightText
    }

    Binding {
        target: mySettingsModel
        property: "WeatherCurrent"
        value: weatherCurrentText
    }

    Binding {
        target: mySettingsModel
        property: "Alarm"
        value: alarmCheck
    }

    Binding {
        target: mySettingsModel
        property: "Bluetooth"
        value: bluetoothCheck
    }

    Binding {
        target: mySettingsModel
        property: "DND"
        value: dndCheck
    }

    Binding {
        target: mySettingsModel
        property: "Locked"
        value: lockedCheck
    }

    //    Binding {
    //        //target: mySettingsModel
    //        //property: "ShowGrid"
    //        target: appWindow
    //        property: enableGrid
    //        value: gridCheck
    //    }

    //    Component.onCompleted: {
    //        // Perform binding with app.globalSettings
    //        console.log("Initalizing bindings from settings data model")
    //        timeEditText = Qt.binding(function () {
    //            return app.globalSettings.time
    //        })

    //        calloriesEditText = Qt.binding(function () {
    //            return app.globalSettings.Callories
    //        })
    //        stepsEditText = Qt.binding(function () {
    //            return app.globalSettings.Steps
    //        })
    //        stepsGoalEditText = Qt.binding(function () {
    //            return app.globalSettings.StepsGoal
    //        })

    //        pulseEditText = Qt.binding(function () {
    //            return app.globalSettings.Pulse
    //        })

    //        dateEditText = Qt.binding(function () {
    //            return app.globalSettings.Date
    //        })

    //        batteryEditText = Qt.binding(function () {
    //            return app.globalSettings.Battery
    //        })
    //    }

    //    onStepsEditTextChanged: {
    //        app.globalSettings.Steps = stepsEditText
    //    }
}
