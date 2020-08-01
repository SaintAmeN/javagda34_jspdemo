package com.sda.javagda34.webappdemo.servlets;

import com.sda.javagda34.webappdemo.model.Grade;
import com.sda.javagda34.webappdemo.model.GradeSubject;
import com.sda.javagda34.webappdemo.services.GradeService;
import com.sda.javagda34.webappdemo.services.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Optional;

@WebServlet("/grade/add")
public class GradeAddController extends HttpServlet {
    private final GradeService gradeService = new GradeService();
    private final StudentService studentService = new StudentService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("gradeSubjectList", new ArrayList<>(Arrays.asList(GradeSubject.values())));
        req.setAttribute("studentList", studentService.findAll());

        req.getRequestDispatcher("/gradeForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Optional<Grade> gradeOptional = gradeService.processFormParameters(req);

        if(gradeOptional.isPresent()){
            // dodaj do bazy
            gradeService.save(gradeOptional.get());
            // redirect na studenta
            // todo: po poprawnym dodaniu przekieruj na stronę ocen studenta
            resp.sendRedirect(req.getContextPath() + "/student/list");
        } else {
            resp.sendRedirect(req.getContextPath() + "/student/list");
        }
    }
}
