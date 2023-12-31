 
/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
 
    import QtQuick 2.5
    import QtQuick.Window 2.2
    
   Image {
        id: root
        source: "images/14SplashPlasma_v704.png"
        property int stage
    
       onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    Text {
            id: date
            text:Qt.formatDateTime(new Date(),"hh:mm dd/MM/yyyy")
            font.pointSize: 35
            color: "#a0a0a0"
            opacity:0.85
            font { family: "NotoSans MED"; weight: Font.Light ;capitalization: Font.Capitalize}
            anchors.horizontalCenter: parent.horizontalCenter
            y: (parent.height - height) / 1.1
        }

    Image {
        id: topRect
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height
        source: "images/rectangle.svg"
        Image {
            source: "images/logo.png"
            anchors.centerIn: parent
        }
        Rectangle {
            radius: 2
            color: "#247d8f"
            anchors {
                bottom: parent.bottom
                bottomMargin: 2
                horizontalCenter: parent.horizontalCenter
            }
            height: 9
            width: height*32
            Rectangle {
                radius: 3
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                width: (parent.width / 6) * (stage - 1)
                color: "#ffffff"
                Behavior on width { 
                    PropertyAnimation {
                        duration: 250
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "y"
                target: topRect
                to: root.height / 3
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }

            PropertyAnimation {
                property: "y"
                target: bottomRect
                to: 2 * (root.height / 3) - bottomRect.height
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }
        }
    }
}
