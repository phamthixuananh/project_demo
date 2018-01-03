import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 600
    height: 400

    Item {
               id: layered

                   opacity: 0.5

                   layer.enabled: true

                   width: 100
                   height: 100

                   Rectangle { width: 80; height: 80; border.width: 1 }
                   Rectangle { x: 20; y: 20; width: 80; height: 80; border.width: 1 }
           }
}

