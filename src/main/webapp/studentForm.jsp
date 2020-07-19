<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 7/18/20
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Student form</title>
</head>
<body>
<jsp:include page="/navigator.jsp"/>
<form action="${requestScope.student_to_edit==null ?'/student' : '/students/edit'}" method="post">
    <input contenteditable="false" type="hidden" name="studentIndex" value="${requestScope.student_to_edit.indexNumber}">

    <label for="index">Index:</label>
    <input id="index" name="index" value="${requestScope.student_to_edit.indexNumber}" type="text"><br/>

    <label for="firstName">First name:</label>
    <input id="firstName" name="firstName" value="${requestScope.student_to_edit.firstName}" type="text"><br/>

    <label for="lastName">Last name:</label>
    <input id="lastName" name="lastName" value="${requestScope.student_to_edit.lastName}" type="text"><br/>

    <label for="average">Average: </label>
    <input id="average" name="average" type="number" value="${requestScope.student_to_edit.average}" step="0.01"><br/>

    <label for="gender">Gender:</label>
    <select name="gender" id="gender">
        <option name="Male" value="MALE" <c:if test="${requestScope.student_to_edit.gender == 'MALE'}">selected</c:if>>
            Male
        </option>
        <option name="Female" value="FEMALE"
                <c:if test="${requestScope.student_to_edit.gender == 'FEMALE'}">selected</c:if> >Female
        </option>
    </select><br/>


    <label for="active">Is Active:</label>
    <input id="active" name="active"
           <c:if test="${requestScope.student_to_edit.active}">checked</c:if> type="checkbox"><br/>

    <input type="submit">
</form>
</body>
</html>
