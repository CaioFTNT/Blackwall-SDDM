import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

Rectangle {
    id: root

    required property string realUserName

    signal passwordEnter(password: string)

    width: 500; height: 300

    color: "transparent"

    Column {
        width: parent.width - 40
        anchors.centerIn: parent

        spacing: 5

        Image {
            source: "../assets/cynosure.svg"

            anchors.horizontalCenter: parent.horizontalCenter
        }
        Column {
            width: parent.width

            spacing: 20

            Rectangle {
                id: realName

                color: "transparent"
                width: parent.width; height: 45

                Text {
                    text: "USER"

                    color: "#FF6159"

                    font.family: "Blender PRO"
                    font.pixelSize: 12
                    font.weight: 600
                }
                Text {
                    text: root.realUserName

                    leftPadding: 5
                    anchors.bottom: parent.bottom
                    width: parent.width - leftPadding

                    color: "#FF6159"

                    font.family: "Blender PRO"
                    font.pixelSize: 32
                    font.weight: 600

                    elide: Text.ElideRight
                }

                Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: "#FF6159" }
            }
            Rectangle {
                id: password

                color: "transparent"
                width: parent.width; height: 45

                Text {
                    text: "ACCESS CODE"

                    color: "#FF6159"

                    font.family: "Blender PRO"
                    font.pixelSize: 12
                    font.weight: 600
                }
                TextInput {
                    id: passwordInput

                    echoMode: TextInput.Password
                    passwordCharacter: "*"
                    passwordMaskDelay: 0

                    leftPadding: 5
                    anchors.bottom: parent.bottom
                    width: parent.width - leftPadding - showPasswordButton.width
                    clip: true

                    color: "#FF6159"

                    focus: true

                    font.family: "Blender PRO"
                    font.pixelSize: 32
                    font.weight: 600

                    onAccepted: root.passwordEnter(text)
                }

                Button {
                    id: showPasswordButton

                    width: height; height: parent.height
                    anchors.right: parent.right

                    background: null

                    icon {
                        width: showPasswordButton.width; height: showPasswordButton.height
                        source: passwordInput.echoMode == TextInput.Password ? "../assets/eye-closed.svg" : "../assets/eye.svg"

                        color: "#FF6159"
                    }

                    onClicked: {
                        if (passwordInput.echoMode == TextInput.Password)
                            passwordInput.echoMode = TextInput.Normal
                        else
                            passwordInput.echoMode = TextInput.Password
                    }
                }

                Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: "#FF6159" }
            }
        }
    }
    Shape {
        id: frame

        anchors.fill: parent
        z: -1

        ShapePath {
            fillColor: "#210e15"

            strokeWidth: 2
            strokeColor: "#FF6159"

            startX: 0; startY: 0

            PathLine { x: 0; y: frame.height }
            PathLine { x: frame.width - 30; y: frame.height }
            PathLine { x: frame.width; y: frame.height - 30 }
            PathLine { x: frame.width; y: 0 }
            PathLine { x: 0; y: 0 }
        }

        ShapePath {
            fillColor: "#FF6159"

            strokeWidth: 0

            startX: frame.width - 25; startY: frame.height

            PathLine { x: frame.width; y: frame.height }
            PathLine { x: frame.width; y: frame.height - 25 }
        }
    }
}