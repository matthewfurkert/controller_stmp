import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {
    padding: 10

    background: Rectangle {
        color: "red"
    }

    RowLayout {
        anchors.fill: parent
        spacing: 10

        Sidebar {
            id: zone1
            Layout.fillHeight: true
            Layout.preferredWidth: 100
        }
        Workspace {
            id: zone2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
