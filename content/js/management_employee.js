function showRequestInfo(text) {
        msg.text = msg.text + "\n" + text
}

function makeRequest()
{

    var doc = new XMLHttpRequest();
    msg.text = "";

    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.HEADERS_RECEIVED) {
            showRequestInfo("Headers -->");
            showRequestInfo(doc.getAllResponseHeaders ());
            showRequestInfo("Last modified -->");
            showRequestInfo(doc.getResponseHeader ("Last-Modified"));

        } else if (doc.readyState == XMLHttpRequest.DONE) {
            //var tmp = JSON.parse(doc.responseText)
            //console.log(doc.responseText);
            showRequestInfo(doc.responseText);
//            var a = doc.responseXML.documentElement;
//            for (var ii = 0; ii < a.childNodes.length; ++ii) {
//                showRequestInfo(a.childNodes[ii].nodeName);
//            }
//            showRequestInfo("Headers -->");
//            showRequestInfo(doc.getAllResponseHeaders ());
//            showRequestInfo("Last modified -->");
//            showRequestInfo(doc.getResponseHeader ("Last-Modified"));
        }
    }

    doc.open("GET", "http://192.168.1.56:8080/area/all");
    doc.send();
}
