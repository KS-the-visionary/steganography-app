import QtQuick
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import QtQuick.Controls


// Main App Window
Window {
    id: window
    visible: true
    title: "Steganography App"
    width: 880; height: 630
    flags: Qt.Window | Qt.FramelessWindowHint
    color: "#00000000"
    onSceneGraphInitialized: loadAnim.running = true


    FontLoader {
        source: "font.ttf"
        id: jbm
    }
    
    ////////// Global Properties //////////
    property bool loadText: false
    property bool reduceWidth: false
    property bool switchPage: false
    property string msgText
    
    /////////////// ANIMATIONS /////////////////
    // App Load Animation

    // Window Open Animation
    NumberAnimation {
        id: loadAnim
        running: true
        target: appBg
        property: "scale"
        to: 1
        duration: 1500
        easing.type: Easing.OutExpo
        onFinished: loadText = true
    }
    /////////////// ANIMATIONS /////////////////

    // Main Display of the App UI
    Rectangle {
        id: appBg
        width: 800; height: 550
        color: "#010101"
        anchors.centerIn: parent
        radius: 30
        clip: true
        scale: 0

        // Close Button
        Image {
            source: "close.svg"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 20
            anchors.rightMargin: 20
            z: 2

            scale: closeBtn.containsMouse ? 1.5 : 1
            Behavior on scale { NumberAnimation { duration: 100 } }

            MouseArea {
                id: closeBtn
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: window.close()
            }
        }

        // Minimise Button
        Image {
            source: "minimise.svg"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 24
            anchors.rightMargin: 44
            z: 2

            scale: minimiseBtn.containsMouse ? 1.5 : 1
            Behavior on scale { NumberAnimation { duration: 100 } }

            MouseArea {
                id: minimiseBtn
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: window.showMinimized()
            }
        }

        // Info Button
        Image {
            source: "info.svg"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 20
            anchors.rightMargin: 68
            z: 2

            scale: infoBtn.containsMouse ? 1.5 : 1
            Behavior on scale { NumberAnimation { duration: 100 } }

            MouseArea {
                id: infoBtn
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
            }
        }

        // Custom Title Bar
        Rectangle {
            id: titleBar
            height: 60
            width: reduceWidth ? 690 : 708
            color: "#00000000"
            anchors.top: parent.top
            anchors.left: parent.left
            radius: 30
            z: 2

            MouseArea {
                id: titleBarMouse
                anchors.fill: parent
                hoverEnabled: true
            }

            DragHandler {
                onActiveChanged: if (active && titleBarMouse.containsMouse) {window.startSystemMove()}
            }
        }

        // Using StackView to display and navigate between multiple Pages
        StackView {
            id: stack
            anchors.fill: parent
            initialItem: home

            // Initial Home Page
            Component {
                id: home
                Item {
                    width: 800; height: 550
                    anchors.centerIn: parent

                    // Bg Load Animation
                    SequentialAnimation {
                        running: loadText
                        onFinished: {startBtnMouse.enabled = true}
                        // Loading Background Images
                        ParallelAnimation {
                            NumberAnimation {
                                target: bgTop
                                property: "opacity"
                                from: 0; to: 1
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: bgTop
                                property: "anchors.topMargin"
                                from: 100; to: 0
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: bgBottom
                                property: "opacity"
                                from: 0; to: 1
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: bgBottom
                                property: "anchors.bottomMargin"
                                from: 100; to: 0
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }
                        }

                        // Loading text1
                        ParallelAnimation {
                            NumberAnimation {
                                target: text1
                                property: "opacity"
                                from: 0; to: 1
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: text1
                                property: "anchors.topMargin"
                                from: 213; to: 113
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }
                        }

                        // Loading text2
                        ParallelAnimation {
                            NumberAnimation {
                                target: text2
                                property: "opacity"
                                from: 0; to: 1
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: text2
                                property: "anchors.topMargin"
                                from: 275; to: 175
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }
                        }

                        // Loading text3
                        ParallelAnimation {
                            NumberAnimation {
                                target: text3
                                property: "opacity"
                                from: 0; to: 1
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: text3
                                property: "anchors.topMargin"
                                from: 348; to: 248
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }
                        }

                        // Loading Start Mission Button
                        ParallelAnimation {
                            NumberAnimation {
                                target: startMissionBtn
                                property: "opacity"
                                from: 0; to: 1
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: startMissionBtn
                                property: "anchors.topMargin"
                                from: 460; to: 360
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }
                        }
                    }

                    // bottom right Background Image
                    Image {
                        id: bgBottom
                        source: "home/fig1.png"
                        opacity: 0
                        anchors {bottom: parent.bottom; left: parent.left}
                    }

                    // Top left Background Image
                    Image {
                        id: bgTop
                        source: "home/fig2.png"
                        opacity: 0
                        anchors {top: parent.top; left: parent.left}
                    }

                    // Text Content 1
                    Image {
                        id: text1
                        opacity: 0
                        source: "home/matter1.png"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 256
                        anchors.topMargin: 113
                    }

                    // Text Content 2
                    Image {
                        id: text2
                        opacity: 0
                        source: "home/matter2.png"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 160
                        anchors.topMargin: 175
                    }

                    // Text Content 3
                    Image {
                        id: text3
                        opacity: 0
                        source: "home/matter3.png"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 233
                        anchors.topMargin: 248
                    }

                    // Button
                    Image {
                        id: startMissionBtn
                        opacity: 0
                        source: "home/button.png"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 259
                        anchors.topMargin: 360
                        z: 2
                        scale: startBtnMouse.containsMouse ? 1.2 : 1
                        Behavior on scale { NumberAnimation { duration: 250; easing.type: Easing.OutExpo } }

                        MouseArea {
                            id: startBtnMouse
                            enabled: false
                            hoverEnabled: true
                            anchors.fill: parent
                            cursorShape: startMissionBtn.opacity==1 ? Qt.PointingHandCursor : Qt.Cursor
                            onClicked: { stack.push(steg); reduceWidth=true; switchPage=true;}
                        }
                    }
                }
            }

            // Steganography Page
            Component {
                id: steg
                Item {
                    width: 800; height: 550
                    anchors.centerIn: parent

                    /// Animations ///
                    SequentialAnimation {
                        running: switchPage

                        // Loading Text 1 Animation
                        ParallelAnimation {
                            NumberAnimation {
                                target: stegText1
                                property: "opacity"
                                from: 0; to: 1
                                duration: 2500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: stegText1
                                property: "anchors.topMargin"
                                from: 130; to: 30
                                duration: 2500
                                easing.type: Easing.OutExpo
                            }
                        }

                        // Loading Text 2 Animation
                        ParallelAnimation {
                            NumberAnimation {
                                target: stegText2
                                property: "opacity"
                                from: 0; to: 1
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: stegText2
                                property: "anchors.topMargin"
                                from: 197; to: 97
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }
                        }

                        // Loading Content Box Animation
                        ParallelAnimation {
                            NumberAnimation {
                                target: contentBox
                                property: "opacity"
                                from: 0; to: 1
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: contentBox
                                property: "anchors.topMargin"
                                from: 271; to: 171
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }
                        }

                        // Loading Upload Image Button Animation
                        ParallelAnimation {
                            NumberAnimation {
                                target: imgUpload
                                property: "opacity"
                                from: 0; to: 1
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: imgUpload
                                property: "anchors.topMargin"
                                from: 355; to: 255
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }
                        }

                        // Loading Encode Button Animation
                        ParallelAnimation {
                            NumberAnimation {
                                target: encodeBtn
                                property: "opacity"
                                from: 0; to: 1
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: encodeBtn
                                property: "anchors.topMargin"
                                from: 536; to: 436
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }
                        }

                        // Loading Decode Button Animation
                        ParallelAnimation {
                            NumberAnimation {
                                target: decodeBtn
                                property: "opacity"
                                from: 0; to: 1
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }

                            NumberAnimation {
                                target: decodeBtn
                                property: "anchors.topMargin"
                                from: 536; to: 436
                                duration: 1500
                                easing.type: Easing.OutExpo
                            }
                        }
                    }

                    // Bottom Right Image
                    Image {
                        source: "steg/fig1.png"
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                    }


                    // Top Left Image
                    Image {
                        source: "steg/fig2.png"
                        anchors.top: parent.top
                        anchors.left: parent.left
                    }

                    // Back Button
                    Image {
                        source: "steg/back.svg"
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.topMargin: 20
                        anchors.rightMargin: 92
                        scale: backBtn.containsMouse ? 1.5 : 1
                        Behavior on scale { NumberAnimation {duration: 250; easing.type: Easing.OutExpo} }

                        MouseArea {
                            id: backBtn
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: { stack.pop(); reduceWidth=false; loadText=true }
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                    // Text Content 1
                    Image {
                        id: stegText1
                        source: "steg/text1.png"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.topMargin: 30
                        anchors.leftMargin: 280
                        opacity: 0
                    }

                    // Text Content 2
                    Image {
                        id: stegText2
                        opacity: 0
                        source: "steg/text2.png"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.topMargin: 97
                        anchors.leftMargin: 250
                    }

                    // Content Box
                    Rectangle {
                        id: contentBox
                        width: 320
                        height: 208
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.topMargin: 171
                        anchors.leftMargin: 250
                        border.width: 2
                        border.color: "#ffffff"
                        color: "#00000000"
                        opacity: 0
                        
                        ScrollView {
                            anchors.fill: parent

                            TextArea {
                                id: msgData
                                placeholderText: "Secret Message Here..."
                                text: msgText
                                enabled: contentBox.opacity==1 ? true : false
                                color: "#ffffff"
                                font.family: jbm.name
                                font.pixelSize: 16
                                placeholderTextColor: "#ffffff"
                            }
                        }
                    }

                    // Upload Image Button
                    Image {
                        opacity: 0
                        id: imgUpload
                        source: "steg/upload.png"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.topMargin: 255
                        anchors.leftMargin: 594
                        scale: imgUploadMouse.containsMouse ? 1.3 : 1
                        Behavior on scale { NumberAnimation {duration: 250; easing.type: Easing.OutExpo} }

                        MouseArea {
                            id: imgUploadMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            enabled: imgUpload.opacity==1 ? true : false
                            cursorShape: imgUpload.opacity==1 ? Qt.PointingHandCursor : Qt.Cursor
                            onClicked: python.getImage()
                        }
                    }

                    // Encode Image Btn
                    Image {
                        id: encodeBtn
                        opacity: 0
                        source: "steg/encode.png"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.topMargin: 436
                        anchors.leftMargin: 173
                        scale: encodeBtnMouse.containsMouse ? 1.3 : 1
                        Behavior on scale { NumberAnimation {duration: 250; easing.type: Easing.OutExpo} }

                        MouseArea {
                            id: encodeBtnMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            enabled: encodeBtn.opacity==1 ? true : false
                            cursorShape: encodeBtn.opacity==1 ? Qt.PointingHandCursor : Qt.Cursor
                            onClicked: python.encodeData(msgData.text)
                        }
                    }               

                    // Decode Image Btn
                    Image {
                        id: decodeBtn
                        opacity: 0
                        source: "steg/decode.png"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.topMargin: 436
                        anchors.leftMargin: 492
                        scale: decodeBtnMouse.containsMouse ? 1.3 : 1
                        Behavior on scale { NumberAnimation {duration: 250; easing.type: Easing.OutExpo} }

                        MouseArea {
                            id: decodeBtnMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            enabled: decodeBtn.opacity==1 ? true : false
                            cursorShape: decodeBtn.opacity==1 ? Qt.PointingHandCursor : Qt.Cursor
                            onClicked: python.decodeDate()
                        }
                    }
                }
            }
        }
    }


    // Background Drop Shadow Shadow for the App
    RectangularGlow {
        anchors.fill: appBg
        color: "#000000"
        opacity: appBg.scale>=0.9 ? 1 : 0
        Behavior on opacity { NumberAnimation { duration: 1000; easing.type: Easing.OutExpo } }
        spread: 0.1
        glowRadius: 30
        cornerRadius: 30
        z: -1
    }

    Connections {
        target: python
    }
}       