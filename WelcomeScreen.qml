import QtQuick 2.0
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 6.2

Item {
    id: item1
    anchors.fill: parent
    width: 480
    height: 620

    Text {
        id: text1
        height: 59
        color: "#ff0000"
        text: qsTr("What the Hex?!")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        font.pixelSize: 41
        horizontalAlignment: Text.AlignHCenter
        font.family: "Arial"
        font.styleName: "Bold"
        anchors.topMargin: 28
        anchors.rightMargin: 30
        anchors.leftMargin: 30
    }

    Button {
        id: button
        width: 209
        height: 43
        text: qsTr("Rozpocznij grę!")
        anchors.top: parent.top
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        hoverEnabled: true
        display: AbstractButton.TextBesideIcon
        font.bold: true
        font.family: "Arial"
        anchors.topMargin: 117
        onClicked: {
            stack.push("GameScreen.qml")
            request()
        }
        background: Rectangle {
            color: parent.down ? "red" : "red"
            radius: 21.5
        }
    }

    Button {
        id: button1
        width: 209
        height: 43
        text: qsTr("Informacje o wersji")
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        anchors.bottomMargin: 38
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        background: Rectangle {
            color: parent.down ? "red" : "red"
            radius: 21.5
        }
        hoverEnabled: true
        display: AbstractButton.TextBesideIcon
        font.family: "Arial"
        font.bold: true
        onClicked: {
            stack.push("VersionScreen.qml")
            request()
        }
    }
}