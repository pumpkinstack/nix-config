import QtQuick
import QtQuick.Layouts

Item {
    id: clock

    implicitWidth: clockText.implicitWidth
    implicitHeight: clockText.implicitHeight

    // Updates every second
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clockText.update()
    }

    Text {
        id: clockText
        anchors.centerIn: parent
        color: "#cdd6f4"
        font.family: "Cinzel"
        font.pixelSize: 13

        function update() {
            text = Qt.formatDateTime(new Date(), "hh:mm  dd MMM")
        }

        Component.onCompleted: update()
    }
}
