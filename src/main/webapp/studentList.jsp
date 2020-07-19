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
            <td><c:out value="${student.indexNumber}"/> </td>
            <td><c:out value="${student.firstName}"/> </td>
            <td><c:out value="${student.lastName}"/> </td>
            <td><c:out value="${student.average}"/> </td>
            <td><c:out value="${student.gender}"/> </td>
            <td><c:out value="${student.active}"/> </td>
            <td></td>
            <td></td>
        </tr>
    </c:forEach>
</table>

<%
        out.println("<a href=\"studentEditHandler.jsp?studentIndex="+studentList.get(i).getIndexNumber()+"\">Edit</a>");
        out.print("</td>");
        out.print("<td>");
        out.println("<a href=\"studentDeleteHandler.jsp?studentIndex="+studentList.get(i).getIndexNumber()+"\">Delete</a>");
        out.print("</td>" +
                "</tr>");
    }
    out.print("</table>");
%>
</body>
</html>
