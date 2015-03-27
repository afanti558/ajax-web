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

<script>
    alert(2);
    //①construct the Object XMLHttpRequest and modify the diffrent browser
    /* Create a new XMLHttpRequest object to talk to the Web server */
    var xmlHttp = false;
    /*@cc_on @*/
    /*@if (@_jscript_version >= 5)
     try {
     xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
     } catch (e) {
     try {
     xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
     } catch (e2) {
     xmlHttp = false;
     }
     }
     @end @*/

    if (!xmlHttp &amp;&& typeof XMLHttpRequest != 'undefined') {
        xmlHttp = new XMLHttpRequest();
    }

    // ②send a request to the service
    function callServer() {
        alert("callServer");
        var userName = document.getElementById("userName").value;
        var password = document.getElementById("password").value;

        if ((userName == null) || (userName == "")) return;
        if ((password == null) || (password == "")) return;

        alert(userName + "---" + password);
        // Build the URL to connect to
        var url = "/ajax.json?userName=" + userName + "&password=" + password;
//        http://localhost//ajax.json?userName=admin&password=123456

        // Open a connection to the server
        xmlHttp.open("GET", url, true);

        // Setup a function for the server to run when it's done
        xmlHttp.onreadystatechange = updatePage;

        // Send the request
        xmlHttp.send(null);
    }

</script>
</body>
</html>