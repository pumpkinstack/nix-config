import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

Item {
    id: statusItems

    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    RowLayout {
        id: row
        spacing: 16

        // Volume
        Item {
            implicitWidth: volumeRow.implicitWidth
            implicitHeight: volumeRow.implicitHeight

            property var sink: Pipewire.defaultSink

            RowLayout {
                id: volumeRow
                spacing: 4

                Text {
                    text: {
                        if (!parent.parent.sink) return "󰝟"
                        if (parent.parent.sink.audio.muted) return "󰝟"
                        let vol = Math.round(parent.parent.sink.audio.volume * 100)
                        if (vol > 70) return "󰕾"
                        if (vol > 30) return "󰖀"
                        return "󰕿"
                    }
                    color: "#cdd6f4"
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 14
                }

                Text {
                    text: {
                        if (!parent.parent.sink) return "0%"
                        if (parent.parent.sink.audio.muted) return "muted"
                        return Math.round(parent.parent.sink.audio.volume * 100) + "%"
                    }
                    color: "#cdd6f4"
                    font.family: "Cinzel"
                    font.pixelSize: 12
                }
            }

            // Scroll to change volume
            MouseArea {
                anchors.fill: parent
                onWheel: (event) => {
                    if (!parent.sink) return
                    let delta = event.angleDelta.y > 0 ? 0.05 : -0.05
                    parent.sink.audio.volume = Math.max(0, Math.min(1, parent.sink.audio.volume + delta))
                }
            }
        }

        // Battery
        Item {
            implicitWidth: batteryRow.implicitWidth
            implicitHeight: batteryRow.implicitHeight

            RowLayout {
                id: batteryRow
                spacing: 4

                Text {
                    text: {
                        let pct = Battery.percentage
                        if (Battery.charging) return "󰂄"
                        if (pct > 80) return "󰁹"
                        if (pct > 60) return "󰂁"
                        if (pct > 40) return "󰁾"
                        if (pct > 20) return "󰁻"
                        return "󰁺"
                    }
                    color: Battery.percentage < 20 ? "#f38ba8" : "#cdd6f4"
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 14
                }

                Text {
                    text: Battery.percentage + "%"
                    color: Battery.percentage < 20 ? "#f38ba8" : "#cdd6f4"
                    font.family: "Cinzel"
                    font.pixelSize: 12
                }
            }
        }

        // System Tray
        RowLayout {
            spacing: 6

            Repeater {
                model: SystemTray.items

                delegate: Item {
                    implicitWidth: 20
                    implicitHeight: 20

                    Image {
                        anchors.centerIn: parent
                        source: modelData.icon
                        width: 16
                        height: 16
                        smooth: true
                    }

                    MouseArea {
                        anchors.fill: parent
                        acceptedButtons: Qt.LeftButton | Qt.RightButton
                        onClicked: (event) => {
                            if (event.button === Qt.LeftButton)
                                modelData.activate()
                            else
                                modelData.secondaryActivate()
                        }
                    }
                }
            }
        }
    }
}
