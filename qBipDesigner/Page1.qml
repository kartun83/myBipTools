import QtQuick 2.9
import QtQuick.Dialogs 1.2
import MyBipTools 1.0

Page1Form {
    id: mainPage
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
            app.validateJson(jsonData)
            jsonParser = JSON.parse(jsonData)

            console.log("Image:" + jsonParser.Background.Image.ImageIndex)
            //console.log(fileHelper.fileContent)
        }
        onRejected: {
            console.log("Canceled")
        }
        //Component.onCompleted: visible = true
    }
    //    myCanvas.onPaint: {
    //        var ctx = getContext("2d")
    //        ctx.fillStyle = Qt.rgba(1, 0, 0, 1)
    //        ctx.fillRect(0, 0, width, height)
    //    }

    //    gridCanvas.onPaint: {
    //        var ctx = gridCanvas.getContext("2d")

    //        ctx.fillStyle = "white"
    //        ctx.fillRect(0, 0, gridCanvas.width, gridCanvas.height)

    //        ctx.lineWidth = 15
    //        ctx.strokeStyle = "red"
    //        ctx.beginPath()
    //        ctx.moveTo(5, 0)
    //        ctx.lineTo(5, gridCanvas.height)
    //        //ctx.closePath()
    //        ctx.stroke()
    //    }
    function resizePreview() {
        //        console.log("Resizing:", dpScaledPreview.height / dpReqHeight,
        //                    dpScaledPreview.width / dpReqWidth)
        //        console.log("Scaled rect:" + dpScaledRect.width + ':' + dpScaledRect.height)
        dpScaledPreview.scale = Math.min(dpScaledRect.height / dpReqHeight,
                                         dpScaledRect.width / dpReqWidth)
    }

    function drawGrid() {
        //if (mySettingsModel.ShowGrid == true) {
        if (app.gridEnabled == true) {
            console.log("Enable grid")
            myCanvas.visible = true
            var ctx = myCanvas.getContext("2d")
            if (ctx) {

                ctx.lineWidth = 50

                //ctx.strokeStyle = ctx.createPattern(
                //            "white", Qt.CrossPattern)//Qt.Dense7Pattern)
                console.log("Drawing grid with:", app.gridColor)
                ctx.fillStyle = ctx.createPattern(app.gridColor,
                                                  Qt.CrossPattern)
                ctx.beginPath()

                ctx.fillRect(
                            0, 0,
                            dpScaledPreview.bgImage.width * dpScaledPreview.scale,
                            dpScaledPreview.bgImage.height * dpScaledPreview.scale)

                ctx.stroke()
                myCanvas.requestPaint()
            }
        } else {
            console.log("Disabling grid")
            myCanvas.visible = false
        }
    }
}
