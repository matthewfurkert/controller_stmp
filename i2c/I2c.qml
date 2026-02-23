import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Rectangle {
    color: "transparent"
    implicitWidth: 520
    implicitHeight: 380

    Label {
        id: title
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: "I2C"
        font.pixelSize: 28
        font.bold: true
        color: "black"
    }

    Switch {
        id: sw
        scale: 2
        anchors.top: title.bottom
        anchors.topMargin: 12
        anchors.horizontalCenter: parent.horizontalCenter
        text: checked ? "Rotation Enabled" : "Rotation Disabled"
        checked: false
    }

    RowLayout {
        anchors.top: sw.bottom
        anchors.topMargin: 35
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 35
        spacing: 65

        Dial {
            id: dial
            Layout.preferredWidth: 190
            Layout.preferredHeight: 190
            from: 0
            to: 360
            value: 0
            enabled: sw.checked

            Text {
                anchors.centerIn: parent
                text: Math.round(dial.value) + "°"
                font.pixelSize: 22
                font.bold: true
                color: sw.checked ? "black" : "#777"
            }
        }

        Image {
            source: Qt.resolvedUrl("../assets/dial_no_background.png")
            fillMode: Image.PreserveAspectFit
            smooth: true
            antialiasing: true
            rotation: dial.value + 140
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 230
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
