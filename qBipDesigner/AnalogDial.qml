import QtQuick 2.9
import QtGraphicalEffects 1.0
import "Utitilies.js" as Utils

Item {
    id: analogDialBase
    property string basePath
    property var jsonParser_lcl: jsonParser
    anchors.fill: parent
    Canvas {
        id: dialCanvas
        visible: true
        anchors.fill: parent
        property int offsetX: 88
        property int offsetY: 88

        transform: Rotation {
            origin.x: dialCanvas.offsetX
            origin.y: dialCanvas.offsetY
            angle: 270
        }

        onPaint: {

            dialCanvas.visible = true
            var ctx = dialCanvas.getContext("2d")
            if (ctx) {
                ctx.beginPath()
                ctx.lineWidth = 1

                //ctx.strokeStyle = ctx.createPattern(
                //            "white", Qt.CrossPattern)//Qt.Dense7Pattern)
                //console.log("Drawing grid with:", app.gridColor)
                //                ctx.fillStyle = ctx.createPattern(app.gridColor,
                //                                                  Qt.CrossPattern)
                ctx.strokeStyle = Qt.rgba(0, 0, 0, 1)

                //ctx.moveTo(88, 88)
                //                ctx.moveTo(0, 0)
                ctx.moveTo(-17 + offsetX, -2 + offsetY)
                ctx.lineTo(54 + offsetX, -2 + offsetY)
                ctx.lineTo(54 + offsetX, 1 + offsetY)
                ctx.lineTo(-17 + offsetX, 1 + offsetY)
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
}
