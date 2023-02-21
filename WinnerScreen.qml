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
        id: text2
        color: "#ff0000"
        text: qsTr("Wygrałeś!")
        anchors.verticalCenter: parent.verticalCenter
        anchors.top: parent.top
        font.pixelSize: 60
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 50
        font.family: "Arial"
    }

    Button {
        id: button1
        y: 142
        width: 50
        height: 50
        text: qsTr("←")
        anchors.top: parent.top
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 142
        background: Rectangle {
            color: parent.down ? "red" : "red"
            radius: 21.5
        }
        font.bold: true
        display: AbstractButton.TextBesideIcon
        font.family: ".AppleSystemFont"
        hoverEnabled: true
        enabled: stack.depth > 1
        onClicked:
        {
            stack.push("WelcomeScreen.qml")
        }
    }
}