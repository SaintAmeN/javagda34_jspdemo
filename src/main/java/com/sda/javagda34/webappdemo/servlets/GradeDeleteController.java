package com.sda.javagda34.webappdemo.servlets;

import com.sda.javagda34.webappdemo.services.GradeService;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
@WebServlet("/grade/delete")
public class GradeDeleteController extends HttpServlet {
    private final GradeService gradeService = new GradeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String gradeId = req.getParameter("gradeId");

        gradeService.deleteGrade(gradeId);

        // referer to strona która przekierowała nas na ten adres
        // poniższa linia przekieruje użytkownika na stronę z której wykonał akcję usunięcia
        resp.sendRedirect(req.getHeader("referer"));
    }
}
