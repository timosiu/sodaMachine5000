import QtQuick 2.15

Item {
    property string imageId: ""
    property string imgSource: ""
    id: buttonItem
    signal buttonClicked
    width: 120; height: 180
    focus: false
    Image {
        id: imageId
        source: imgSource
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            parent.scale = 0.9
        }
        onReleased: {
            parent.scale = 1
            parent.focus = !parent.focus
            parent.buttonClicked()
        }
    }
    Rectangle{
        id: imgBorder
        color: "transparent"
        anchors.fill: imageId
        border.color: parent.focus ? "black" : "transparent"
        border.width: 4
    }

}
