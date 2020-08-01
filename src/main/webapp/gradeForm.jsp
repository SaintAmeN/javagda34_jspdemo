<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 8/1/20
  Time: 9:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Grade Form</title>
</head>
<body>
<jsp:include page="/navigator.jsp"/>

<form action='${pageContext.request.contextPath}/grade/add' method="post">
    <label for="studentId">Student id:</label>
    <select id="studentId" name="studentId">
        <c:forEach var="student" items="${requestScope.studentList}">
            <option value="${student.id}" name="${student.id}" >${student.firstName}</option>
        </c:forEach>
    </select><br/>

    <label for="gradeValue">Grade value:</label>
    <input id="gradeValue" name="gradeValue" type="number" step="0.5" min="2" max="6" value="5"><br/>

    <label for="subject">Grade subject:</label>
    <select id="subject" name="subject" type="text">
        <c:forEach var="subj" items="${requestScope.gradeSubjectList}">
            <option value="${subj}" name="${subj}">${subj}</option>
        </c:forEach>
    </select><br/>

    <input type="submit">
</form>

</body>
</html>
