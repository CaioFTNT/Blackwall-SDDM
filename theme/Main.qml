import QtQuick
import QtQuick.Controls
import QtMultimedia

import "components"

Pane {
    id: root

    property int userIndex: userModel.lastIndex

    width: Screen.width; height: Screen.height
    padding: 0

    background: Image {
        anchors.fill: parent
        source: "background.png"
    }
    Video {
        visible: config.boolValue("AnimatedBackground")
        anchors.fill: parent

        source: Qt.resolvedUrl("background.webm")
        muted: true

        autoPlay: true
        loops: MediaPlayer.Infinite
    }

    Row {
        id: content
        anchors.centerIn: parent
        z: 1

        spacing: 10

        UserCard {
            username: userList.count > 0 ? userList.get(0).name : ""
            picture: userList.count > 0 ? userList.get(0).icon : ""
        }

        Form {
            id: form

            realUserName: userList.count > 0 ? userList.get(0).realName : ""
        }
    }

    Rectangle {
        id: topBar

        color: "transparent"

        width: Screen.width - 100; height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        y: 40

        clip: false

        SessionSelector {
            id: sessionSelector
            model: sessionModel
            textRole: "name"
        }

        Clock {
            anchors.centerIn: parent
        }

        PowerOptions {
            anchors.right: parent.right
            height: parent.height
        }
    }

    ListModel { id: userList }
    Instantiator {
        model: userModel
        delegate: QtObject {
            Component.onCompleted: userList.append({
                "name": model.name,
                "realName": model.realName || model.name,
                "icon": !model.icon.includes("sddm/faces/.face.icon") ? model.icon : Qt.resolvedUrl("assets/user.svg")
            })
        }
    }

    Component.onCompleted: {
        forceActiveFocus(form)
    }

    Connections {
        target: form

        function onPasswordEnter(password) {
            sddm.login(userList.get(root.userIndex).name, password, sessionSelector.currentIndex)
        }
    }
}
