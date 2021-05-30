import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.0
import QtQuick.Timeline 1.0
import QtGraphicalEffects 1.0
import QtGraphicalEffects 1.15
import "components"


Window {
    id: mainWindow
    width: 825
    height: 720
    opacity: 1
    visible: true
    color: "#00000000"
    title: qsTr("Windows System Agent")
    flags: Qt.FramelessWindowHint | Qt.Window
    Component.onCompleted: {
        backend.setStaticInfo()
        mainWindow.visible = true
    }

    Rectangle{
        id: bg
        width: 805
        radius: 5
        color: "#b3262626"
        border.color: "#99d61c1c"
        border.width: 3
        anchors.fill: parent
        clip: true
        anchors.margins: 10
        z: 1

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: footer.top
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 0

            Rectangle {
                id: topBar
                height: 55
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.rightMargin: 0

                Rectangle {
                    id: rectMainTitle
                    x: 20
                    y: 15
                    height: 30
                    opacity: 1
                    color: "#ff2525"
                    radius: 5
                    anchors.left: parent.left
                    anchors.right: homePageBtn.left
                    anchors.top: parent.top
                    anchors.rightMargin: 5
                    anchors.leftMargin: 5
                    anchors.topMargin: 5

                    Row {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        Text {
                            color: "#ffffff"
                            text: qsTr("Windows System Agent")
                            font.pointSize: 10
                            font.family: "Verdana"
                        }
                        anchors.leftMargin: 10
                    }

                    Image {
                        id: image
                        width: 26
                        height: 26
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        source: "components/dragIcon.svg"
                        mirror: false
                        anchors.rightMargin: 3
                        mipmap: true
                        sourceSize.height: 20
                        sourceSize.width: 24
                        fillMode: Image.PreserveAspectFit
                    }

                    DragHandler {
                        onActiveChanged: if (active) { mainWindow.startSystemMove() }
                        target: null
                    }

                }

                CustomButton {
                    id: closeBtn
                    x: 755
                    y: 15
                    width: 30
                    height: 30
                    opacity: 1
                    text: "X"
                    anchors.right: parent.right
                    anchors.top: parent.top
                    colorMouseOver: "#bb1515"
                    colorDefault: "#ff2525"
                    anchors.topMargin: 5
                    font.pointSize: 10
                    font.family: "Verdana"
                    anchors.rightMargin: 5
                    colorPressed: "#2c313c"
                    onClicked: mainWindow.close()
                }

                CustomButton {
                    id: minimizeBtn
                    x: 720
                    y: 15
                    width: 30
                    height: 30
                    opacity: 1
                    text: "-"
                    anchors.right: closeBtn.left
                    anchors.top: parent.top
                    colorDefault: "#ff2525"
                    font.family: "Verdana"
                    anchors.rightMargin: 5
                    colorPressed: "#2c313c"
                    font.pointSize: 14
                    anchors.topMargin: 5
                    colorMouseOver: "#bb1515"
                    onClicked:{
                        mainWindow.showMinimized()
                    }
                }

                CustomButton {
                    id: appsPageBtn
                    x: 615
                    y: 15
                    width: 70
                    height: 30
                    opacity: 1
                    text: "Apps"
                    anchors.right: logonPageBtn.left
                    anchors.top: parent.top
                    colorDefault: "#ff2525"
                    font.family: "Verdana"
                    anchors.rightMargin: 5
                    colorPressed: "#2c313c"
                    font.pointSize: 10
                    anchors.topMargin: 5
                    colorMouseOver: "#bb1515"
                    onClicked: {
                        stackView.push(Qt.resolvedUrl("pages/appsPage.qml"))
                    }
                }

                CustomButton {
                    id: servicesPageBtn
                    x: 510
                    y: 15
                    width: 70
                    height: 30
                    opacity: 1
                    text: "Services"
                    anchors.right: appsPageBtn.left
                    anchors.top: parent.top
                    autoExclusive: false
                    colorDefault: "#ff2525"
                    font.family: "Verdana"
                    anchors.rightMargin: 5
                    colorPressed: "#2c313c"
                    font.pointSize: 10
                    anchors.topMargin: 5
                    colorMouseOver: "#bb1515"
                    onClicked: {
                        backend.showServices(servicesPageBtn.text)
                    }
                }

                CustomButton {
                    id: homePageBtn
                    x: 405
                    y: 15
                    width: 70
                    height: 30
                    opacity: 1
                    text: "Home"
                    anchors.right: servicesPageBtn.left
                    anchors.top: parent.top
                    colorDefault: "#ff2525"
                    font.family: "Verdana"
                    anchors.rightMargin: 5
                    colorPressed: "#2c313c"
                    font.pointSize: 10
                    anchors.topMargin: 5
                    colorMouseOver: "#bb1515"
                    onClicked: {
                        stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                    }

                }

                CustomButton {
                    id: logonPageBtn
                    x: 653
                    y: 11
                    width: 70
                    height: 30
                    opacity: 1
                    text: "Logons"
                    anchors.right: minimizeBtn.left
                    anchors.top: parent.top
                    colorPressed: "#2c313c"
                    colorDefault: "#ff2525"
                    font.family: "Verdana"
                    anchors.rightMargin: 5
                    anchors.topMargin: 5
                    font.pointSize: 10
                    colorMouseOver: "#bb1515"
                    onClicked: {
                        stackView.push(Qt.resolvedUrl("pages/logonPage.qml"))
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 5

                StackView {
                    id: stackView
                    anchors.fill: parent
                    initialItem: Qt.resolvedUrl("pages/homePage.qml")
                }


            }
        }

        Rectangle {
            id: footer
            height: 30
            opacity: 1
            visible: true
            color: "#ff2525"
            radius: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            Rectangle {
                id: rectangle
                height: 15
                color: "#00000000"
                radius: 5
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                Row {
                    id: columnHostAndOS
                    height: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 10
                    anchors.topMargin: 2

                    Text {
                        color: "#ffffff"
                        text: qsTr("OS : ")
                        font.pointSize: 9
                        font.family: "Verdana"
                    }

                    Text {
                        id:osInfo
                        color: "#ffffff"
                        text: qsTr("---")
                        font.pointSize: 9
                        font.family: "Verdana"
                    }

                    Text {
                        color: "#ffffff"
                        text: qsTr("HOST NAME : ")
                        font.pointSize: 9
                        font.family: "Verdana"
                    }

                    Text {
                        id:hostInfo
                        color: "#ffffff"
                        text: qsTr("---")
                        font.pointSize: 9
                        font.family: "Verdana"
                    }
                    anchors.leftMargin: 10
                }

                Row {
                    id: columnProducer
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 2
                    Text {
                        color: "#ffffff"
                        text: qsTr("Produced By : ")
                        font.pointSize: 9
                        font.family: "Verdana"
                    }

                    Text {
                        color: "#ffffff"
                        text: qsTr("OMER FARUK KOCADAYI")
                        font.pointSize: 9
                        font.family: "verdana"
                        leftPadding: 5
                    }
                    anchors.leftMargin: 10
                }
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.bottomMargin: 5
        }
    }
	
	Connections{
        target: backend
        function onShowService(name){ servicesPageBtn.text = name}
        function onOsInfo(argument) { osInfo.text = argument }
        function onHostNameInfo(argument) { hostInfo.text = argument }
	}

}


