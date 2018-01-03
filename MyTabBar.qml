import QtQuick 2.6
import QtQuick.Controls 2.1

Page {
    id: page
    title: qsTr("Page cua Anh")
    SearchDelegate {
        id: searchView
        label: "From user..."
        placeHolder: "@username"
        prefix: "@"
        onOk: {

        }
    }
    SwipeView {
        id: swipeView
        currentIndex: tabBar.currentIndex
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: searchView.bottom
        anchors.bottom: parent.bottom
        Page {
            id: managementPage
            background: Rectangle {

                color:"purple"
            }
            Text {
                id: txtName
                text: qsTr("text")
            }
        }
        Page {
            id: experiodPage
            background: Rectangle {

                color:"yellow"
            }
            Text {
                id: txtName2
                text: qsTr("text")
            }
        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: "First"
        }
        TabButton {
            text: "Second"
        }
    }
}
