import QtQuick 2.0

Item {
    id: baseItem2
    width: 198
    height: 198

    Rectangle {
        id: startBackground
        color: "#0F878AA0"
        width: 198
        height: 198

        Image {
            id: centrPointImage
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter   // (90, 90)
            anchors.horizontalCenter: parent.horizontalCenter
            source: "svg/r24.svg"
        }
        Image {
            id: oldPointImage
            fillMode: Image.PreserveAspectFit
            x:60
            y:60
            source: "svg/r22.svg"
        }
        Image {
            id: newPointImage
            fillMode: Image.PreserveAspectFit
            x:60*2
            y:60*2
            source: "svg/r23.svg"
        }

        Column {
            id:indicator    // Segmensts:  5 - 18
            spacing: 2.693
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: segment5
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r5.svg"
            }
            Image {
                id: segment6
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r6.svg"
            }
            Image {
                id: segment7
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r7.svg"
            }
            Image {
                id: segment8
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r8.svg"
            }
            Image {
                id: segment9
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r9.svg"
            }
            Image {
                id: segment10
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r10.svg"
            }
            Image {
                id: segment11
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r11.svg"
            }
            Image {
                id: segment12
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r12.svg"
            }
            Image {
                id: segment13
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r13.svg"
            }
            Image {
                id: segment14
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r14.svg"
            }
            Image {
                id: segment15
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r15.svg"
            }
            Image {
                id: segment16
                //fillMode: Image.PreserveAspectFit
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                //smooth : true
                //anchors.fill: parent
                source: "svg/r16.svg"
            }
            Image {
                id: segment17
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r17.svg"
            }
            Image {
                id: segment18
                anchors.horizontalCenter: parent.horizontalCenter
                source: "svg/r18.svg"
            }

            Timer {
                interval: 100; running: true; repeat: true
                onTriggered: {
                }
            }
        }

        Image {
            id: didgImage
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "svg/r19.svg"
        }
    }
}
