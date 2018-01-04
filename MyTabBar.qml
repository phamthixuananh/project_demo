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
                color:"#a9e2f3"
            }
            Component {
                    id: contactDelegate
                    Item {
                        height: 300

                        Image {
                            id: imgAvatar
                            width: 100
                            height: 100
                            source: "/content/images/img_group.png"
                        }

                        Text {
                            id: txtName
                            anchors.left: imgAvatar.right
                            anchors.top: imgAvatar.top
                            text: 'Name: ' + name
                        }
                        Text {
                            id: txtPosition
                            anchors.left: imgAvatar.right
                            anchors.top: txtName.bottom
                            text: 'Position: ' + position
                        }
                        Text {
                            id: txtBirthday
                            anchors.left: imgAvatar.right
                            anchors.top: txtPosition.bottom
                            text: 'Birthday: ' + birthday
                        }

                    }
                }
            ListView {
                anchors.fill: parent
                model: EmployeeModel {}
                delegate: contactDelegate
            }
        }
        Page {
            id: experiodPage
            background: Rectangle {

                color:"#f7d358"
            }
            Text {
                id: txtName2
                text: qsTr("text")
            }
        }
        Page {
            id: accountPage
            background: Rectangle {

                color:"#f6cef5"
            }
            Text {
                text: qsTr("text")
            }
        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        font.capitalization: Font.AllUppercase
        anchors.bottom: parent.bottom

        TabButton {
            text: "Management"
            height: 150
        }
        TabButton {
            text: "Expired"
            height: 150
        }
        TabButton {
            text: "Account"
            height: 150
        }
    }
}
