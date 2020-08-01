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
    <jsp:include page="/headerLinks.jsp"></jsp:include>
    <title>Student form</title>
</head>
<body class="text-center">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <jsp:include page="/navigator.jsp"/>
    <hr>
    <main role="main" class="inner cover">

        <form class="container" style="width: 60%"
              action="${pageContext.request.contextPath}${requestScope.student_to_edit==null ? "/student" : "/students/edit"}"
              method="post">
            <input contenteditable="false" type="hidden" name="id" value="${requestScope.student_to_edit.id}">

            <div class="row">
                <label class="col-md-6" for="studentIndex">Index:</label>
                <input class="col-md-6 form-control" id="studentIndex" name="studentIndex"
                       value="${requestScope.student_to_edit.indexNumber}"
                       type="text"><br/>
            </div>

            <div class="row">
                <label class="col-md-6" for="firstName">First name:</label>
                <input class="col-md-6 form-control" id="firstName" name="firstName"
                       value="${requestScope.student_to_edit.firstName}"
                       type="text"><br/>
            </div>
            <div class="row">
                <label class="col-md-6" for="lastName">Last name:</label>
                <input class="col-md-6 form-control" id="lastName" name="lastName" value="${requestScope.student_to_edit.lastName}"
                       type="text"><br/>
            </div>
            <%--    <label for="average">Average: </label>--%>
            <%--    <input id="average" name="average" type="number" value="${requestScope.student_to_edit.average}" step="0.01"><br/>--%>

            <div class="row">
                <label class="col-md-6" for="gender">Gender:</label>
                <select class="col-md-6 form-control" name="gender" id="gender">
                    <option name="Male" value="MALE"
                            <c:if test="${requestScope.student_to_edit.gender == 'MALE'}">selected</c:if>>
                        Male
                    </option>
                    <option name="Female" value="FEMALE"
                            <c:if test="${requestScope.student_to_edit.gender == 'FEMALE'}">selected</c:if> >Female
                    </option>
                </select><br/>
            </div>


            <div class="row">
                <label class="col-md-6" for="active">Is Active:</label>
                <input class="col-md-6 form-control" id="active" name="active"
                       <c:if test="${requestScope.student_to_edit.active}">checked</c:if> type="checkbox"><br/>

            </div>
            <input class="form-control btn btn-info" type="submit">
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
