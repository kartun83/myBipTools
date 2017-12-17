import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQml 2.2
import "Utitilies.js" as Utils

Item {
    id: analogDialBase
    property string basePath
    property var jsonParser_lcl: jsonParser
    property string modelData
    property string center
    property string suffix
    property string dialColor
    // Required segment when splitting time in format hh:mm:ss,
    // starting from 0
    property int segment
    property int offsetX: Utils.getNestedValue(parent.jsonParser_lcl,
                                               parent.basePath + '.' + center).X
    property int offsetY: Utils.getNestedValue(parent.jsonParser_lcl,
                                               parent.basePath + '.' + center).Y
    // Base. 12 for hours, 60 for minutes/seconds
    property int base

    property int currentValue

    anchors.fill: parent

    onModelDataChanged: {
        // Recalculate currentValue
        var arr = modelData.split(':')
        currentValue = Number(arr[segment])
        console.log('Current value:' + currentValue)
    }

    Canvas {
        id: dialCanvas
        visible: true
        anchors.fill: parent

        //        property int offsetX: Utils.getNestedValue(
        //                                  parent.jsonParser_lcl,
        //                                  parent.basePath + '.' + center).X
        //        property int offsetY: Utils.getNestedValue(
        //                                  parent.jsonParser_lcl,
        //                                  parent.basePath + '.' + center).Y
        transform: Rotation {
            //            origin: parent.Center
            id: dialRotation
            origin.x: analogDialBase.offsetX //87 //offsetX + parent.x
            origin.y: analogDialBase.offsetY //offsetY + parent.x
            angle: (360 / base) * (currentValue % (base)) - 90
            //angle: 0
            //            onAngleChanged: {
            //                console.log('Calculated rotation angle:' + dialRotation.angle)
            //            }
        }

        Timer {
            interval: 100
            running: analogDialRotation
            repeat: true
            onTriggered: {
                dialRotation.angle = (dialRotation.angle + 5) % 360
                dialCanvas.requestPaint()
            }
        }
        onPaint: {

            dialCanvas.visible = true

            var ctx = dialCanvas.getContext("2d")
            if (ctx && parent.jsonParser_lcl) {
                ctx.beginPath()
                ctx.lineWidth = 1

                //ctx.strokeStyle = ctx.createPattern(
                //            "white", Qt.CrossPattern)//Qt.Dense7Pattern)
                //console.log("Drawing grid with:", app.gridColor)
                //                ctx.fillStyle = ctx.createPattern(app.gridColor,
                //                                                  Qt.CrossPattern)
                ctx.strokeStyle = dialColor //'green' //Qt.rgba(0, 0, 0, 1)

                //ctx.moveTo(88, 88)
                //                ctx.moveTo(0, 0)
                var coords = Utils.getNestedValue(jsonParser_lcl,
                                                  basePath).Shape

                //                ctx.moveTo(coords[0].X + offsetX, coords[0].Y + offsetY)
                //                console.log('Moving to:' + Number(
                //                                coords[0].X + offsetX) + '.' + Number(
                //                                coords[0].Y + offsetY))
                //                for (var i = 1; i < coords.length; i++) {
                //                    ctx.lineTo(coords[i].X + offsetX, coords[i].Y + offsetY)
                //                    console.log('Drawing to to:' + Number(
                //                                    coords[i].X + offsetX) + '.' + Number(
                //                                    coords[i].Y + offsetY))
                //                }
                ctx.moveTo(coords[0].X + analogDialBase.offsetX,
                           coords[0].Y + analogDialBase.offsetY)
                console.log('Moving to:' + Number(
                                coords[0].X + analogDialBase.offsetX) + '.' + Number(
                                coords[0].Y + analogDialBase.offsetY))
                for (var i = 1; i < coords.length; i++) {
                    ctx.lineTo(coords[i].X + analogDialBase.offsetX,
                               coords[i].Y + analogDialBase.offsetY)
                    console.log('Drawing to to:' + Number(
                                    coords[i].X + analogDialBase.offsetX) + '.' + Number(
                                    coords[i].Y + analogDialBase.offsetY))
                }
                //                analogDialBase.offsetX = 87 + 17
                //                analogDialBase.offsetY = 87 + 2
                //                ctx.moveTo(-17 + analogDialBase.offsetX,
                //                           -2 + analogDialBase.offsetY)
                //                ctx.lineTo(54 + analogDialBase.offsetX,
                //                           -2 + analogDialBase.offsetY)
                //                ctx.lineTo(54 + analogDialBase.offsetX,
                //                           2 + analogDialBase.offsetY)
                //                ctx.lineTo(-17 + analogDialBase.offsetX,
                //                           2 + analogDialBase.offsetY)
                //                ctx.lineTo(54, -2)
                //                ctx.lineTo(54, 5)
                //                ctx.lineTo(-17, 5)
                //                ctx.fillRect(
                //                            0, 0,
                //                            dpScaledPreview.bgImage.width * dpScaledPreview.scale,
                //                            dpScaledPreview.bgImage.height * dpScaledPreview.scale)
                ctx.stroke()
                ctx.closePath()
                dialCanvas.requestPaint()
            }
        }
    }

    Component.onCompleted: {
        dialCanvas.requestPaint()
    }

    onJsonParser_lclChanged: {
        // Recalculate offset
        if (jsonParser_lcl) {
            // Hide element if not defined in markup
            var abc = Utils.getNestedValue(jsonParser_lcl, basePath)
            if (typeof abc !== undefined) {
                var coords = Utils.getNestedValue(jsonParser_lcl,
                                                  basePath).Shape

                offsetX = Utils.getNestedValue(jsonParser_lcl,
                                               basePath + '.' + center).X
                offsetY = Utils.getNestedValue(jsonParser_lcl,
                                               basePath + '.' + center).Y
                dialColor = Utils.getNestedValue(jsonParser_lcl,
                                                 basePath).Color.replace('0x',
                                                                         '#')
                console.log('Evaluated color:', dialColor)
                dialCanvas.requestPaint()
                dialCanvas.visible = true
            } else {
                dialCanvas.visible = false
            }
        }
    }
}
