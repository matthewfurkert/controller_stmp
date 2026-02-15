import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane {
    property var workspace
    background: Rectangle {
        color: "green"
    }
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 0

        Button {
            text: "Home"
            Layout.fillWidth: true
            onClicked: workspace.replace(workspace.home, StackView.Immediate)
        }
        Item { Layout.fillHeight: true }
        Button {
            text: "GPIO"
            Layout.fillWidth: true
            onClicked: workspace.replace(workspace.gpio, StackView.Immediate)
        }
        Item { Layout.fillHeight: true }
        Button {
            text: "I2C"
            Layout.fillWidth: true
            onClicked: workspace.replace(workspace.i2c, StackView.Immediate)
        }
        Item { Layout.fillHeight: true }
        Button {
            text: "CAN"
            Layout.fillWidth: true
            onClicked: workspace.replace(workspace.can, StackView.Immediate)
        }
    }
}
