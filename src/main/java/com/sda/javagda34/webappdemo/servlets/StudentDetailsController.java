package com.sda.javagda34.webappdemo.servlets;

import com.sda.javagda34.webappdemo.model.Student;
import com.sda.javagda34.webappdemo.services.StudentService;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@Slf4j
@WebServlet("/student/details")
public class StudentDetailsController extends HttpServlet {
    private final StudentService studentService = new StudentService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // musimy pobrać i wyświetlić szczegółowe informacje o podanym studencie.
        // na liście może się znajdować "okrojony" zbiór informacji, więc na tej stronie wypisane będą  wszystkie pola
        String studentId = req.getParameter("studentId");

        Optional<Student> studentOptional = studentService.findById(studentId);
        if(studentOptional.isPresent()) { // jeśli uda się odnaleźć studenta, to wyświetl stronę
            req.setAttribute("student", studentOptional.get());
            req.getRequestDispatcher("/studentDetails.jsp").forward(req, resp);
        }else{      // jeśli studenta nie odnajdziemy, to przekieruj użytkownika na listę studentów
            log.info("Student wasn't found. Redirecting back to student list.");
            resp.sendRedirect(req.getContextPath() + "/students");
        }
    }
}
