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
    // localhost:8080/studentDeleteHandler.jsp?studentIndex=5
    // usunięcie studenta z numerem indeksu 5
    String studentIndex = request.getParameter("studentIndex");


    // pobranie obiektu (listy studentów) z sesji.
    Object studentListResult = session.getAttribute("studentList");
    // ładujemy do Object, bo chcemy sprawdzić czy jest tam COKOLWIEK (!= null)
    List<Student> studentList;
    if(studentListResult instanceof List){
        studentList = (List<Student>) studentListResult;
    }else {
        studentList = new ArrayList<>();
    }
    // pętla, wyszukiwanie po numerze indeksu
    for (int i = 0; i < studentList.size(); i++) {
        if(studentList.get(i).getIndexNumber().equalsIgnoreCase(studentIndex)){
            // usuwanie studenta
            studentList.remove(studentList.get(i));
            break;
        }
    }
    // ponowny zapis kolekcji (tym razem bez usuniętego studenta)
    session.setAttribute("studentList", studentList);

    response.sendRedirect("/studentList.jsp");
%>
</body>
</html>
