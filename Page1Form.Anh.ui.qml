import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: root
    title: qsTr("Page cua Anh")
    anchors.fill: parent

    SwipeView {
        id: swipeView
        currentIndex: tabBar.currentIndex
        Page {
            id: managementPage
            Rectangle {
                anchors.fill: parent
                color: "blue"
            }
            Text {
                id: text1
                x: 21
                y: 33
                text: qsTr("I am the very model of a modern major general!")
                color: "red"
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
            }
        }
        Page {
            id: expiredPage
            Rectangle {
                anchors.fill: parent
                color: "blue"
            }
            Text {
                id: text6
                x: 21
                y: 33
                text: qsTr("2 I am the very model of a modern major general!")
                color: "red"
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
            }
        }

    }
    footer: TabBar {
            id: tabBar
            currentIndex: swipeView.currentIndex
            TabButton {
                text: "Management"
            }
            TabButton {
                text: "Expired"
            }
        }
}
