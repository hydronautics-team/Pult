import "moduls/Compass"
import "moduls/Attitude"
import "moduls/Depth"
import "moduls/Force"
import "moduls/Direction"
import "moduls/Rpd"
import QtQuick 2.0
import QtQuick.Layouts 6.0
import QtQuick.Controls 6.2
import org.freedesktop.gstreamer.Qt6GLVideoItem 1.0

Window {
    property var context

    id: mainWindow
    width: 1200
    height: 800
    visible: true
    color: "#212121"
    minimumWidth: 1200
    minimumHeight: 800

    property int marginsHorizontal: 40
    property int marginsVertical: 40
    property real fontSize: 0.5

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        Row {
            id: r

            MenuBar {
                id: menuBar
                palette.window: "#3D3D3D"
                palette.text: "#DADADA"
                // palette.highlight: "#76767E"

                Menu {
                    palette.base: "#2D2D2F" // up rect
                    title: qsTr("&File")
                    Action { text: qsTr("&New...") }
                    Action { text: qsTr("&Open...") }
                    Action { text: qsTr("&Save") }
                    Action { text: qsTr("Save &As...") }
                    MenuSeparator { }
                    Action { text: qsTr("&Quit") }
                }

                Menu {
                    palette.base: "#2D2D2F"
                    title: qsTr("&Edit")
                    Action { text: qsTr("Cu&t") }
                    Action { text: "&Copy" }
                    Action { text: qsTr("&Paste") }
                    MenuSeparator { }
                    Action {
                        text: qsTr("&Settings")
                        onTriggered: {
                            var component = Qt.createComponent("SettingsWindow.qml")
                            var window = component.createObject()
                            window.show()
                        }
                    }
                }

                Menu {
                    palette.base: "#2D2D2F"
                    title: qsTr("&Windows")
                    Action { text: qsTr("&Full Screen") }
                    Action { text: "Split" }
                }

                Menu {
                    palette.base: "#2D2D2F"
                    title: qsTr("&Help")
                    Action {
                        text: qsTr("&About")
                        onTriggered: {
                            var component = Qt.createComponent("AboutWindow.qml")
                            var window = component.createObject()
                            window.show()
                        }
                    }
                }

                delegate: MenuBarItem {
                    id: menuBarItem

                    function replaceText(txt)
                    {
                        var index = txt.indexOf("&");
                        if(index >= 0)
                            txt = txt.replace(txt.substr(index, 2), ("<u>" + txt.substr(index + 1, 1) +"</u>"));
                        return txt;
                    }

                    contentItem: Text {
                        text: replaceText(menuBarItem.text)
                        font: menuBarItem.font
                        opacity: enabled ? 1.0 : 0.3
                        color: menuBarItem.highlighted ? "#ffffff" : "#ffffff"
                        horizontalAlignment: Text.Right
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }

                    background: Rectangle { // это элемент панели
                        implicitWidth: 40
                        implicitHeight: 20
                        opacity: enabled ? 1 : 0.3
                        color: menuBarItem.highlighted ? "#a9a9a9" : "transparent"
                    }
                }

                background: Rectangle { // это вехняя панель, на которой расположены кнопки меню
                    implicitWidth: Screen.width
                    implicitHeight: 20
                    color: "#3D3D3D"
                }

            }

        }
        // болванка экрана стриминга видео
        Row {
            id: row
            GstGLQt6VideoItem {
                    id: video
                    objectName: "videoItem"
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height
            }
//            Rectangle {
//                id: rectangle3
//                width: 400*2
//                height: 300*1.7
//                color: "#737373"
//            }
        }

        RowLayout {
             id: row1
             spacing: 23
             anchors.bottom: parent.bottom
             DirectionModule {
                 id: directionModule
             }
             CompassModule {
                 id: compassModule
             }
             RpdModule {
                 id:rpdModule

             }

             Rectangle {
                 id: rectangle2
                 opacity: 0.1
                 width: 200
                 height: 200
                 color: "#ffffff"
             }

             Rectangle {
                 id: rectangle4
                 opacity: 0.1
                 width: 200
                 height: 200
                 color: "#ffffff"
             }
         }
    }

    Loader {
        id: subWindowLoader
    }
}
