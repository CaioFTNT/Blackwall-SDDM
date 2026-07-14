import QtQuick

Text {
    id: root
    text: new Date().toLocaleString(Qt.locale(), "hh:mm")

    color: "#FF6159"
    font.family: "Blender PRO"
    font.weight: 700
    font.pixelSize: 32

    Timer {
        running: true; repeat: true
        onTriggered: root.text = new Date().toLocaleString(Qt.locale(), "hh:mm")
    }
}