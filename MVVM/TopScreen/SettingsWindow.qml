import QtQuick 2.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.2


Window {
    id: settingsWindow
    title: "Settings"
    visible: true
    width: 500; height: 300
    color: "#212121"
    // flags: Qt.FramelessWindowHint // убирает верхнюю часть окна с изначальными кнопками
    // flags: Qt.SubWindow


    Text {
        anchors.centerIn: parent
        text: "subwindow1"
        color: "white"
        font.pixelSize: 30
    }


}
