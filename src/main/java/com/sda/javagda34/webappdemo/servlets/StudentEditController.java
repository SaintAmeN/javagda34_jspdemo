package com.sda.javagda34.webappdemo.servlets;

import com.sda.javagda34.webappdemo.database.EntityDao;
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
import java.util.Optional;

@WebServlet("/students/edit")
public class StudentEditController extends HttpServlet {
    private final EntityDao<Student> studentEntityDao = new EntityDao<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentId = req.getParameter("studentId");
        Optional<Student> studentOptional = studentEntityDao.findById(Long.parseLong(studentId), Student.class);

        if (studentOptional.isPresent()) {
            Student student = studentOptional.get();
            req.setAttribute("student_to_edit", student);

            // tutaj ładujemy formularz i wyświetlamy go użytkownikowi
            req.getRequestDispatcher("/studentForm.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        String index = req.getParameter("studentIndex");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
//        String average = req.getParameter("average");
        String gender = req.getParameter("gender");
        String active = req.getParameter("active");

        Student student = Student.builder()
                .id(id)
                .indexNumber(index)
                .firstName(firstName)
                .lastName(lastName)
//                .average(Double.parseDouble(average))
                .gender(Gender.valueOf(gender))
                .active(active != null && active.equalsIgnoreCase("on"))
                .build();

        studentEntityDao.saveOrUpdate(student);

        resp.sendRedirect(req.getContextPath() + "/students");
    }
}
