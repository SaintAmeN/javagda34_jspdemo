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
    <title>Index page</title>
</head>
<body>
<jsp:include page="/navigator.jsp"/>
<%--<%--%>
<%--    out.print(request.getAttribute("imie_do_wyswietlenia"));--%>
<%--%>--%>
<h1>Cześć ! <c:out value="${requestScope.imie_do_wyswietlenia}"/></h1>
</body>
</html>
