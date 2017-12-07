import QtQuick 2.7
import QtQuick.Dialogs 1.2

Page1Form {

    browseButton.onClicked: {
        console.log("Button Pressed. Entered text: " + jsonFilename.text)
        fileDialog.visible = true
    }

    refreshButton.onClicked: {
        console.log("Refreshing JSON from editor")
        jsonParser = JSON.parse(jsonData)
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        nameFilters: ["JSON file (*.json)"]
        selectExisting: true
        selectMultiple: false
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrl)
            //var file = Utils.readTextFile(fileDialog.fileUrl)
            //var JsonObject = JSON.parse(file)
            fileHelper.filename = fileDialog.fileUrl.toString()
            fileHelper.loadFile()
            jsonData = fileHelper.fileContent
            jsonParser = JSON.parse(jsonData)
            console.log("Image:" + jsonParser.Background.Image.ImageIndex)
            //console.log(fileHelper.fileContent)
        }
        onRejected: {
            console.log("Canceled")
        }
        //Component.onCompleted: visible = true
    }
}
