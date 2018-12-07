package com.musili.hr.controllers;

import com.musili.hr.beans.AccessI;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("logout")
public class LogoutServlet extends HttpServlet {

    @EJB
    AccessI accessI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        session.removeAttribute("username");
        session.invalidate();

        resp.sendRedirect("client_login.jsp");
    }
}
