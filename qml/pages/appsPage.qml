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
        y: 0
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

        Label {
            id: label
            color: "#cccccc"
            text: qsTr("Veriler Alınıyor..\nBu İşlem Cihazın Performansına Bağlı Olarak Bir Sefere Mahsus 5 saniye kadar sürebilir.")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 9
            font.family: "Verdana"
            anchors.topMargin: 0
            anchors.leftMargin: 5
        }
    }

    Connections{
        target: backend
        function onShowApp(argument) { label.text = argument }
    }
}
