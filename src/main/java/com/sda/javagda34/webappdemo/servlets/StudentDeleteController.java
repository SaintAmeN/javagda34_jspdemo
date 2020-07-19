package com.sda.javagda34.webappdemo.servlets;

import com.sda.javagda34.webappdemo.database.EntityDao;
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

@WebServlet("/students/delete")
public class StudentDeleteController extends HttpServlet {
    private final EntityDao<Student> studentEntityDao = new EntityDao<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // localhost:8080/studentDeleteHandler.jsp?studentId=5
        // usunięcie studenta z numerem indeksu 5
        String studentId = req.getParameter("studentId");

        Optional<Student> studentOptional = studentEntityDao.findById(Long.parseLong(studentId), Student.class);
        if(studentOptional.isPresent()) {
            Student student = studentOptional.get();
            studentEntityDao.delete(student);
            System.out.println("Success!");
        }else{
            System.out.println("Does not exist!");
        }

        resp.sendRedirect("/students");

    }
}
