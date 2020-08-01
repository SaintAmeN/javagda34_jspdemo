<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<ul>
    <li>
        <a href="${pageContext.request.contextPath}/">Home</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/tabliczka.jsp">Tabliczka mnozenia</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/student">Formularz dodawania studenta</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/students">Lista studentów</a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/grade/add">Dodawanie oceny</a>
    </li>
</ul>