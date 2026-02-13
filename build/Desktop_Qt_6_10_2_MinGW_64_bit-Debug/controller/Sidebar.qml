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
                        text: "Settings"
                        Layout.fillWidth: true
                        onClicked: workspace.replace(workspace.settings, StackView.Immediate)
                    }
                    Item { Layout.fillHeight: true }
                    Button {
                        text: "Profile"
                        Layout.fillWidth: true
                        onClicked: workspace.replace(workspace.profile, StackView.Immediate)
                    }
                    Item { Layout.fillHeight: true }
                    Button {
                        text: "Help"
                        Layout.fillWidth: true
                        onClicked: workspace.replace(workspace.help, StackView.Immediate)
                    }
                }

}
