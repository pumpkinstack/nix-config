import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Item {
    id: workspaces

    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    // Get workspace list from Hyprland
    property var workspaceList: Hyprland.workspaces

    RowLayout {
        id: row
        spacing: 4

        Repeater {
            model: workspaceList

            delegate: Item {
                id: wsButton

                property bool isActive: modelData.id === Hyprland.focusedMonitor.activeWorkspace.id

                implicitWidth: 28
                implicitHeight: 28

                // Click to switch workspace
                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + modelData.id)
                }

                // Background circle
                Rectangle {
                    anchors.centerIn: parent
                    width: isActive ? 20 : 10
                    height: width
                    radius: width / 2
                    color: isActive ? "#f5c2e7" : "#6c7086"

                    // Smooth size transition when active changes
                    Behavior on width {
                        NumberAnimation {
                            duration: 150
                            easing.type: Easing.OutCubic
                        }
                    }

                    Behavior on color {
                        ColorAnimation { duration: 150 }
                    }
                }
            }
        }
    }
}
