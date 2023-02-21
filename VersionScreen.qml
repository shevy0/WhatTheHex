import QtQuick 2.0
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 6.2

Item {
    id: item1
    anchors.fill: parent
    width: 480
    height: 620

    function request() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "https://up.kuba-orlik.name/informatyka-stosowana-3/programowanie-aplikacji-mobilnych/wersja.txt");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var response = xhr.responseText;
                text2.text = response;
            }
        }
        xhr.send();
    }

    Component.onCompleted: {
        request();
    }

    Text {
        id: text1
        color: "#ff0000"
        text: qsTr("Aktualna wersja:")
        anchors.top: parent.top
        font.pixelSize: 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 49
        font.family: "Arial"
    }

    Text {
        id: text2
        color: "#ff0000"
        text: qsTr("")
        anchors.top: parent.top
        font.pixelSize: 30
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Arial"
        anchors.topMargin: 95
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