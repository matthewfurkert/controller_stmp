import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    readonly property bool embeddedDev: Qt.platform.os !== "windows" && Qt.platform.os !== "osx"

    id: window
    width: embeddedDev ? 480 : 800
    height: embeddedDev ? 800 : 480
    visible: true
    title: qsTr("Alpha Control Interface")

    FontLoader {
        id: prismaFont
        source: Qt.resolvedUrl("fonts/Prisma.ttf")
    }

    Page {
        anchors.centerIn: parent
        width: embeddedDev ? window.height : window.width
        height: embeddedDev ? window.width : window.height
        rotation: embeddedDev ? 90 : 0

        padding: 10
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
