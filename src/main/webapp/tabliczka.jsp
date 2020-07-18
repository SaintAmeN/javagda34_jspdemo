<%--
  Created by IntelliJ IDEA.
  User: amen
  Date: 7/18/20
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tabliczka</title>
</head>
<body>

<form action="tabliczka.jsp" method="get">
    Rozmiar X: <input type="number" min="0" name="rozmiarX"><br/>
    Rozmiar Y: <input type="number" min="0" name="rozmiarY"><br/>
    <input type="submit">
</form>

<hr>
<table>
<%
    String rozmiarX = request.getParameter("rozmiarX");
    String rozmiarY = request.getParameter("rozmiarY");
    int rozmiarXint;
    int rozmiarYint;

    try {
        rozmiarXint = Integer.parseInt(rozmiarX);
    }catch (NumberFormatException nfe){
        rozmiarXint = 10;
    }

    try {
        rozmiarYint = Integer.parseInt(rozmiarY);
    }catch (NumberFormatException nfe){
        rozmiarYint = 10;
    }

    for (int i = 1; i < rozmiarXint; i++) {
        out.print("<tr>"); // wiersz
        for (int j = 1; j < rozmiarYint; j++) {
            out.print("<td>");
            out.print(i*j);
            out.print("</td>");
        }
        out.print("</tr>");
    }
%>
</table>
</body>
</html>
