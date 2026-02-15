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
    Switch {
        id: unitsSwitch
        anchors.centerIn: parent
        scale: 2
        text: qsTr("OFF / ON")
    }
}
