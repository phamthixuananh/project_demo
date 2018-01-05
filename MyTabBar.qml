import QtQuick 2.6
import QtQuick.Controls 2.1

Page {
    id: page
    title: qsTr("Page cua Anh")
    property bool showDetail: false
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
        Component {
                id: contactDelegate
                Item {
                    height: 300
                    width: 500
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
                    MouseArea {
                        id: mouse
                        anchors.fill: parent
                        onClicked: {
                            pageDetail.visible = true
                            listAll.visible = false
                            showDetail = true
                            btnBack.visible = true
                            pageDetail.children = ""
                            var component= Qt.createComponent("EmployeeDetailPage.qml")
                                        var loadwin = component.createObject(pageDetail)
                                        loadwin.name = name
                                        loadwin.pos = position
                                        loadwin.birthday = birthday
                                        loadwin.dateContract = dateContract
                        }

                    }
                }

            }

        Page {
            id: managementPage
            background: Rectangle {
                color:"#a9e2f3"
            }
            Button {
                visible: false
                id: btnBack
                text: "back"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        pageDetail.visible = false
                        listAll.visible = true
                        showDetail = false
                        btnBack.visible = false

                    }
                }
            }

            ListView {
                id: listAll
                anchors.fill: parent
                model: EmployeeModel {}
                delegate: contactDelegate

            }

            Item {
                id: pageDetail
                visible: false
            }
        }
        Page {
            id: experiodPage
            background: Rectangle {

                color:"#f7d358"
            }
            ListView {
                anchors.fill: parent
                model: EmployeeModel {}
                delegate: contactDelegate
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
