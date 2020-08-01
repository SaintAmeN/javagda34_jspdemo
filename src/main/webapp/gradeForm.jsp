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
    <jsp:include page="/headerLinks.jsp"></jsp:include>
    <title>Grade Form</title>
</head>
<body class="text-center">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <jsp:include page="/navigator.jsp"/>
    <hr>
    <main role="main" class="inner cover">

        <form class="container" style="width: 60%"
              action="${pageContext.request.contextPath}${requestScope.grade != null ? '/grade/edit' : '/grade/add'}"
              method="post">
            <%-- Gdy jestem na stronie studentDetails to strona przekazuje mi identyfikator studenta któremu dodajemy ocnę --%>
            <c:if test="${requestScope.studentId != null }">
                <input type="hidden" name="editedGradeId" value="${requestScope.grade.id}" readonly>
                <div class="row">
                    <label class="col-md-6" for="studentId">Student id: ${requestScope.studentId}</label>
                    <input class="col-md-6 form-control" type="hidden" readonly value="${requestScope.studentId}"
                           name="studentId">
                </div>
                <br/>
            </c:if>

            <%--Jeśli wchodzę w formularz z menu i nie wiemy któremu studentowi dodajemy ocenę.
                Dlatego musimy wybrać studenta z listy rozwijanej --%>
            <c:if test="${requestScope.student == null && requestScope.studentId == null}">
                <div class="row">
                    <label class="col-md-6" for="studentId">Student id:</label>
                    <select class="col-md-6 form-control" id="studentId" name="studentId">
                        <c:forEach var="student" items="${requestScope.studentList}">
                            <option value="${student.id}" name="${student.id}">${student.firstName}</option>
                        </c:forEach>
                    </select><br/>
                </div>
            </c:if>

            <div class="row">
                <label class="col-md-6" for="gradeValue">Grade value:</label>
                <input class="col-md-6 form-control" id="gradeValue" name="gradeValue" type="number" step="0.5" min="2"
                       max="6"
                       value="${requestScope.grade != null ? requestScope.grade.value : "5"}"><br/>
            </div>

            <div class="row">
                <label class="col-md-6" for="subject">Grade subject:</label>
                <select class="col-md-6 form-control" id="subject" name="subject" type="text">
                    <c:forEach var="subj" items="${requestScope.gradeSubjectList}">
                        <option value="${subj}" name="${subj}"
                                <c:if test="${requestScope.grade.subject == subj}">selected</c:if> >${subj}</option>
                    </c:forEach>
                </select><br/>
            </div>

            <input class="form-control" type="submit">
        </form>
    </main>
    <footer class="mastfoot mt-auto">
        <div class="inner">
            <p>Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>, by <a
                    href="https://twitter.com/mdo">@mdo</a>.
            </p>
        </div>
    </footer>
</div>
<jsp:include page="/footerLinks.jsp"></jsp:include>

</body>
</html>
