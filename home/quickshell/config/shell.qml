import Quickshell
import QtQuick
import Quickshell.Io

PanelWindow {
    anchors {
        top: true
        right: true
        left: true
    }
    implicitHeight: 22
    Text {
        id: clock
        anchors.centerIn: parent
        Process {
            id: dateProc
            command: ["date"]
            running: true
            stdout: StdioCollector {
                onStreamFinished: clock.text = this.text
            }
        }
        Timer {
            interval: 1000
            repeat: true
            running: true
            onTriggered: dateProc.running = true
        }
    }
}
