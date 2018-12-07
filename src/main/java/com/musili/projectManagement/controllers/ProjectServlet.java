package com.musili.projectManagement.controllers;

import com.musili.common.commonServlets.CommonServletI;
import com.musili.hr.beans.ClientI;
import com.musili.hr.model.Client;
import com.musili.projectManagement.beans.ProjectI;
import com.musili.projectManagement.model.Project;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@WebServlet("projectServlet")
public class ProjectServlet extends HttpServlet {

    @EJB
    ProjectI projectI;

    @EJB
    ClientI clientI;

    @EJB
    CommonServletI commonServletI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String buttonValue = req.getParameter("project");

        if (buttonValue.equals("addProject")) {
            createProject(req, resp);
        } else if (buttonValue.equals("editProject")) {

            editProject(req, resp);
        } else if (buttonValue.equals("viewProject")) {
            viewProjects(req, resp);
        } else if (buttonValue.equals("adderProject")) {

            resp.sendRedirect("add_project.jsp");

        } else if (buttonValue.equals("deleteProject")) {
            deleteProject(req,resp);
            viewProjects(req, resp);

        }
        else if(buttonValue.equals("editorProject"))
        {
            long edit = Long.valueOf(req.getParameter("id"));
            Project project=projectI.findById(edit);
            req.setAttribute("editProject",  project);
            req.getRequestDispatcher("edit_project.jsp").forward(req,resp);

        }

    }

    private void editProject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Map projectMap = commonServletI.getFormParameters(req);

        Project project = new Project();
        long id = Long.valueOf((String) projectMap.get("id"));
        String name = (String) projectMap.get("projectName");
        String country = (String) projectMap.get("projectCountry");
        String city = (String) projectMap.get("projectCity");
        String location = (String) projectMap.get("projectLocation");
        String projectDescription=(String) projectMap.get("projectDescription");
        long clientId= Long.valueOf((String) projectMap.get("client"));


        try {
            Date expEndDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedEndDate"));
            Date expStartDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedStartDate"));
            long expDuration = commonServletI.getDuration(expEndDate, expStartDate);

            //setting the actual date
            Date actEndDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("actualEndDate"));
            Date actStartDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("actualStartDate"));
            long actDuration = commonServletI.getDuration(actEndDate, actStartDate);

            Client client=new Client();
            client.setId(clientId);

            project.setId(id);
            project.setProjectName(name);
            project.setProjectCountry(country);
            project.setProjectCity(city);
            project.setProjectLocation(location);
            project.setExpectedStartDate(expStartDate);
            project.setExpectedEndDate(expEndDate);
            project.setExpectedDuration(expDuration);
            project.setActualStartDate(actStartDate);
            project.setActualEndDate(actEndDate);
            project.setActualDuration(actDuration);
            project.setProjectDescription(projectDescription);
            project.setClient(client);

            if (projectI.edit(project) != null) {
                populateProjectDetails(req, resp,client);

            }


        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    private void createProject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Map projectMap = commonServletI.getFormParameters(req);

        Project project = new Project();
        String name = (String) projectMap.get("projectName");
        String country = (String) projectMap.get("projectCountry");
        String city = (String) projectMap.get("projectCity");
        String location = (String) projectMap.get("projectLocation");
        String projectDescription=(String) projectMap.get("projectDescription");
        long clientId= Long.valueOf((String) projectMap.get("client"));

        try {
            Date expEndDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedEndDate"));
            Date expStartDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedStartDate"));
            long expDuration = commonServletI.getDuration(expEndDate, expStartDate);

            Client client=new Client();
            client.setId(clientId);
            project.setProjectName(name);
            project.setProjectCountry(country);
            project.setProjectCity(city);
            project.setProjectLocation(location);
            project.setExpectedStartDate(expStartDate);
            project.setExpectedEndDate(expEndDate);
            project.setExpectedDuration(expDuration);
            project.setProjectDescription(projectDescription);
            project.setClient(client);

            projectI.add(project);


            populateProjectDetails(req, resp,client);

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }


    private void viewProjects(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long id=Long.valueOf(req.getParameter("client"));

        Client client=null;
        client=clientI.findById(id);
        req.setAttribute("allProjects",projectI.fetchAll(client));

        req.getRequestDispatcher("client_dashboard.jsp").forward(req,resp);
    }

    private void deleteProject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id=Long.valueOf(req.getParameter("id"));

        Project project=projectI.findById(id);

        project.setId(id);
        project.setDeleted(true);
        Client client= null;
        client=clientI.findById(project.getClient().getId());

        if(projectI.edit(project)==null)
        {
           populateProjectDetails(req, resp, client);

        }

    }

    private void populateProjectDetails(HttpServletRequest req, HttpServletResponse resp,Client client) throws ServletException, IOException {
        // HttpSession session = req.getSession();
        client=clientI.findById(client.getId());
        req.setAttribute("allProjects",projectI.fetchAll(client));
        //resp.sendRedirect("client_dashboard.jsp");
        req.getRequestDispatcher("client_dashboard.jsp").forward(req,resp);
    }


}
