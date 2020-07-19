<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 7/18/20
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student form</title>
</head>
<body>
<jsp:include page="/navigator.jsp"/>
<form action="/student" method="post">
    <label for="index">Index:</label>
    <input id="index" name="index" type="text"><br/>

    <label for="firstName">First name:</label>
    <input id="firstName" name="firstName" type="text"><br/>

    <label for="lastName">Last name:</label>
    <input id="lastName" name="lastName" type="text"><br/>

    <label for="average">Average: </label>
    <input id="average" name="average" type="number" step="0.01"><br/>

    <label for="gender">Gender:</label>
    <select name="gender" id="gender">
        <option name="Male" value="MALE">Male</option>
        <option name="Female" value="FEMALE">Female</option>
    </select><br/>


    <label for="active">Is Active:</label>
    <input id="active" name="active" type="checkbox"><br/>

    <input type="submit">
</form>
</body>
</html>
