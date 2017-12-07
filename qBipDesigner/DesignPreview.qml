import QtQuick 2.7
import "Utitilies.js" as Utils

Item {
    width: 178
    height: 178

    Rectangle {
        property string basePath: 'Background.Image'
        x: Utils.getNestedValue(jsonParser, basePath).X
        y: Utils.getNestedValue(jsonParser, basePath).Y
        Image {
            id: background
            source: fileHelper.getFilename(
                        Utils.getNestedValue(
                            jsonParser, parent.basePath).ImageIndex + '.png')
        }
    }


    //    Rectangle {
    //        property string basePath: 'Time.Hours.Tens'
    //        x: Utils.getNestedValue(jsonParser, basePath).X
    //        y: Utils.getNestedValue(jsonParser, basePath).Y
    //        Image {
    //            id: hoursTens
    //            source: fileHelper.getFilename(
    //                        Utils.getNestedValue(
    //                            jsonParser, parent.basePath).ImageIndex + '.png')
    //            //            onSourceChanged: {
    //            //                console.log("Eval:" + Utils.getNestedValue(jsonParser,
    //            //                                                           parent.basePath))
    //            //            }
    //        }
    //    }
    TimePreview {
        basePath: 'Time.Hours.Tens'
    }

    TimePreview {
        basePath: 'Time.Hours.Ones'
    }
    TimePreview {
        basePath: 'Time.Minutes.Tens'
    }
    TimePreview {
        basePath: 'Time.Minutes.Ones'
    }
}
