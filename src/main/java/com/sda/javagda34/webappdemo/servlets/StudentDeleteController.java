package com.sda.javagda34.webappdemo.servlets;

import com.sda.javagda34.webappdemo.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/student/delete")
public class StudentDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // localhost:8080/studentDeleteHandler.jsp?studentIndex=5
        // usunięcie studenta z numerem indeksu 5
        String studentIndex = req.getParameter("studentIndex");

        // pobranie obiektu (listy studentów) z sesji.
        Object studentListResult = req.getSession().getAttribute("studentList");
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
        req.getSession().setAttribute("student_list", studentList);

        resp.sendRedirect("/students");

    }
}
