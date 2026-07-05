import QtQuick
import QtQuick.Controls

import "components"

Pane {
    id: root

    width: Screen.width; height: Screen.height

    background: Image {
        anchors.fill: parent
        source: "background.png"
    }

    Row {
        id: form
        anchors.centerIn: parent

        UserCard {
            username: "Johnny Silverhand"
            picture: "../assets/johnny.png"
        }

    }

    //Rectangle {anchors.fill: form; z: -1}
}