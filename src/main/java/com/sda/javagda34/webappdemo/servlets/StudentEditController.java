package com.sda.javagda34.webappdemo.servlets;

import com.sda.javagda34.webappdemo.model.Gender;
import com.sda.javagda34.webappdemo.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/students/edit")
public class StudentEditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentIndex = req.getParameter("studentIndex");
        Object studentListObject = req.getSession().getAttribute("student_list");
        List<Student> studentList;
        if (studentListObject instanceof List) {
            studentList = (List<Student>) studentListObject;
        } else {
            studentList = new ArrayList<>();
        }

        Student student = null;
        // pętla, wyszukiwanie po numerze indeksu
        for (int i = 0; i < studentList.size(); i++) {
            if(studentList.get(i).getIndexNumber().equalsIgnoreCase(studentIndex)){
                student = studentList.get(i);
                break;
            }
        }

        if(student != null) {
            req.setAttribute("student_to_edit", student);

            // tutaj ładujemy formularz i wyświetlamy go użytkownikowi
            req.getRequestDispatcher("/studentForm.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String index = req.getParameter("studentIndex");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String average = req.getParameter("average");
        String gender = req.getParameter("gender");
        String active = req.getParameter("active");

        Student student = Student.builder()
                .indexNumber(index)
                .firstName(firstName)
                .lastName(lastName)
                .average(Double.parseDouble(average))
                .gender(Gender.valueOf(gender))
                .active(active != null && active.equalsIgnoreCase("on"))
                .build();

        Object studentListObject = req.getSession().getAttribute("student_list");
        List<Student> studentList;
        if (studentListObject instanceof List) {
            studentList = (List<Student>) studentListObject;
        } else {
            studentList = new ArrayList<>();
        }


        for (int i = 0; i < studentList.size(); i++) {
            if(studentList.get(i).getIndexNumber().equalsIgnoreCase(index)){
                // usuwanie starego studenta
                studentList.remove(studentList.get(i));
                break;
            }
        }
        studentList.add(student); // umieszczenie nowego i zapis w bazie
        req.getSession().setAttribute("student_list", studentList);
        resp.sendRedirect("/students");
    }
}
