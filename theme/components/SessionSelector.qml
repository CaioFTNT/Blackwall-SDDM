pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

ComboBox {
    id: root

    width: 300; height: 40

    background: null

    delegate: ItemDelegate {
        id: delegate

        required property var model
        required property int index

        background: null

        width: root.width; height: root.height
        contentItem: Text {
            text: delegate.model[root.textRole]
            verticalAlignment: Text.AlignVCenter

            leftPadding: !delegate.highlighted ? 0 : 5

            color: delegate.highlighted ? "#5DF4FE" : (root.currentIndex === delegate.index ? '#FFEA45' : "#FF6159")
            font.family: "Blender PRO"
            font.weight: 600
            font.pixelSize: 22

            elide: Text.ElideRight

            Behavior on leftPadding {
                PropertyAnimation { duration: 50; easing: Easing.OutQuad }
            }
        }
        highlighted: root.highlightedIndex === index
    }

    contentItem: Text {
        visible: !popup.visible
        text: root.currentText
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        color: "#FF6159"
        font.family: "Blender PRO"
        font.weight: 600
        font.pixelSize: 22

        elide: Text.ElideRight
    }

    indicator: null

    popup: Popup {
        id: popup

        background: null

        width: root.width
        height: contentItem.implicitHeight

        padding: 0

        contentItem: ListView {
            implicitHeight: contentHeight
            model: root.delegateModel
            currentIndex: root.highlightedIndex
        }

        onVisibleChanged: popupFade.running = true
        OpacityAnimator {
            id: popupFade

            target: popup.contentItem

            from: 0
            to: 1

            duration: 100
        }
    }

    Text {
        text: "SESSION"

        color: "#FF6159"

        font.family: "Blender PRO"
        font.pixelSize: 12
        font.weight: 600

        y: -14
    }

    Shape {
        id: frame

        width: popup.width; height: popup.visible ? popup.height : root.height

        ShapePath {
            fillColor: '#93231f'
            strokeWidth: 1
            strokeColor: '#cc4e47'
            joinStyle: ShapePath.MiterJoin

            startX: 0; startY: 0

            PathLine { x: 0; y: frame.height }

            PathLine { x: frame.width - 15; y: frame.height }
            PathLine { x: frame.width; y: frame.height - 15 }

            PathLine { x: frame.width; y: 0 }

            PathLine { x: 0; y: 0 }
        }

        Behavior on height {
            PropertyAnimation { duration: 100; easing: Easing.OutQuad }
        }
    }
}