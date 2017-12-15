import QtQuick 2.9
import QtQml 2.2

Item {
    id: movingShortcuts
    signal keyboardMovement(int direction)

    Shortcut {
        id: moveLeftShortcut
        autoRepeat: false
        sequence: StandardKey.MoveToPreviousChar
        onActivated: {
            console.log("left")
            movingShortcuts.keyboardMovement(1)
        }
    }
    Shortcut {
        id: moveRightShortcut
        autoRepeat: false
        sequence: StandardKey.MoveToNextChar
        onActivated: {
            console.log("right")
            movingShortcuts.keyboardMovement(2)
        }
    }
    Shortcut {
        id: moveUpShortcut
        autoRepeat: false
        sequence: StandardKey.MoveToPreviousLine
        onActivated: {
            console.log("up")
            movingShortcuts.keyboardMovement(3)
        }
    }
    Shortcut {
        id: moveDownShortcut
        autoRepeat: false
        sequence: StandardKey.MoveToNextLine
        onActivated: {
            console.log("down")
            movingShortcuts.keyboardMovement(4)
        }
    }

    onKeyboardMovement: {
        console.log("Keyboard movement detected in Moving shortcut")
        if (app.selectedElement) {
            switch (direction) {
            case 1:
                if (app.selectedElement.topRect.x > 0) {
                    app.selectedElement.topRect.x = app.selectedElement.topRect.x - 1
                }
                break
            case 2:
                if (app.selectedElement.topRect.x < mainUI.dpReqWidth) {
                    app.selectedElement.topRect.x = app.selectedElement.topRect.x + 1
                }
                break
            case 3:
                if (app.selectedElement.topRect.y > 0) {
                    app.selectedElement.topRect.y = app.selectedElement.topRect.y - 1
                }
                break
            case 4:
                if (app.selectedElement.topRect.y < mainUI.dpReqHeight) {
                    app.selectedElement.topRect.y = app.selectedElement.topRect.y + 1
                }
                break
            }
            app.keyboardMovement(direction)
        }
    }
}
