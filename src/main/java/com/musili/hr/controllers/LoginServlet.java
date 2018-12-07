package com.musili.hr.controllers;

import com.musili.hr.beans.AccessI;
import com.musili.hr.beans.ClientI;
import com.musili.hr.beans.RoleI;
import com.musili.hr.model.Client;
import com.musili.hr.model.Employee;
import com.musili.hr.model.User;
import com.musili.projectManagement.beans.ProjectI;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns ="/login")
public class LoginServlet extends HttpServlet {

    @EJB ClientI clientI;
    @EJB
    AccessI accessI;

    @EJB
    ProjectI projectI;

    @EJB
    RoleI roleI;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username=req.getParameter("username");
        String password=req.getParameter("password");

        PrintWriter out=resp.getWriter();

        User user=accessI.login(username,password);
        if(req.getParameter("login").equals("client"))
        {
            //client login
            if(user!=null){

                //setting session
                HttpSession session = req.getSession();
                session.setAttribute("clientId",user.getClient().getId() );
                session.setAttribute("username", username);
                session.setAttribute("clientDetails",clientI.findAll());

                populateProjectDetails(req, resp,user);

            }
            else
            {
                String failed="login failed";
                //setting session
                //HttpSession session = req.getSession();
                req.setAttribute("failed", failed);
                resp.sendRedirect("client_login.jsp");

            }
        } else if (req.getParameter("login").equals("employee")) {
            //Employee login

            if(user!=null){
                //setting session
                HttpSession session = req.getSession();
                session.setAttribute("username", username);

                out.write("successfully logged in as employee");
                //resp.sendRedirect("client_dashboard.jsp");
            }
            else
            {
                String failed="login failed";
                //setting session
                HttpSession session = req.getSession();
                session.setAttribute("failed", failed);
                resp.sendRedirect("client_login.jsp");

            }
        }


    }

    private void populateProjectDetails(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
       // HttpSession session = req.getSession();
        Client client=clientI.findById(user.getClient().getId());
       req.setAttribute("allProjects",projectI.fetchAll(client));
       //resp.sendRedirect("client_dashboard.jsp");
       req.getRequestDispatcher("client_dashboard.jsp").forward(req,resp);
    }

}
