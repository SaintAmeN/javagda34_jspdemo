<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 8/1/20
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Student Details</title>
    <style>
        table, td, th {
            border: 1px solid #000;
        }

        .details-element {
            display: grid;
            grid-template-columns: 1fr 1fr;
        }
    </style>
</head>
<body>
<jsp:include page="/navigator.jsp"/>
<hr>
<div style="margin:auto; width:100%;display: grid;grid-template-columns: 1fr 1fr;">
    <div>
        <div class="details-element">
            <label for="id">Identifier:</label>
            <div id="id">${requestScope.student.id}</div>
        </div>
        <div class="details-element">
            <label for="firstName">First name:</label>
            <div id="firstName">${requestScope.student.firstName}</div>
        </div>
        <div class="details-element">
            <label for="lastName">Last name:</label>
            <div id="lastName">${requestScope.student.lastName}</div>
        </div>
        <div class="details-element">
            <label for="average">Average:</label>
            <div id="average">${requestScope.student.average}</div>
        </div>
        <div class="details-element">
            <label for="gender">Gender:</label>
            <div id="gender">${requestScope.student.gender}</div>
        </div>
        <div class="details-element">
            <label for="active">Active:</label>
            <div id="active">${requestScope.student.active}</div>
        </div>
    </div>
    <div>
        <%--  Dodawanie /usuwanie ocen  --%>
        <a href="${pageContext.request.contextPath}/grade/add?studentId=${requestScope.student.id}">Add grade</a>

        <table style="width: 100%">
            <tr>
                <th>Id</th>
                <th>Value</th>
                <th>Subject</th>
                <th>Date added</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="grade" items="${requestScope.student.gradeSet}">
                <tr>
                    <td>${grade.id}</td>
                    <td>${grade.value}</td>
                    <td>${grade.subject}</td>
                    <td>${grade.dateAdded}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/grade/edit?gradeId=${grade.id}&studentId=${requestScope.student.id}" }>
                            Edit
                        </a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/grade/delete?gradeId=${grade.id}" }>
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
