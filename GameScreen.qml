import QtQuick 2.0
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 6.2

Item {
    id: item1
    anchors.fill: parent

    function newColorFind() {

        var arrayOfColorFunctions = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f']

        var randomColorString = '#'

        for (var i=0; i<9; i++) {
            for (var x = 0; x < 6; x++) {

                let index = Math.floor(Math.random() * 16)
                let value = arrayOfColorFunctions[index]

                randomColorString += value
            }
            console.log(randomColorString)
            koloryLista.append({
                colorCode:randomColorString, name:randomColorString
            })
            randomColorString = '#'
        }
    }
    function chooseWinner() {
        var winnerNumber = Math.floor(Math.random() * 9)
        var winnerColor = koloryLista.get(winnerNumber).colorCode
        text4.text = winnerColor.toString(16)
    }

    property int counter: 0
    width: 480
    height: 620

    Text {
        id: text4
        width: 410
        height: 44
        visible: true
        color: "#ff0000"
        text: qsTr("")
        anchors.top: parent.top
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold"
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Arial"
        anchors.topMargin: 80
    }

    ListModel {
        id: koloryLista
    }

    GridView {
        id: gridView
        height: 243
        visible: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 35
        anchors.leftMargin: 35
        anchors.topMargin: 180
        cellHeight: 70
        delegate: Item {
            x: 5
            height: 50
            Column {
                Rectangle {
                    width: 60
                    height: 60
                    color: colorCode
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.width: 3
                    border.color: "white"
                    radius: 30
                    MouseArea {
                        anchors.fill:parent
                        onClicked: {
                            if (parent.color == text4.text) {
                                counter+=1
                                text3.text=counter
                                gridView.visible=false
                                stack.push("WinnerScreen.qml")
                            } else {
                                parent.visible=false
                                counter+=1
                                text3.text=counter
                            }
                        }
                    }
                }
                spacing: 5
            }
        }
        model: koloryLista
        cellWidth: 70
    }

    Button {
        id: button
        width: 121
        height: 43
        text: qsTr("Losuj")
        anchors.top: parent.top
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        hoverEnabled: true
        display: AbstractButton.TextBesideIcon
        font.bold: true
        font.family: ".AppleSystemFont"
        anchors.topMargin: 20
        onClicked: {
            koloryLista.clear()
            counter = 0
            text3.text=counter
            gridView.visible=true
            newColorFind()
            chooseWinner()
        }
        background: Rectangle {
            color: parent.down ? "red" : "red"
            radius: 21.5
        }
    }

    Text {
        id: text3
        y: 502
        height: 18
        color: "#ff0000"
        text: qsTr("0")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        font.family: "Arial"
        anchors.bottomMargin: 100
        anchors.rightMargin: 312
        anchors.leftMargin: 155
    }

    Text {
        id: text5
        y: 507
        color: "#ff0000"
        text: qsTr("Licznik prób:")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        font.family: "Arial"
        anchors.bottomMargin: 95
        anchors.rightMargin: 360
        anchors.leftMargin: 35
    }

    Button {
        id: button1
        y: 552
        width: 50
        height: 50
        text: qsTr("←")
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 25
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
            stack.pop()
        }
    }
}