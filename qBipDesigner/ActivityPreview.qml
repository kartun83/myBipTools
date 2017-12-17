import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQml.Models 2.1
import QtQml 2.2
import QtQuick.Layouts 1.3

import "Utitilies.js" as Utils

Item {
    id: baseImg
    property string basePath
    property var jsonParser_lcl: jsonParser
    property alias modelData: itemModel.mydata

    ListModel {
        id: itemModel
        property int mydata

        onMydataChanged: {
            console.log("Rebuilding activity")
            itemModel.clear()
            var string = mydata.toString()
            for (var i = 0; i < string.length; i++) {
                itemModel.append({
                                     num: Number(string[i])
                                 })
            }
        }
    }

    Rectangle {
        x: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).TopLeftX
        y: Utils.getNestedValue(parent.jsonParser_lcl, parent.basePath).TopLeftY
        width: Utils.getNestedValue(parent.jsonParser_lcl,
                                    parent.basePath).BottomRightX - x
        height: Utils.getNestedValue(parent.jsonParser_lcl,
                                     parent.basePath).BottomRightY - y

        clip: true
        color: 'transparent'

        Row {
            spacing: Utils.getNestedValue(jsonParser_lcl, basePath).Spacing
            Repeater {
                model: itemModel
                Image {
                    id: timeImage
                    source: fileHelper.getFilename(
                                Utils.getNestedValue(
                                    jsonParser_lcl,
                                    basePath).ImageIndex + modelData + '.png')
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: //container.clicked(container.cellColor)
            {
                console.log("Eval2:" + fileHelper.getFilename(
                                Utils.getNestedValue(
                                    jsonParser_lcl,
                                    basePath).ImageIndex + '.png'))
            }
        }
        onWidthChanged: {
            validateViewBox(basePath, x, y, width, height)
        }

        onHeightChanged: {
            validateViewBox(basePath, x, y, width, height)
        }
    }
    Connections {
        target: app
        onJsonParserChanged: {
            console.log("detected json data change in activity preview")
            itemModel.modelReset()
            itemModel.mydataChanged()
            //            itemModel.onMydataChanged
        }
    }
}
