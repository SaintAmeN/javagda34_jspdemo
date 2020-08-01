<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 7/18/20
  Time: 11:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <jsp:include page="/headerLinks.jsp"></jsp:include>
    <title>Index page</title>
</head>
<body class="text-center">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <jsp:include page="/navigator.jsp"/>

    <main role="main" class="inner cover">
        <h1>Cześć <c:out value="${requestScope.imie_do_wyswietlenia}"/> !</h1>
    </main>

    <footer class="mastfoot mt-auto">
        <div class="inner">
            <p>Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>.</p>
        </div>
    </footer>
</div>
<jsp:include page="/footerLinks.jsp"></jsp:include>
</body>
</html>
