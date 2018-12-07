package com.musili.hr.controllers;

import com.musili.common.commonServlets.CommonServletI;
import com.musili.hr.beans.RoleI;
import com.musili.hr.model.Client;
import com.musili.hr.model.Role;
import com.musili.hr.model.enums.AccessLevel;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@WebServlet( urlPatterns ="/roleServlet")
public class RoleServlet extends HttpServlet {

    @EJB
    RoleI roleI;

    @EJB
    CommonServletI commonServletI;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String submitRole=req.getParameter("roleObject");


        if(submitRole.equalsIgnoreCase("addRole")){
            createRole(req,resp);

        }else if(submitRole.equalsIgnoreCase("deleteRole"))
        {
           deleteRole(req,resp);
        }else if(submitRole.equalsIgnoreCase("viewRole"))
        {
            populateRole(req,resp);
        }else if(submitRole.equalsIgnoreCase("editorRole"))
        {
            Map projectMap = commonServletI.getFormParameters(req);
            long id=Long.valueOf(req.getParameter("roleId"));
            Role role=roleI.findById(id);

            req.setAttribute("roleDetails",role);
            req.setAttribute("allRoles",roleI.findAll());
            req.getRequestDispatcher("edit_role.jsp").forward(req,resp);



        }
        else if(submitRole.equalsIgnoreCase("editRole"))
        {

            updateRole(req,resp);
        }

    }

    private void createRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Role role=new Role();
        Map projectMap = commonServletI.getFormParameters(req);
        String r = (String) projectMap.get("role");
        String  accessLevel=(String) projectMap.get("accessLevel");
        long clientId= Long.valueOf((String) projectMap.get("client"));

        Client client=new Client();
        client.setId(clientId);

        role.setClient(client);
        role.setRole(r);
        role.setAccessLevel(accessLevel);

        roleI.add(role);
        req.setAttribute("allRoles",roleI.findAll());
        req.getRequestDispatcher("add_role.jsp").forward(req,resp);
    }
    private void deleteRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long id=Long.valueOf(req.getParameter("delete"));
        Role role=roleI.findById(id);

        role.setId(id);
        role.setDeleted(true);

       roleI.edit(role);
        populateRole(req,resp);

    }

    private void populateRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("allRoles",roleI.findAll());
        //resp.sendRedirect("client_dashboard.jsp");
        req.getRequestDispatcher("add_role.jsp").forward(req,resp);
    }
 private void updateRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

     Role role=new Role();
     Map projectMap = commonServletI.getFormParameters(req);
     String r = (String) projectMap.get("role");
     String  accessLevel=(String) projectMap.get("accessLevel");
     long roleId= Long.valueOf((String) projectMap.get("id"));

     role.setId(roleId);
     role.setRole(r);
     role.setAccessLevel(accessLevel);

     roleI.edit(role);
     populateRole(req,resp);
    }

}
