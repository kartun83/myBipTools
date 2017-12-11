import QtQuick 2.9

PreviewParametersForm {

    Component.onCompleted: {
        // Perform binding with app.globalSettings
        console.log("Initalizing bindings from settings data model")
        timeEditText = Qt.binding(function () {
            return app.globalSettings.time
        })

        calloriesEditText = Qt.binding(function () {
            return app.globalSettings.Callories
        })
        stepsEditText = Qt.binding(function () {
            return app.globalSettings.Steps
        })
        stepsGoalEditText = Qt.binding(function () {
            return app.globalSettings.StepsGoal
        })
        dateEditText = Qt.binding(function () {
            return app.globalSettings.Date
        })

        batteryEditText = Qt.binding(function () {
            return app.globalSettings.Battery
        })
    }
}
