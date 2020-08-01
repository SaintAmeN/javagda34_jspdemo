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

<form action="${pageContext.request.contextPath}${requestScope.grade != null ? '/grade/edit' : '/grade/add'}"
      method="post">
    <%-- Gdy jestem na stronie studentDetails to strona przekazuje mi identyfikator studenta któremu dodajemy ocnę --%>
    <c:if test="${requestScope.studentId != null }">
        <input type="hidden" name="editedGradeId" value="${requestScope.grade.id}" readonly>
        <label for="studentId">Student id: ${requestScope.studentId}</label>
        <input type="hidden" readonly value="${requestScope.studentId}" name="studentId">
        <br/>
    </c:if>

    <%--Jeśli wchodzę w formularz z menu i nie wiemy któremu studentowi dodajemy ocenę.
        Dlatego musimy wybrać studenta z listy rozwijanej --%>
    <c:if test="${requestScope.student == null && requestScope.studentId == null}">
        <label for="studentId">Student id:</label>
        <select id="studentId" name="studentId">
            <c:forEach var="student" items="${requestScope.studentList}">
                <option value="${student.id}" name="${student.id}">${student.firstName}</option>
            </c:forEach>
        </select><br/>
    </c:if>

    <label for="gradeValue">Grade value:</label>
    <input id="gradeValue" name="gradeValue" type="number" step="0.5" min="2" max="6"
           value="${requestScope.grade != null ? requestScope.grade.value : "5"}"><br/>

    <label for="subject">Grade subject:</label>
    <select id="subject" name="subject" type="text">
        <c:forEach var="subj" items="${requestScope.gradeSubjectList}">
            <option value="${subj}" name="${subj}"
                    <c:if test="${requestScope.grade.subject == subj}">selected</c:if> >${subj}</option>
        </c:forEach>
    </select><br/>

    <input type="submit">
</form>

</body>
</html>
