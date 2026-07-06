import QtQuick
import QtQuick.Controls

import "components"

Pane {
    id: root

    width: Screen.width; height: Screen.height
    padding: 0

    background: Image {
        anchors.fill: parent
        source: "background.png"
    }

    Rectangle { anchors.fill: parent; color: '#9a13080c' }

    Row {
        id: content
        anchors.centerIn: parent
        z: 1

        spacing: 10

        UserCard {
            username: "Johnny Silverhand"
            picture: "../assets/johnny.png"
        }

        Form {
            id: form

            realUserName: "Robert John Linder"
        }
    }

    Component.onCompleted: forceActiveFocus(form)

    Connections {
        target: form

        function onPasswordEnter() {
            // Log in
        }
    }
}