
/**
  load list employee from server
  **/
function funcLoadAllEmployeesFromServer(employees) {
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.HEADERS_RECEIVED) {

        } else if (doc.readyState == XMLHttpRequest.DONE && doc.status==200) {
            var objectArray = JSON.parse(doc.responseText);
            if (objectArray.errors !== undefined)
              console.log("Error fetching tweets: " + objectArray.errors[0].message)
          else {
              for (var key in objectArray.datas) {
                  var jsonObject = objectArray.datas[key];
                  employees.append(jsonObject);
              }
          }
            //parent.text = doc.responseText;
        }
    }

    doc.open("GET", "http://192.168.1.56:8080/employee/all");
    doc.send();
}

/**
  load list employee local from file json
  **/
function funcLoadAllEmployeesFromLocal(employees) {
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.HEADERS_RECEIVED) {

        } else if (doc.readyState == XMLHttpRequest.DONE) {
            var objectArray = JSON.parse(doc.responseText);
            if (objectArray.errors !== undefined)
              console.log("Error fetching tweets: " + objectArray.errors[0].message)
          else {
              for (var key in objectArray.datas) {
                  var jsonObject = objectArray.datas[key];
                  employees.append(jsonObject);
              }
          }
            //parent.text = doc.responseText;
        }
    }

    doc.open("GET", "employees_local_data.json");
    doc.send();
}

/**
  load list employee: if server error then load local
  **/
function getOrUpdateEmployees(employees) {
    funcLoadAllEmployeesFromServer(employees);
    if (employees.count==0) {
        funcLoadAllEmployeesFromLocal(employees)
    }
}

/**
  get detail employee by email
  **/
function funcLoadDetail(parent, email) {
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.HEADERS_RECEIVED) {

        } else if (doc.readyState == XMLHttpRequest.DONE) {
            parent.text = doc.responseText;
        }
    }

    doc.open("GET", "http://192.168.1.56:8080/employee/all");

    doc.send();
}

