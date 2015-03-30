<%@ page language="java"  contentType = "text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>登陆</title>
</head>
<body>

    <form action="<c:url value='/ajax.json'/>" id="form1">
        <label for="userName">用户名:</label><input type="text" name="userName" id="userName"><br/>
        <label for="password">密&nbsp;码:</label><input type="password" name="password" id="password"><br/>
        <input type="button" value="登陆" onclick="callServer();"/>
        <input type="reset" value="重置"/>
    </form>

<script type="text/javascript">
    var request;
    // ②create an Object XMLHttpRequest to the variable request
    function createRequest() {
        try {
            request = new XMLHttpRequest();
        } catch (trymicrosoft) {
            try {
                request = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (othermicrosoft) {
                try {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (failed) {
                    request = false;
                }
            }
        }
        if (!request)
            alert("Error initializing XMLHttpRequest!");
    }

    // ②send a request to the service,but before that,the method createRequest should be use
    function callServer() {
        createRequest();
        var userName = document.getElementById("userName").value;
        var password = document.getElementById("password").value;

        if ((userName == null) || (userName == "")) return;
        if ((password == null) || (password == "")) return;

        var url = "/ajax.json?userName=" + userName + "&password=" + password;
//        http://localhost//ajax.json?userName=admin&password=123456

        request.open("GET", url, true);

        request.onreadystatechange = updatePage;

        xmlHttp.send(null);
    }

    function updatePage() {
        if (request.readyState == 4)
            if (request.status == 200)
                alert("Server is done!");
            else if (request.status == 404)
                alert("Request URL does not exist");
            else
                alert("Error: status code is " + request.status);
    }

</script>
</body>
</html>