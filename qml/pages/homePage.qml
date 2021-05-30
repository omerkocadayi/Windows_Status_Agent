import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.qmlmodels 1.0
import "../components"
import QtQuick.Timeline 1.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.14
import QtGraphicalEffects 1.0

Item {
    width: 803
    height: 579
    Rectangle {
        id: rectangle
        color: "#00000000"
        anchors.fill: parent
        clip: false
        

        Rectangle {
            id: rectInfos
            x: 199
            y: 15
            color: "#00000000"
            anchors.left: columnProgressBar.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.rightMargin: 5
            anchors.leftMargin: 10
            Layout.maximumWidth: 380
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.preferredHeight: 390
            Layout.preferredWidth: 280

            Column{
                id: columnInfo
                anchors.fill: parent
                anchors.rightMargin: 5
                spacing: 10

                Rectangle{
                    id: rectTitleCPU
                    width: parent.width
                    height: 30
                    opacity: 1
                    color: "#ff2525"
                    radius: 5

                    Rectangle{
                        height: 30
                        color: "#080808"
                        radius: 3
                        border.width: 2
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.leftMargin: 5

                        Row {
                            id: mainTitleCPU
                            anchors.fill: parent
                            rightPadding: 20
                            bottomPadding: 7
                            topPadding: 7
                            leftPadding: 20
                            padding: 4

                            Text {
                                x: 0
                                y: 0
                                color: "#ffff25"
                                text: qsTr("CPU INFOS")
                                font.pointSize: 10
                                font.family: "Verdana"
                            }
                        }
                    }
                }

                Rectangle{
                    id: rectInfosCPU
                    width: parent.width
                    height: 25
                    opacity: 1
                    color: "#080808"
                    radius: 5

                    Row {
                        anchors.fill: parent
                        padding: 10

                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("CPU Model : ")
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {
                            id: textInfoCPU
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pointSize: 8
                            leftPadding: 5
                        }
                    }
                }

                Rectangle{
                    id: rectInfosCPU2
                    width: parent.width
                    height: 25
                    opacity: 1
                    color: "#080808"
                    radius: 5

                    Row {
                        anchors.fill: parent
                        padding: 10

                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Physical Cores : ")
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {
                            id: textInfoCPU_physicalCores
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pointSize: 8
                            leftPadding: 5
                        }

                        Text {
                            x: 250
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Total Cores : ")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 10
                        }

                        Text {
                            id: textInfoCPU_totalCores
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }

                    }
                }

                Rectangle{
                    id: rectInfosCPU3
                    width: parent.width
                    height: 25
                    opacity: 1
                    color: "#080808"
                    radius: 5

                    Row {
                        anchors.fill: parent
                        padding: 10

                        Text {
                            x: 100
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Max Frequency : ")
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {
                            id: textInfoCPU_frequencyMax
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pointSize: 8
                            leftPadding: 5
                        }

                        Text {
                            x: 10
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Min Frequency : ")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 10
                        }

                        Text {
                            id: textInfoCPU_frequencyMin
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }
                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Current : ")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 10
                        }

                        Text {
                            id: textInfoCPU_frequencyCurrrent
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }
                    }
                }

                Rectangle{
                    id: unvisibleRect1
                    width: parent.width
                    height: 17
                    opacity: 0
                    visible: true
                    color: "#000000"
                    radius: 5
                }

                Rectangle{
                    id: rectInfosRAM
                    width: parent.width
                    height: 30
                    opacity: 1
                    color: "#ff2525"
                    radius: 5

                    Rectangle{
                        height: 30
                        color: "#080808"
                        radius: 5
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.leftMargin: 5

                        Row {
                            id: mainTitleRAM
                            anchors.fill: parent
                            leftPadding: 20
                            rightPadding: 20
                            bottomPadding: 7
                            topPadding: 7
                            padding: 4

                            Text {
                                width: 100
                                color: "#ffff25"
                                text: qsTr("RAM INFOS")
                                font.pointSize: 10
                                font.family: "Verdana"
                            }
                        }
                    }
                }

                Rectangle {
                    id: rectInfosRAM1
                    width: parent.width
                    height: 25
                    opacity: 1
                    color: "#080808"
                    radius: 5
                    Row {
                        anchors.fill: parent
                        padding: 10

                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("RAM Capasity : ")
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {
                            id: textInfoRAM_total
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pointSize: 8
                            leftPadding: 5
                        }

                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Free RAM : ")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 10
                        }

                        Text {
                            id: textInfoRAM_free
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }
                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Used : ")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 10
                        }

                        Text {
                            id: textInfoRAM_used
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }
                    }
                }

                Rectangle{
                    id: unvisibleRect2
                    width: parent.width
                    height: 32
                    opacity: 0
                    visible: true
                    color: "#0c0d10"
                    radius: 5
                }

                Rectangle{
                    id: rectInfosGPU
                    width: parent.width
                    height: 30
                    opacity: 1
                    color: "#ff2525"
                    radius: 5

                    Rectangle{
                        height: 30
                        color: "#080808"
                        radius: 5
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.leftMargin: 5

                        Row {
                            id: mainTitleGPU
                            anchors.fill: parent
                            rightPadding: 20
                            leftPadding: 20
                            bottomPadding: 7
                            topPadding: 7
                            padding: 4

                            Text {
                                x: 50
                                width: 100
                                color: "#ffff25"
                                text: qsTr("GPU INFOS")
                                font.pointSize: 10
                                font.family: "Verdana"
                            }
                        }
                    }
                }

                Rectangle {
                    id: rectInfosGPU1
                    width: parent.width
                    height: 25
                    opacity: 1
                    color: "#080808"
                    radius: 5
                    Row {
                        anchors.fill: parent
                        padding: 10
                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("GPU Model : ")
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            id: textInfoGPU
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }
                    }
                }

                Rectangle {
                    id: rectInfosGPU2
                    width: parent.width
                    height: 25
                    opacity: 1
                    color: "#080808"
                    radius: 5
                    Row {
                        anchors.fill: parent
                        padding: 10
                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("VRAM Capasity : ")
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            id: textInfoGPU_totalVRAM
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }

                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Free VRAM : ")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 10
                        }

                        Text {
                            id: textInfoGPU_freeVRAM
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }

                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Used : ")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 10
                        }

                        Text {
                            id: textInfoGPU_usedVRAM
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }
                    }
                }

                Rectangle {
                    id: rectInfosGPU3
                    width: parent.width
                    height: 25
                    opacity: 1
                    color: "#080808"
                    radius: 5
                    Row {
                        anchors.fill: parent
                        padding: 10
                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Temperature : ")
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            id: textInfoGPU_temprature
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }
                    }
                }
                Rectangle{
                    id: unvisibleRect3
                    width: parent.width
                    height: 17
                    opacity: 0
                    visible: true
                    color: "#0c0d10"
                    radius: 5
                }
                Rectangle {
                    id: rectInfosDisk
                    width: parent.width
                    height: 30
                    opacity: 1
                    color: "#ff2525"
                    radius: 5
                    Rectangle {
                        height: 30
                        color: "#080808"
                        radius: 5
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        Row {
                            id: mainTitleGPU1
                            anchors.fill: parent
                            rightPadding: 20
                            leftPadding: 20
                            bottomPadding: 7
                            topPadding: 7
                            padding: 4

                            Text {
                                width: 100
                                color: "#ffff25"
                                text: qsTr("STORAGE INFOS")
                                font.pointSize: 10
                                font.family: "Verdana"
                            }
                        }
                        anchors.leftMargin: 5
                    }
                }

                Rectangle {
                    id: rectInfosDisk1
                    width: parent.width
                    height: 25
                    opacity: 1
                    color: "#080808"
                    radius: 5
                    Row {
                        anchors.fill: parent
                        padding: 10
                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Disk Capasity : ")
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            id: textInfoDisk_total
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }

                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Free Disk : ")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 10
                        }

                        Text {
                            id: textInfoDisk_free
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }

                        Text {
                            width: 100
                            color: "#25ff25"
                            text: qsTr("Used : ")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 10
                        }

                        Text {
                            id: textInfoDisk_used
                            width: 100
                            color: "#cccccc"
                            text: qsTr("---")
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 5
                            font.pointSize: 8
                        }
                    }
                }

            }
        }

        Column {
            id: columnProgressBar
            width: 170
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            spacing: 10

            CircularProgressBar {
                id: pctCPU
                x: 10
                width: 134
                height: 134
                opacity: 1
                textColor: "#ffff25"
                textSize: 14
                progressColor: "#25ff25"
                value: 0
                progressWidth: 6
                Text {
                    x: 47
                    y: 100
                    width: 35
                    color: "#ffff25"
                    text: qsTr("CPU")
                    font.pointSize: 12
                    font.family: "Verdana"
                }
                startAngle: 90
                bgStrokeColor: "#080808"
                roundCap: false
                strokeBgWidth: 6
            }

            CircularProgressBar {
                id: pctRAM
                x: 10
                y: 160
                width: 134
                height: 134
                opacity: 1
                textColor: "#ffff25"
                textSize: 14
                progressColor: "#25ff25"
                value: 0
                progressWidth: 6
                Text {
                    x: 47
                    y: 100
                    color: "#bfdd04"
                    text: qsTr("RAM")
                    font.pointSize: 12
                    font.family: "Verdana"
                }
                startAngle: 90
                bgStrokeColor: "#080808"
                roundCap: false
                strokeBgWidth: 6
            }

            CircularProgressBar {
                id: pctGPU
                x: 10
                y: 320
                width: 134
                height: 134
                opacity: 1
                textColor: "#ffff25"
                textSize: 14
                progressColor: "#25ff25"
                value: 0
                progressWidth: 6
                Text {
                    x: 47
                    y: 100
                    width: 35
                    color: "#ffff25"
                    text: qsTr("GPU")
                    font.pointSize: 12
                    font.family: "Verdana"
                }
                startAngle: 90
                bgStrokeColor: "#080808"
                roundCap: false
                strokeBgWidth: 6
            }

            CircularProgressBar {
                id: pctDisk
                x: 10
                y: 480
                width: 134
                height: 134
                opacity: 1
                textColor: "#ffff25"
                textSize: 14
                progressColor: "#25ff25"
                value: 0
                progressWidth: 6
                Text {
                    x: 47
                    y: 100
                    width: 35
                    color: "#ffff25"
                    text: qsTr("DISK")
                    font.pointSize: 12
                    font.family: "Verdana"
                }
                startAngle: 90
                bgStrokeColor: "#080808"
                roundCap: false
                strokeBgWidth: 6
            }

        }
    }

    DropShadow{
        anchors.fill: rectangle
        source: rectangle
        verticalOffset: 0
        horizontalOffset: 0
        radius: 5
        samples: 6
        color: "#b3000000"
        z: 0
    }


    Connections{
        target: backend

        // STATIC INFO
        function onCpuInfo(argument) { textInfoCPU.text = argument }
        function onCpuPhysicalCoresInfo(argument) { textInfoCPU_physicalCores.text = argument }
        function onCpuTotalCoresInfo(argument) { textInfoCPU_totalCores.text = argument }
        function onCpuFrequencyMaxInfo(argument) { textInfoCPU_frequencyMax.text = argument }
        function onCpuFrequencyMinInfo(argument) { textInfoCPU_frequencyMin.text = argument }
        function onRamTotalInfo(argument) { textInfoRAM_total.text = argument }
        function onGpuModelInfo(argument) { textInfoGPU.text = argument }
        function onVramTotalInfo(argument) { textInfoGPU_totalVRAM.text = argument }
        function onDiskTotalInfo(argument) { textInfoDisk_total.text = argument }


        // DYNAMIC INFO
        function onPercentageCPU(argument) { pctCPU.value = argument }
        function onPercentageRAM(argument) { pctRAM.value = argument }
        function onPercentageGPU(argument) { pctGPU.value = argument }
        function onPercentageDisk(argument){ pctDisk.value = argument }
        function onCpuFrequencyCurrentInfo(argument) { textInfoCPU_frequencyCurrrent.text = argument }
        function onRamAvailableInfo(argument) { textInfoRAM_free.text = argument }
        function onRamUsedInfo(argument) { textInfoRAM_used.text = argument }
        function onVramFreeInfo(argument) { textInfoGPU_freeVRAM.text = argument }
        function onVramUsedInfo(argument) { textInfoGPU_usedVRAM.text = argument }
        function onGpuTempInfo(argument) { textInfoGPU_temprature.text = argument }
        function onDiskFreeInfo(argument) { textInfoDisk_free.text = argument }
        function onDiskUsedInfo(argument) { textInfoDisk_used.text = argument }
    }


    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                loops: 1
                duration: 550
                to: 550
                from: 0
            }
        ]
        endFrame: 550
        enabled: true
        startFrame: 0


        KeyframeGroup {
            target: rectTitleCPU
            property: "opacity"
            Keyframe {
                frame: 40
                value: 0
            }

            Keyframe {
                frame: 80
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: rectInfosCPU
            property: "opacity"
            Keyframe {
                frame: 80
                value: 0
            }

            Keyframe {
                frame: 120
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: rectInfosCPU2
            property: "opacity"
            Keyframe {
                frame: 120
                value: 0
            }

            Keyframe {
                frame: 160
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: rectInfosCPU3
            property: "opacity"
            Keyframe {
                frame: 160
                value: 0
            }

            Keyframe {
                frame: 200
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: rectInfosRAM
            property: "opacity"
            Keyframe {
                frame: 200
                value: 0
            }

            Keyframe {
                frame: 240
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: rectInfosRAM1
            property: "opacity"
            Keyframe {
                frame: 240
                value: 0
            }

            Keyframe {
                frame: 280
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: rectInfosGPU
            property: "opacity"
            Keyframe {
                frame: 280
                value: 0
            }

            Keyframe {
                frame: 320
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: rectInfosGPU1
            property: "opacity"
            Keyframe {
                frame: 320
                value: 0
            }

            Keyframe {
                frame: 360
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: rectInfosGPU2
            property: "opacity"
            Keyframe {
                frame: 360
                value: 0
            }

            Keyframe {
                frame: 400
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: rectInfosGPU3
            property: "opacity"
            Keyframe {
                frame: 400
                value: 0
            }

            Keyframe {
                frame: 440
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }
        KeyframeGroup {
            target: rectInfosDisk
            property: "opacity"
            Keyframe {
                frame: 440
                value: 0
            }

            Keyframe {
                frame: 480
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }
        KeyframeGroup {
            target: rectInfosDisk1
            property: "opacity"
            Keyframe {
                frame: 480
                value: 0
            }

            Keyframe {
                frame: 520
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }
    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:84}
}
##^##*/
