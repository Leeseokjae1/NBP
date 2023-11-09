package com.study.nbnb;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/setSession")
public class RoomSave extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String data = request.getParameter("data");
        session.setAttribute("myData", data); 

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.write("Data saved in session");
        out.close();
    }

}
