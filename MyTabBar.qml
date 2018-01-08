import QtQuick 2.6
import QtQuick.Controls 2.1
import "ManagementEmployee.js" as ManagementEmp
Page {
    id: page
    title: qsTr("Page cua Anh")
    property bool showDetail: false
    property alias msg: pageDetail
    Connections {
        target: stackView
    }

    //ListModel { id: employees }
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
                        text: 'Name: ' + model.name
                    }
                    Text {
                        id: txtPosition
                        anchors.left: imgAvatar.right
                        anchors.top: txtName.bottom
                        text: 'Position: ' + model.position
                    }
                    Text {
                        id: txtBirthday
                        anchors.left: imgAvatar.right
                        anchors.top: txtPosition.bottom
                        text: 'Birthday: ' + model.birthday

                    }
                    MouseArea {
                        id: mouse
                        anchors.fill: parent
                        onClicked: {
//                            pageDetail.visible = true
//                            listAll.visible = false
//                            showDetail = true
//                            btnBack.visible = true
//                            pageDetail.children = ""
                            stackView.push({item: "Page1Form.Anh.ui.qml", properties: {name: "red"}})
//                            var component= Qt.createComponent("EmployeeDetailPage.qml")
//                                        var loadwin = component.createObject(pageDetail)
//                                        loadwin.name = name
//                                        loadwin.pos = position
//                                        loadwin.birthday = birthday
//                                        loadwin.dateContract = dateContract
//                                        ManagementEmp.funcLoadDetail(loadwin.msg)
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
                model: ListModel {
                    id: employees
                }

                Component.onCompleted: ManagementEmp.getOrUpdateEmployees(employees)
                delegate: contactDelegate

            }

            Item {
                anchors.top: btnBack.bottom
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
