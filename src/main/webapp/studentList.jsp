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
    <jsp:include page="/headerLinks.jsp"></jsp:include>
    <title>Title</title>
    <style>
        table{
            width: 100%;
        }
        table, th, tr{
            border: 1px #fff solid;
        }
    </style>
</head>
<body class="text-center">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <jsp:include page="/navigator.jsp"/>

    <main role="main" class="inner cover">
        <table >
            <tr>
                <th>Index</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Edit</th>
                <th>Delete</th>
                <th>Details</th>
            </tr>
            <c:forEach var="student" items="${requestScope.studentList}">
                <tr>
                    <td>${student.indexNumber}</td>
                    <td>${student.firstName}</td>
                    <td>${student.lastName}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/students/edit?studentId=<c:out value="${student.id}"/>">Edit</a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/students/delete?studentId=<c:out value="${student.id}"/>">Delete</a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/student/details?studentId=<c:out value="${student.id}"/>">Details</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </main>


<footer class="mastfoot mt-auto">
    <div class="inner">
        <p>Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>.
        </p>
    </div>
</footer>
</div>
<jsp:include page="/footerLinks.jsp"></jsp:include>
</body>
</html>
