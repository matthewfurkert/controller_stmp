import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

StackView {
    id: mainStack
    initialItem: homeScreen  // Start with Home screen by default

    property alias home: homeScreen
    property alias settings: settingsScreen
    property alias profile: profileScreen
    property alias help: helpScreen

    // Home Screen Component
    Component {
        id: homeScreen
        Rectangle {
            color: "lightblue"
            anchors.fill: parent

            Label {
                anchors.centerIn: parent
                text: "Home Screen"
                font.pixelSize: 24
                font.bold: true
                color: "black"
            }
        }
    }

    // Settings Screen Component
    Component {
        id: settingsScreen
        Rectangle {
            color: "lightgreen"
            anchors.fill: parent

            Label {
                anchors.centerIn: parent
                text: "Settings Screen"
                font.pixelSize: 24
                font.bold: true
                color: "black"
            }
        }
    }

    // Profile Screen Component
    Component {
        id: profileScreen
        Rectangle {
            color: "lightyellow"
            anchors.fill: parent

            Label {
                anchors.centerIn: parent
                text: "Profile Screen"
                font.pixelSize: 24
                font.bold: true
                color: "black"
            }
        }
    }

    // Help Screen Component
    Component {
        id: helpScreen
        Rectangle {
            color: "lightpink"
            anchors.fill: parent

            Label {
                anchors.centerIn: parent
                text: "Help Screen"
                font.pixelSize: 24
                font.bold: true
                color: "black"
            }
        }
    }
}
