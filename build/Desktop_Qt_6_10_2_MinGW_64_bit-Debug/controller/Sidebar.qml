import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane {
    id: sidebar
    property StackView stackView
    background: null
    padding: 0
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 0
        spacing: 0

        Button {
            text: "Home"
            Layout.fillHeight: true
            Layout.fillWidth: true
            background: null
            onClicked: stackView.replace(homeComponent, StackView.Immediate)
        }

        Button {
            text: "GPIO"
            Layout.fillHeight: true
            Layout.fillWidth: true
            background: null
            onClicked: stackView.replace(gpioComponent, StackView.Immediate)
        }
    }
    // Component definitions for lazy loading
    Component {
        id: homeComponent
        Home {}
    }

    Component {
        id: gpioComponent
        Gpio {}
    }
}
