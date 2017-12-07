import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import MyCustomClasses 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Amazfit BIP watchface designer")
    id: app
    property ApplicationWindow appWindow: app
    property var jsonParser

    FileHelper {
        id: fileHelper
        //filename: textInput.text
        //onDirectoryChanged: fileDialog.notifyRefresh()
    }

    DesignPreview {
    }

    Page1 {
    }
}
