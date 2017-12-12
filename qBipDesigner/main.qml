import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import MyCustomClasses 1.0

import "Utitilies.js" as Utils

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Amazfit BIP watchface designer")
    id: app
    property ApplicationWindow appWindow: app
    property var jsonParser
    property var jsonData

    property var globalSettings

    FileHelper {
        id: fileHelper
        //filename: textInput.text
        //onDirectoryChanged: fileDialog.notifyRefresh()
    }

    //    DesignPreview {
    //    }
    Page1 {
    }

    Component.onCompleted: {
        console.log("Initalizing global parameters in main.onCreated")
        app.globalSettings = new Object()
        app.globalSettings.Battery = '53'
        app.globalSettings.Steps = '1234'
        app.globalSettings.StepsGoal = '10000'
        app.globalSettings.Calories = '68'
        app.globalSettings.Pulse = '112'
        var today = new Date()
        var h = Utils.checkTime(today.getHours())
        var m = Utils.checkTime(today.getMinutes())
        var s = Utils.checkTime(today.getSeconds())
        app.globalSettings.time = h + ":" + m + ":" + s
        //globalSettings.time = today.toLocaleTimeString()
        console.log(app.globalSettings.time)
        //globalSettings.date = d.getDate()
    }

    onWindowStateChanged: {

    }
}
