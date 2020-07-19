package com.sda.javagda34.webappdemo.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("")
public class IndexController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // jeśli ktoś przekaże parametr imie, to my wyświetlimy ten parametr
        String imie = request.getParameter("imie");
        if(imie != null && !imie.isEmpty()){
            // przekazujemy "imie" do widoku, żeby je wyświetlić
            request.setAttribute("imie_do_wyswietlenia", imie);
        }

        // w tym miejscu ładujemy plik widoku
        request
                .getRequestDispatcher("/index.jsp")
                .forward(request, response);
    }
}
