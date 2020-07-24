<%@ page import="java.util.ArrayList" %>
<%@ page import="com.sda.javagda34.webappdemo.model.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 7/18/20
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/navigator.jsp"/>

<table>
    <tr>
        <th>Index</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Average</th>
        <th>Gender</th>
        <th>Is Active</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="student" items="${requestScope.studentList}">
        <tr>
            <td>${student.indexNumber}</td>
            <td>${student.firstName}</td>
            <td>${student.lastName}</td>
            <td>${student.average}</td>
            <td>${student.gender}</td>
            <td>${student.active}</td>
            <td>
                <a href="${pageContext.request.contextPath}/students/edit?studentId=<c:out value="${student.id}"/>">Edit</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/students/delete?studentId=<c:out value="${student.id}"/>">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
