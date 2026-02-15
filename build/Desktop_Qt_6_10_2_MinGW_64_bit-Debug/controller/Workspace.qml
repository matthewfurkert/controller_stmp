import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

StackView {
    id: mainStack
    initialItem: homeScreen  // Start with Home screen by default

    property alias home: homeScreen
    property alias gpio: gpioScreen

    // Home Screen Component
    Component {
        id: homeScreen
        Rectangle {
            color: "lightblue"
            anchors.fill: parent

            Label {
                anchors.centerIn: parent
                text: "Alpha Mini"
                font.pixelSize: 24
                font.bold: true
                color: "black"
            }
        }
    }

    // GPIO Screen Component
    Component {
        id: gpioScreen
        Rectangle {
            color: "lightgreen"
            anchors.fill: parent

            Label {
                anchors.centerIn: parent
                text: "GPIO Test"
                font.pixelSize: 24
                font.bold: true
                color: "black"
            }
        }
    }
}
