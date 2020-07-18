<%@ page import="java.util.ArrayList" %>
<%@ page import="com.sda.javagda34.webappdemo.model.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 7/18/20
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/navigator.jsp"/>

<%
    Object studentListResult = session.getAttribute("studentList");
    List<Student> studentList;
    if(studentListResult instanceof List){
        studentList = (List<Student>) studentListResult;
    }else {
        studentList = new ArrayList<>();
    }
    out.print("<table>");
    out.print("<tr>" +
            "<th>Index</th>" +
            "<th>First Name</th>" +
            "<th>Last Name</th>" +
            "<th>Average</th>" +
            "<th>Gender</th>" +
            "<th>Is active</th>" +
            "</tr>");
    for (int i = 0; i < studentList.size(); i++) {
        out.print("<tr>");
        out.print("<td>");
        out.println(studentList.get(i).getIndexNumber());
        out.print("</td>");
        out.print("<td>");
        out.println(studentList.get(i).getFirstName());
        out.print("</td>");
        out.print("<td>");
        out.println(studentList.get(i).getLastName());
        out.print("</td>");
        out.print("<td>");
        out.println(studentList.get(i).getAverage());
        out.print("</td>");
        out.print("<td>");
        out.println(studentList.get(i).getGender());
        out.print("</td>");
        out.print("<td>");
        out.println(studentList.get(i).isActive());
        out.print("</td></tr>");
    }
    out.print("</table>");
%>
</body>
</html>
