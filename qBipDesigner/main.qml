import QtQuick 2.7
import QtQml 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
//import Qt.labs.platform 1.0 as Labs
import MyBipTools 1.0

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
    property var alignmentConv: myAlignment.AlignmentMap

    // Application behaivor params
    property bool gridEnabled
    property string gridColor: "white"
    property bool analogDialRotation: false //true

    property alias errorDialogRef: errorDialog

    // Global params
    property var selectedElement

    // Global signals
    signal keyboardMovement(int direction)

    //property var globalSettings: Settings
    FileHelper {
        id: fileHelper
        //filename: textInput.text
        //onDirectoryChanged: fileDialog.notifyRefresh()
    }

    MessageDialog {
        id: errorDialog
        icon: StandardIcon.Warning
        onAccepted: {
            this.visible = false

            //            console.log("And of course you could only agree.")
            //            Qt.quit()
        }
        //Component.onCompleted: visible = true
    }

    //    DesignPreview {
    //    }
    Page1 {
    }

    Component.onCompleted: {

        console.log("Default settings:")
        for (var prop in mySettingsModel) {
            console.log("Settings item:", prop, "=", mySettingsModel[prop])
        }
    }

    //    Component.onCompleted: {
    //        console.log("Initalizing global parameters in main.onCreated")
    //        app.globalSettings = new Object()
    //        app.globalSettings.Battery = '53'
    //        app.globalSettings.Steps = '1234'
    //        app.globalSettings.StepsGoal = '10000'
    //        app.globalSettings.Calories = '68'
    //        app.globalSettings.Pulse = '112'
    //        var today = new Date()
    //        var h = Utils.checkTime(today.getHours())
    //        var m = Utils.checkTime(today.getMinutes())
    //        var s = Utils.checkTime(today.getSeconds())
    //        app.globalSettings.time = h + ":" + m + ":" + s
    //        //globalSettings.time = today.toLocaleTimeString()
    //        console.log(app.globalSettings.time)
    //        //globalSettings.date = d.getDate()
    //    }
    onWindowStateChanged: {
        console.log("Window state changed")
    }

    onKeyboardMovement: {
        console.log("Keyboard movement detected in APP")
        selectedElementChanged()
    }

    onJsonParserChanged: {
        // Notify that we changed working set
        console.log("JSON parser data changed")
    }

    function validateJson(json) {
        try {
            var error = fileHelper.validateJson(json)
            if (error) {
                throw error
            }
        } catch (e) {

            //console.log(JSON.stringify(e))
            //if (e.name == "SyntaxError") {
            errorDialog.title = qsTr("JSon Parsing Error")
            errorDialog.text = e
            errorDialog.visible = true
            console.log("Parse error:", e)
            //} else
            //    throw e
        }
    }

    function validateViewBox(i_basePath, i_x, i_y, i_width, i_height) {
        if (i_width < 0 | i_height < 0) {
            var message = qsTr(
                        'View rectangle for %1 defined incorrectly.').arg(
                        i_basePath)
            var informative = qsTr(
                        'X:%1, Y:%2, Calculated width:%3, Calculated height:%4').arg(
                        i_x).arg(i_y).arg(i_width).arg(i_height)
            errorDialog.title = qsTr("Markup error")
            errorDialog.text = message
            errorDialog.informativeText = informative
            errorDialog.visible = true
        }
    }
}
