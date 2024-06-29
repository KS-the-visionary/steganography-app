import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects


// Main App Window
Window {
    id: window
    visible: true
    title: "Steganography App"
    width: 860; height: 600

    Rectangle {
        id: appBg
        width: 800; height: 550
        color: "#010101"
        anchors.centerIn: parent
        radius: 30
    }
}       
