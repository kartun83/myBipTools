import QtQuick 2.9

Item {
    id: movingShortcuts
    signal keyboardMovement

    Shortcut {
        id: moveLeftShortcut
        autoRepeat: false
        sequence: StandardKey.MoveToPreviousChar
        onActivated: {
            console.log("left")
            if (app.selectedElement) {
                if (app.selectedElement.topRect.x > 0) {
                    app.selectedElement.topRect.x = app.selectedElement.topRect.x - 1
                }
            }
        }
        Component.onCompleted: {
            moveLeftShortcut.activated.connect(
                        movingShortcuts.keyboardMovement())
        }
    }
    Shortcut {
        id: moveRightShortcut
        autoRepeat: false
        sequence: StandardKey.MoveToNextChar
        onActivated: {
            console.log("right")
            if (app.selectedElement) {
                if (app.selectedElement.topRect.x < mainUI.dpReqWidth) {
                    app.selectedElement.topRect.x = app.selectedElement.topRect.x + 1
                }
            }
        }
        Component.onCompleted: {
            moveRightShortcut.activated.connect(
                        movingShortcuts.keyboardMovement())
        }
    }
    Shortcut {
        id: moveUpShortcut
        autoRepeat: false
        sequence: StandardKey.MoveToPreviousLine
        onActivated: {
            console.log("up")
            if (app.selectedElement) {
                if (app.selectedElement.topRect.y > 0) {
                    app.selectedElement.topRect.y = app.selectedElement.topRect.y - 1
                }
            }
        }
        Component.onCompleted: {
            moveUpShortcut.activated.connect(movingShortcuts.keyboardMovement())
        }
    }
    Shortcut {
        id: moveDownShortcut
        autoRepeat: false
        sequence: StandardKey.MoveToNextLine
        onActivated: {
            console.log("down")
            if (app.selectedElement) {
                if (app.selectedElement.topRect.y < mainUI.dpReqHeight) {
                    app.selectedElement.topRect.y = app.selectedElement.topRect.y + 1
                }
            }
        }
        Component.onCompleted: {
            moveDownShortcut.activated.connect(
                        movingShortcuts.keyboardMovement())
        }
    }

    Component.onCompleted: {
        // Forward signal to application
        movingShortcuts.keybordMovement.connect(app.keybordMovement())
    }

    onKeyboardMovement: {
        console.log("Keyboard movement detected in Moving shortcut")
    }
}
