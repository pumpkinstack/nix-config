import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import "."

PanelWindow {
    id: bar

    anchors {
        top: true
        left: true
        right: true
    }

    height: 36
    color: "transparent"

    // Reserve space so windows don't go under the bar
    exclusionMode: ExclusionMode.Exclusive

    // Blur background
    Rectangle {
        anchors.fill: parent
        color: "#cc1e1e2e"  // Catppuccin Mocha base with transparency
        radius: 0

        layer.enabled: true
        layer.effect: MultiEffect {
            blurEnabled: true
            blur: 1.0
            blurMax: 32
        }
    }

    // Bottom border accent
    Rectangle {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 1
        color: "#f5c2e7"  // Pink accent
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 0

        // Left — Workspaces
        Workspaces {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        }

        // Center — Clock
        Item { Layout.fillWidth: true }
        Clock {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
        Item { Layout.fillWidth: true }

        // Right — Status + Tray
        StatusItems {
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }
    }
}
