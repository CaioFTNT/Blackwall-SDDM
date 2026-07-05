import QtQuick
import QtQuick.Shapes

Rectangle {
    id: root

    required property string username
    property string picture: "../assets/user.svg"

    property int size: 250
    property int bottomSize: 50

    readonly property int borderNotch: size / 25

    color: "transparent"

    width: size; height: size + bottomSize

    Rectangle {
        width: parent.width; height: width

        color: "transparent"

        Image {
            id: profilePicture
            width: root.size - 2; height: root.size - 2

            x: 1; y: 1

            anchors.centerIn: parent

            layer.enabled: true
            layer.effect: ShaderEffect {
                fragmentShader: "../assets/clipper.frag.qsb"
            }

            source: root.picture
            sourceSize: Qt.size(width, height)
        }
    }

    Rectangle {
        width: parent.width; height: root.bottomSize
        anchors.bottom: parent.bottom

        color: "transparent"

        z: 1

        Text {
            text: root.username

            color: "#210e15"

            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            horizontalAlignment: Text.Center

            font.family: "Blender PRO"
            font.pixelSize: 32
            font.weight: 600

            elide: Text.ElideRight
        }
    }

    Shape {
        id: frame
        anchors.fill: parent

        z: 1

        ShapePath {
            fillColor: "transparent"

            strokeWidth: 2
            strokeColor: "#FF6159"

            startX: 0
            startY: 0

            // Left notch
            PathLine {
                x: 0
                y: root.size / 6
            }
            PathLine {
                x: root.borderNotch
                y: root.size / 6 + root.borderNotch
            }
            PathLine {
                x: root.borderNotch
                y: frame.height - root.bottomSize - root.size / 6 - root.borderNotch
            }
            PathLine {
                x: 0
                y: frame.height - root.bottomSize - root.size / 6
            }

            // Bottom-left clip
            PathLine {
                x: 0
                y: frame.height - root.bottomSize / 3
            }
            PathLine {
                x: root.bottomSize / 3
                y: frame.height
            }

            // Right edge
            PathLine {
                x: frame.width
                y: frame.height
            }
            PathLine {
                x: frame.width
                y: 0
            }
            
            // Top edge
            PathLine {
                x: 0
                y: 0
            }
        }
    }

    Shape {
        id: frameBackground
        anchors.fill: parent

        z: -1

        ShapePath {
            fillColor: "#aa210e15"

            strokeWidth: 0

            startX: 0
            startY: 0

            // Left notch
            PathLine {
                x: 0
                y: root.size / 6
            }
            PathLine {
                x: root.borderNotch
                y: root.size / 6 + root.borderNotch
            }
            PathLine {
                x: root.borderNotch
                y: frame.height - root.bottomSize - root.size / 6 - root.borderNotch
            }
            PathLine {
                x: 0
                y: frame.height - root.bottomSize - root.size / 6
            }

            // Bottom-left clip
            PathLine {
                x: 0
                y: frame.height - root.bottomSize / 3
            }
            PathLine {
                x: root.bottomSize / 3
                y: frame.height
            }

            // Right edge
            PathLine {
                x: frame.width
                y: frame.height
            }
            PathLine {
                x: frame.width
                y: 0
            }
            
            // Top edge
            PathLine {
                x: 0
                y: 0
            }
        }
    }

    Shape {
        id: frameBottom
        anchors.fill: parent

        ShapePath {
            fillColor: "#FF6159"

            strokeWidth: 0

            startX: 0
            startY: frame.height - root.bottomSize


            // Bottom-left clip
            PathLine {
                x: 0
                y: frame.height - root.bottomSize / 3
            }
            PathLine {
                x: root.bottomSize / 3
                y: frame.height
            }

            // Right edge
            PathLine {
                x: frame.width
                y: frame.height
            }
            PathLine {
                x: frame.width
                y: frame.height - root.bottomSize
            }
            
            // Top edge
            PathLine {
                x: 0
                y: frame.height - root.bottomSize
            }
        }
    }
}
