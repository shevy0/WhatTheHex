import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 6.2

Window {
    id: window
    width: 480
    height: 620
    visible: true
    color: "#000000"
    title: qsTr("What the Hex?")

    StackView {
        id: stack
        initialItem: ("WelcomeScreen.qml")
        anchors.fill: parent
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}D{i:1}D{i:2}D{i:9}
}
##^##*/
