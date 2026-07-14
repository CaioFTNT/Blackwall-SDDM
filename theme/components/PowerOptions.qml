import QtQuick
import QtQuick.Controls

Row {
    id: root

    Button {
        visible: sddm.canPowerOff

        width: height; height: parent.height

        icon {
            source: "../assets/poweroff.svg"
            width: width; height: height
            color: hovered ? "#5DF4FE" : "#FF6159"

            Behavior on color {
                PropertyAnimation { duration: 100 }
            }
        }
        background: null
        hoverEnabled: true

        onClicked: sddm.poweroff()
    }

    Button {
        visible: sddm.canReboot

        width: height; height: parent.height

        icon {
            source: "../assets/reboot.svg"
            width: width; height: height
            color: hovered ? "#5DF4FE" : "#FF6159"

            Behavior on color {
                PropertyAnimation { duration: 100 }
            }
        }
        background: null
        hoverEnabled: true

        onClicked: sddm.reboot()
    }
}