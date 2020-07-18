<%@ page import="com.sda.javagda34.webappdemo.model.Student" %>
<%@ page import="com.sda.javagda34.webappdemo.model.Gender" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 7/18/20
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Submit Handler</title>
</head>
<body>

<%
    String index = request.getParameter("index");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String average = request.getParameter("average");
    String gender = request.getParameter("gender");
    String active = request.getParameter("active");

    Student student = Student.builder()
            .indexNumber(index)
            .firstName(firstName)
            .lastName(lastName)
            .average(Double.parseDouble(average))
            .gender(Gender.valueOf(gender))
            .active(active.equalsIgnoreCase("on"))
            .build();

    Object studentListResult = session.getAttribute("studentList");
    List<Student> studentList;
    if(studentListResult instanceof List){
         studentList = (List<Student>) studentListResult;
    }else {
        studentList = new ArrayList<>();
    }

    studentList.add(student);
    session.setAttribute("studentList", studentList);

    response.sendRedirect("/studentList.jsp");
%>
</body>
</html>
