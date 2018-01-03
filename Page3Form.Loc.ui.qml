import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

Page {
    width: initialWidth
    height: initialHeight

    title: qsTr("Page cua Loc")

    WebView {
        id: webView
        anchors.fill: parent
        url: initialUrl
        onLoadingChanged: {
            if (loadRequest.errorString)
                console.error(loadRequest.errorString);
        }
    }
}
