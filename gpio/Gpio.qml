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
            onClicked: gpioRed.toggle()
            indicator: Rectangle {
                implicitWidth: 72; implicitHeight: 72; radius: 6
                border.color: checkRed.checked ? "#ef4444" : "#9ca3af"
                color: checkRed.checked ? "#f87171" : "white"
                Text { anchors.centerIn: parent; text: "✔"; font.pixelSize: 24; color: "white"; visible: checkRed.checked }
            }
            contentItem: Text {
                text: checkRed.text; color: "#b91c1c"; leftPadding: 72
                font.pixelSize: 24; verticalAlignment: Text.AlignVCenter
            }
        }

        CheckBox {
            id: checkOrange
            text: qsTr("Orange")
            onClicked: gpioOrange.toggle()
            indicator: Rectangle {
                implicitWidth: 72; implicitHeight: 72; radius: 6
                border.color: checkOrange.checked ? "#f97316" : "#9ca3af"
                color: checkOrange.checked ? "#fb923c" : "white"
                Text { anchors.centerIn: parent; text: "✔"; font.pixelSize: 24; color: "white"; visible: checkOrange.checked }
            }
            contentItem: Text {
                text: checkOrange.text; color: "#b45309"; leftPadding: 72
                font.pixelSize: 24; verticalAlignment: Text.AlignVCenter
            }
        }

        CheckBox {
            id: checkGreen
            text: qsTr("Green")
            onClicked: gpioGreen.toggle()
            indicator: Rectangle {
                implicitWidth: 72; implicitHeight: 72; radius: 6
                border.color: checkGreen.checked ? "#22c55e" : "#9ca3af"
                color: checkGreen.checked ? "#4ade80" : "white"
                Text { anchors.centerIn: parent; text: "✔"; font.pixelSize: 24; color: "white"; visible: checkGreen.checked }
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

        // Spacer to push Switch 25% down
        Item {
            width: parent.width
            height: parent.height * 0.25
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
        Button {
            id: lightShowButton
            text: qsTr("Light\nShow")
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: switchAuto.checked
            opacity: switchAuto.checked ? 1.0 : 0.2

            contentItem: Text {
                text: lightShowButton.text
                color: "#9ca3af"; font.pixelSize: 24; font.bold: true
                horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                implicitWidth: 160
                implicitHeight: 160
                radius: 10
                color: lightShowButton.pressed ? "#7c3aed" : "#8b5cf6"

                Behavior on color { ColorAnimation { duration: 150 } }
            }

            // onClicked: {
            //     // light show logic
            // }
        }
    }
}
