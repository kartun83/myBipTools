import QtQuick 2.9
import QtQuick.Dialogs 1.2

Page1Form {

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
        console.log("Resizing:", dpScaledPreview.height / dpReqHeight,
                    dpScaledPreview.width / dpReqWidth)
        console.log("Scaled rect:" + dpScaledRect.width + ':' + dpScaledRect.height)
        dpScaledPreview.scale = Math.min(dpScaledRect.height / dpReqHeight,
                                         dpScaledRect.width / dpReqWidth)
    }

    //    function resizePreviewMax() {
    //        console.log("Responding to maximize")
    //        console.log("Scaled rect2:" + dpScaledRect.width + ':' + dpScaledRect.height)
    //        dpScaledPreview.scale = Math.max(dpScaledRect.height / dpReqHeight,
    //                                         dpScaledRect.width / dpReqWidth)
    //    }
}
