import QtQuick 2.14
import QtQuick.Controls 2.4
import Qt.labs.qmlmodels 1.0
import "../components"
import QtQuick.Layouts 1.0
import QtQuick.Window 2.11
import QtGraphicalEffects 1.0

Item {
    width: 803
    height: 644
    Rectangle {
        id: rectangle
        height: 644
        opacity: 1
        color: "#00000000"
        radius: 5
        border.color: "#ff2525"
        anchors.fill: parent
        anchors.topMargin: -23
        anchors.bottomMargin: 41
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        clip: false

        Rectangle{
            id: rectTitleLogon
            height: 30
            opacity: 1
            color: "#ff2525"
            radius: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.rightMargin: 10
            anchors.leftMargin: 10

            Rectangle{
                id: rectangle6
                height: 30
                color: "#080808"
                radius: 3
                border.width: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.leftMargin: 5

                Row {
                    id: mainTitleLogon
                    x: 322
                    width: 110
                    rightPadding: 20
                    bottomPadding: 7
                    topPadding: 7
                    leftPadding: 20
                    padding: 4

                    Text {
                        x: 350
                        y: 0
                        color: "#ffff25"
                        text: qsTr("Last Logons")
                        horizontalAlignment: Text.AlignLeft
                        font.pointSize: 10
                        font.family: "Verdana"
                    }
                }
            }
        }

        Rectangle {
            id: rectLogon1
            height: 80
            color: "#00000000"
            radius: 4
            border.width: 3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: rectLogon2.top
            anchors.bottomMargin: 40
            anchors.rightMargin: 10
            anchors.leftMargin: 10

            Row {
                id: logon1Row1
                y: 50
                height: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.topMargin: 5

                Text {
                    x: 0
                    y: 5
                    width: 95
                    color: "#25ff25"
                    text: qsTr("Kullanıcı Adı :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginName1
                    x: 350
                    y: 5
                    width: 280
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    x: 350
                    y: 5
                    width: 90
                    color: "#25ff25"
                    text: qsTr("İşlem Tarihi :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginTime1
                    x: 350
                    y: 5
                    width: 280
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }
            }

            Row {
                id: logon1Row2
                y: 50
                height: 35
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                Text {
                    x: 350
                    y: 5
                    width: 95
                    color: "#25ff25"
                    text: qsTr("Mesaj :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginMessage1
                    x: 350
                    y: 5
                    width: 290
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
            }
        }

        Rectangle {
            id: rectLogon2
            height: 80
            color: "#00000000"
            radius: 4
            border.width: 3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: rectLogon3.top
            anchors.bottomMargin: 40
            anchors.leftMargin: 10
            anchors.rightMargin: 10

            Row {
                id: logon2Row1
                y: 50
                height: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                Text {
                    x: 0
                    y: 5
                    width: 95
                    color: "#25ff25"
                    text: qsTr("Kullanıcı Adı :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginName2
                    x: 350
                    y: 5
                    width: 280
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    x: 350
                    y: 5
                    width: 90
                    color: "#25ff25"
                    text: qsTr("İşlem Tarihi :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginTime2
                    x: 350
                    y: 5
                    width: 280
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }
                anchors.leftMargin: 5
                anchors.topMargin: 5
            }

            Row {
                id: logon2Row2
                y: 50
                height: 35
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                Text {
                    x: 350
                    y: 5
                    width: 95
                    color: "#25ff25"
                    text: qsTr("Mesaj :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginMessage2
                    x: 350
                    y: 5
                    width: 290
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
            }
        }

        Rectangle {
            id: rectLogon3
            color: "#00000000"
            radius: 4
            border.width: 3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 255
            anchors.topMargin: 290
            anchors.leftMargin: 10
            anchors.rightMargin: 10

            Row {
                id: logon3Row1
                y: 50
                height: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                Text {
                    x: 350
                    y: 5
                    width: 95
                    color: "#25ff25"
                    text: qsTr("Kullanıcı Adı :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginName3
                    x: 350
                    y: 5
                    width: 280
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    x: 350
                    y: 5
                    width: 90
                    color: "#25ff25"
                    text: qsTr("İşlem Tarihi :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginTime3
                    x: 350
                    y: 5
                    width: 280
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }
                anchors.leftMargin: 5
                anchors.topMargin: 5
            }

            Row {
                id: logon3Row2
                y: 50
                height: 35
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                Text {
                    x: 350
                    y: 5
                    width: 95
                    color: "#25ff25"
                    text: qsTr("Mesaj :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginMessage3
                    x: 350
                    y: 5
                    width: 290
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
            }
        }

        Rectangle {
            id: rectLogon4
            height: 80
            color: "#00000000"
            radius: 4
            border.width: 3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectLogon3.bottom
            anchors.topMargin: 40
            anchors.leftMargin: 10
            anchors.rightMargin: 10

            Row {
                id: logon4Row1
                y: 50
                height: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                Text {
                    x: 350
                    y: 5
                    width: 95
                    color: "#25ff25"
                    text: qsTr("Kullanıcı Adı :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginName4
                    x: 350
                    y: 5
                    width: 280
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    x: 350
                    y: 5
                    width: 90
                    color: "#25ff25"
                    text: qsTr("İşlem Tarihi :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginTime4
                    x: 350
                    y: 5
                    width: 280
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }
                anchors.leftMargin: 5
                anchors.topMargin: 5
            }

            Row {
                id: logon4Row2
                y: 50
                height: 35
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                Text {
                    x: 350
                    y: 5
                    width: 95
                    color: "#25ff25"
                    text: qsTr("Mesaj :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginMessage4
                    x: 350
                    y: 5
                    width: 290
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
            }
        }

        Rectangle {
            id: rectLogon5
            height: 80
            color: "#00000000"
            radius: 4
            border.width: 3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectLogon4.bottom
            anchors.topMargin: 40
            anchors.leftMargin: 10
            anchors.rightMargin: 10

            Row {
                id: logon5Row1
                y: 50
                height: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                Text {
                    x: 350
                    y: 5
                    width: 95
                    color: "#25ff25"
                    text: qsTr("Kullanıcı Adı :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginName5
                    x: 350
                    y: 5
                    width: 280
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    x: 350
                    y: 5
                    width: 90
                    color: "#25ff25"
                    text: qsTr("İşlem Tarihi :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginTime5
                    x: 350
                    y: 5
                    width: 280
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }
                anchors.leftMargin: 5
                anchors.topMargin: 5
            }

            Row {
                id: logon5Row2
                y: 50
                height: 35
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                Text {
                    x: 350
                    y: 5
                    width: 95
                    color: "#25ff25"
                    text: qsTr("Mesaj :")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }

                Text {
                    id: loginMessage5
                    x: 350
                    y: 5
                    width: 290
                    color: "#cccccc"
                    text: qsTr("---")
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 10
                    font.family: "Verdana"
                }
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
            }
        }
    }

    Connections{
        target: backend
        // STATIC INFO
        function onLoginInfo(argument){

            loginTime1.text = argument[0]
            loginTime2.text = argument[1]
            loginTime3.text = argument[2]
            loginTime4.text = argument[3]
            loginTime5.text = argument[4]

            loginName1.text = argument[5]
            loginName2.text = argument[6]
            loginName3.text = argument[7]
            loginName4.text = argument[8]
            loginName5.text = argument[9]

            loginMessage1.text = argument[10]
            loginMessage2.text = argument[11]
            loginMessage3.text = argument[12]
            loginMessage4.text = argument[13]
            loginMessage5.text = argument[14]

        }
    }
}
