import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: window
    width: 800
    height: 480
    visible: true
    title: qsTr("Alpha Control Interface")

    FontLoader {
            id: prismaFont
            source: Qt.resolvedUrl("fonts/Prisma.ttf")
        }

    Page {
        padding: 10
        anchors.fill: parent
        font.family: prismaFont.name

        background: Rectangle {
            color: "red"
        }

        RowLayout {
            anchors.fill: parent
            spacing: 10

            Sidebar {
                id: zone1
                workspace: zone2
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
}
