<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<header class="masthead mb-auto">
    <div class="inner">
        <h3 class="masthead-brand">Cover</h3>
        <nav class="nav nav-masthead justify-content-center">
            <a class="nav-link active" href="${pageContext.request.contextPath}/">Home</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/students">Student List</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/student">Student Form</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/grade/add">Grade Form</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/tabliczka.jsp">Mul Table</a>
        </nav>
    </div>
</header>