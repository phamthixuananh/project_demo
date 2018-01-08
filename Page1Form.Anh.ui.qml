import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: root
    title: qsTr("Page cua Anh")

    SwipeView {
        id: swipeView3
        currentIndex: tabBar2.currentIndex
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
                text: name
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
            id: tabBar2
            currentIndex: swipeView3.currentIndex
            TabButton {
                text: "Management"
            }
            TabButton {
                text: "Expired"
            }
        }
}
