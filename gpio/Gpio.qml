import QtQuick
import QtQuick.Controls.Basic

Rectangle {
    color: "transparent"

    Label {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: "GPIO Test"
        font.pixelSize: 24
        font.bold: true
        color: "black"
    }

    Column {
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.verticalCenter: parent.verticalCenter
        spacing: 20
        enabled: !switchAuto.checked
        opacity: switchAuto.checked ? 0.4 : 1.0

        CheckBox {
            id: checkRed
            text: qsTr("Red")
            checked: gpioRed.value
            onClicked: gpioRed.toggle()
            indicator: Rectangle {
                implicitWidth: 72; implicitHeight: 72; radius: 6
                border.color: checkRed.checked ? "#ef4444" : "#9ca3af"
                color: checkRed.checked ? "#f87171" : "white"
            }
            contentItem: Text {
                text: checkRed.text; color: "#b91c1c"; leftPadding: 72
                font.pixelSize: 24; verticalAlignment: Text.AlignVCenter
            }
        }

        CheckBox {
            id: checkOrange
            text: qsTr("Orange")
            checked: gpioOrange.value
            onClicked: gpioOrange.toggle()
            indicator: Rectangle {
                implicitWidth: 72; implicitHeight: 72; radius: 6
                border.color: checkOrange.checked ? "#f97316" : "#9ca3af"
                color: checkOrange.checked ? "#fb923c" : "white"
            }
            contentItem: Text {
                text: checkOrange.text; color: "#b45309"; leftPadding: 72
                font.pixelSize: 24; verticalAlignment: Text.AlignVCenter
            }
        }

        CheckBox {
            id: checkGreen
            text: qsTr("Green")
            checked: gpioGreen.value
            onClicked: gpioGreen.toggle()
            indicator: Rectangle {
                implicitWidth: 72; implicitHeight: 72; radius: 6
                border.color: checkGreen.checked ? "#22c55e" : "#9ca3af"
                color: checkGreen.checked ? "#4ade80" : "white"
            }
            contentItem: Text {
                text: checkGreen.text; color: "#166534"; leftPadding: 72
                font.pixelSize: 24; verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Column {
        anchors.right: parent.right
        anchors.top: parent.top
        width: parent.width * 0.5  // adjust width as needed
        height: parent.height
        spacing: 20

        // Spacer to push Switch 20% down
        Item {
            width: parent.width
            height: parent.height * 0.2
        }

        Switch {
            id: switchAuto
            text: qsTr("Manual / Auto")
            scale: 2
            contentItem: Text {
                text: switchAuto.text; color: "Blue"; leftPadding: 72
                font.pixelSize: 12; verticalAlignment: Text.AlignVCenter
            }
            anchors.horizontalCenter: parent.horizontalCenter
            checked: false
        }
        // Spacer to push Switch 20% down
        Item {
            width: parent.width
            height: parent.height * 0.2
        }
        Button {
            id: lightShowButton
            text: qsTr("Light Show")
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: switchAuto.checked

            font.pixelSize: 26
            font.bold: true
            padding: 22

            background: Rectangle {
                implicitWidth: 280
                implicitHeight: 85
                radius: 16
                color: enabled ? (parent.down ? "#1e40af" : "#2563eb") : "#94a3b8"
                border.color: "#1e40af"
                border.width: 3
            }

            contentItem: Text {
                text: parent.text
                font: parent.font
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            onClicked: {
                if (text === "Light Show") {
                    lightShow.start()
                    text = "Stop Show"
                } else {
                    lightShow.stop()
                    text = "Light Show"
                }
            }
        }
    }
}
