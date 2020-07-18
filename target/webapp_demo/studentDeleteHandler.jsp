<%@ page import="com.sda.javagda34.webappdemo.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 7/18/20
  Time: 2:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Delete Handler</title>
</head>
<body>
<%
    String studentIndex = request.getParameter("studentIndex");
    Object studentListResult = session.getAttribute("studentList");
    List<Student> studentList;
    if(studentListResult instanceof List){
        studentList = (List<Student>) studentListResult;
    }else {
        studentList = new ArrayList<>();
    }
    for (int i = 0; i < studentList.size(); i++) {
        if(studentList.get(i).getIndexNumber().equalsIgnoreCase(studentIndex)){
            studentList.remove(studentList.get(i));
            break;
        }
    }
    session.setAttribute("studentList", studentList);

    response.sendRedirect("/studentList.jsp");
%>
</body>
</html>
