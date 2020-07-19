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

@WebServlet("/students")
public class StudentListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object studentListObject = req.getSession().getAttribute("student_list");
        List<Student> studentList;
        if (studentListObject instanceof List) {
            studentList = (List<Student>) studentListObject;
        } else {
            studentList = new ArrayList<>();
        }
        req.setAttribute("studentList", studentList);

        req.getRequestDispatcher("/studentList.jsp").forward(req, resp);
    }
}
