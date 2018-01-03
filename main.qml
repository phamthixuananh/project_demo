import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    id: window
    visible: true
    x: initialX
    y: initialY
    width: initialWidth
    height: initialHeight
    title: qsTr("Stack")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Page cua Anh")
                width: parent.width
                onClicked: {
                    stackView.push("MyTabBar.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page cua Long")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.Long.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page cua Loc")
                width: parent.width
                onClicked: {
                    drawer.close()
                    stackView.push("Page3Form.Loc.ui.qml")

                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.ui.qml"
        anchors.fill: parent
    }
}
