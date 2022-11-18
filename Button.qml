import QtQuick 2.15

Rectangle {
    property color backGroundColor: "white"
    property color borderColor: "black"
    property string buttonText: ""
    property string buttonId: ""
    property int buttonWidth: 360
    property int buttonHeight: 100
    signal buttonClicked
    signal pressAndHold

    id: buttonId
    width: buttonWidth; height: buttonHeight
    radius: 20
    border.width: 2

    color: backGroundColor
    border.color: borderColor

    Text {
        text: parent.buttonText
        anchors.centerIn: parent
        font.pixelSize: parent.height * 0.5
    }
    //Timer is for press & hold functionality
    Timer{
        id: pressTimer
        interval: 100
        repeat: true
        running: false
        onTriggered: {
            buttonId.pressAndHold()
        }
    }

    MouseArea{
        anchors.fill: parent
        onPressed: {
            parent.scale = 0.9
            parent.buttonClicked()
            pressTimer.running = true
        }
        onReleased: {
            parent.scale = 1
            pressTimer.running = false
            parent.buttonClicked()
        }

    }
}
