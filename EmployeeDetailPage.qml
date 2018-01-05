import QtQuick 2.0

Item {
    property string name: ""
    property string pos: ""
    property string dateContract: ""
    property string birthday: ""
    anchors.fill: parent

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
        text: 'Position: ' + pos
    }
    Text {
        id: txtBirthday
        anchors.left: imgAvatar.right
        anchors.top: txtPosition.bottom
        text: 'Birthday: ' + birthday

    }
    Text {
        id: txtDateContract
        anchors.left: imgAvatar.right
        anchors.top: txtBirthday.bottom
        text: 'Birthday: ' + dateContract

    }
}

