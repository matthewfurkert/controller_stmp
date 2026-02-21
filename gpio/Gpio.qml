import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

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
            spacing: 80   // Creates even vertical spacing between the three switches

            // === RED SWITCH ===
            Switch {
                id: switchRed
                scale: 2.1
                text: qsTr("Red")
                onClicked: gpioRed.toggle()

                indicator: Rectangle {
                    implicitWidth: 54
                    implicitHeight: 30
                    x: switchRed.leftPadding
                    y: Math.round((parent.height - height) / 2)
                    radius: 15
                    color: switchRed.checked ? "#f87171" : "#e5e7eb"
                    border.color: switchRed.checked ? "#ef4444" : "#9ca3af"

                    Rectangle {  // handle
                        x: switchRed.checked ? parent.width - width - 3 : 3
                        y: 3
                        width: 24
                        height: 24
                        radius: 12
                        color: "white"
                        border.color: switchRed.checked ? "#ef4444" : "#9ca3af"
                    }
                }

                contentItem: Text {
                    leftPadding: switchRed.indicator.width + switchRed.spacing
                    text: switchRed.text
                    font: switchRed.font
                    color: "#b91c1c"
                    verticalAlignment: Text.AlignVCenter
                }
            }


            // === ORANGE SWITCH ===
            Switch {
                id: switchOrange
                scale: 2.1
                text: qsTr("Orange")
                onClicked: gpioOrange.toggle()

                indicator: Rectangle {
                    implicitWidth: 54
                    implicitHeight: 30
                    x: switchOrange.leftPadding
                    y: Math.round((parent.height - height) / 2)
                    radius: 15
                    color: switchOrange.checked ? "#fb923c" : "#e5e7eb"
                    border.color: switchOrange.checked ? "#f97316" : "#9ca3af"

                    Rectangle {  // handle
                        x: switchOrange.checked ? parent.width - width - 3 : 3
                        y: 3
                        width: 24
                        height: 24
                        radius: 12
                        color: "white"
                        border.color: switchOrange.checked ? "#f97316" : "#9ca3af"
                    }
                }

                contentItem: Text {
                    leftPadding: switchOrange.indicator.width + switchOrange.spacing
                    text: switchOrange.text
                    font: switchOrange.font
                    color: "#b45309"
                    verticalAlignment: Text.AlignVCenter
                }
            }

            // === GREEN SWITCH ===
            Switch {
                id: switchGreen
                scale: 2.1
                text: qsTr("Green")
                onClicked: gpioGreen.toggle()

                indicator: Rectangle {
                    implicitWidth: 54
                    implicitHeight: 30
                    x: switchGreen.leftPadding
                    y: Math.round((parent.height - height) / 2)
                    radius: 15
                    color: switchGreen.checked ? "#4ade80" : "#e5e7eb"
                    border.color: switchGreen.checked ? "#22c55e" : "#9ca3af"

                    Rectangle {  // handle
                        x: switchGreen.checked ? parent.width - width - 3 : 3
                        y: 3
                        width: 24
                        height: 24
                        radius: 12
                        color: "white"
                        border.color: switchGreen.checked ? "#22c55e" : "#9ca3af"
                    }
                }

                contentItem: Text {
                    leftPadding: switchGreen.indicator.width + switchGreen.spacing
                    text: switchGreen.text
                    font: switchGreen.font
                    color: "#15803d"
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
}
