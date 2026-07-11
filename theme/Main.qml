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

    ComboBox {
        id: sessionSelector
        model: sessionModel
        textRole: "name"
    }

    ListModel { id: userList }
    Instantiator {
        model: userModel
        delegate: QtObject {
            Component.onCompleted: userList.append({
                "name": model.name,
                "realName": model.realName || model.name,
                "icon": model.icon || ""
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