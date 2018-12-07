package com.musili.projectManagement.controllers;

import com.musili.common.commonServlets.CommonServletI;
import com.musili.hr.beans.ClientI;
import com.musili.hr.model.Client;
import com.musili.projectManagement.beans.MilestoneI;
import com.musili.projectManagement.beans.ProjectI;
import com.musili.projectManagement.model.Milestone;
import com.musili.projectManagement.model.Project;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet("milestoneServlet")
public class MilestoneServlet extends HttpServlet {

    @EJB
    ProjectI projectI;

    @EJB
    ClientI clientI;


    @EJB
    MilestoneI milestoneI;


    @EJB
    CommonServletI commonServletI;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String milestoneButton=req.getParameter("milestone");
        if(milestoneButton.equalsIgnoreCase("adderMilestone")){

            //populating the projects
            req.setAttribute("allProjects",projectI.findAll());
            //
            req.getRequestDispatcher("add_milestone.jsp").forward(req,resp);

        }
        else if(milestoneButton.equalsIgnoreCase("viewerMilestone"))
        {
            populateMilestoneDetails(req,resp);
        }
        else if(milestoneButton.equalsIgnoreCase("addMilestone")){

            createMilestone(req,resp);

        }
        else if(milestoneButton.equalsIgnoreCase("deleteMilestone"))
        {
            removeMilestone(req,resp);
        }
        else if(milestoneButton.equalsIgnoreCase("editorMilestone"))
        {
            long edit = Long.valueOf(req.getParameter("id"));
            Milestone milestone=milestoneI.findById(edit);
            req.setAttribute("editMilestone",  milestone);
            //populating the projects
            req.setAttribute("allProjects",projectI.findAll());
            req.getRequestDispatcher("edit_milestone.jsp").forward(req,resp);
        }
        else if(milestoneButton.equalsIgnoreCase("editMilestone"))
        {
           updateMilestone(req,resp);
        }
        else if(milestoneButton.equalsIgnoreCase("viewViaProject"))
        {

            viewMilestoneViaProject(req,resp);
        }
    }

    private void createMilestone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Map projectMap = commonServletI.getFormParameters(req);

        Milestone milestone = new Milestone();
        String name = (String) projectMap.get("milestoneName");
        String milestoneDescription=(String) projectMap.get("milestoneDescription");
        long projectId= Long.valueOf((String) projectMap.get("project"));

        try {
            Date expEndDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedEndDate"));
            Date expStartDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedStartDate"));
            long expDuration = commonServletI.getDuration(expEndDate, expStartDate);

            Project project=new Project();
            project.setId(projectId);

            milestone.setMilestoneName(name);
            milestone.setMilestoneDescription(milestoneDescription);
            milestone.setProject(project);
            milestone.setExpectedStartDate(expStartDate);
            milestone.setExpectedEndDate(expEndDate);
            milestone.setExpectedDuration(expDuration);

            milestoneI.add(milestone);

            populateMilestoneDetails(req, resp);

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }


    private void populateMilestoneDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long id=Long.valueOf(req.getParameter("client"));

        Client client=null;
        client=clientI.findById(id);

        /*List<Project> list=projectI.fetchAll(client);
        List<Milestone> list1=null;

        for(Project project:  list)
        {
        list1.add((Milestone) milestoneI.fetchAll(project.getClient())) ;
        }
*/
        //resp.sendRedirect("client_dashboard.jsp");
        req.setAttribute("allMilestones", milestoneI.findAll());
        req.getRequestDispatcher("view_milestone.jsp").forward(req,resp);
    }

    private void removeMilestone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id=Long.valueOf(req.getParameter("id"));

        Milestone milestone=milestoneI.findById(id);

        milestone.setId(id);
        milestone.setDeleted(true);

        milestoneI.edit(milestone);

        populateMilestoneDetails(req, resp);



    }
    private void updateMilestone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map projectMap = commonServletI.getFormParameters(req);

        Milestone milestone = new Milestone();
        long id = Long.valueOf((String) projectMap.get("id"));
        String name = (String) projectMap.get("milestoneName");
        String milestoneDescription=(String) projectMap.get("milestoneDescription");
        long projectId= Long.valueOf((String) projectMap.get("project"));

        try {
            Date expEndDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedEndDate"));
            Date expStartDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedStartDate"));
            long expDuration = commonServletI.getDuration(expEndDate, expStartDate);

            //setting the actual date
            Date actEndDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("actualEndDate"));
            Date actStartDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("actualStartDate"));
            long actDuration = commonServletI.getDuration(actEndDate, actStartDate);

            Project project=new Project();
            project.setId(projectId);

            milestone.setId(id);
            milestone.setMilestoneName(name);
            milestone.setMilestoneDescription(milestoneDescription);
            milestone.setProject(project);
            milestone.setExpectedStartDate(expStartDate);
            milestone.setExpectedEndDate(expEndDate);
            milestone.setExpectedDuration(expDuration);
            milestone.setActualStartDate(actStartDate);
            milestone.setActualEndDate(actEndDate);
            milestone.setActualDuration(actDuration);

            milestoneI.edit(milestone);

            populateMilestoneDetails(req, resp);

        } catch (ParseException e) {
            e.printStackTrace();
        }



    }

    private void viewMilestoneViaProject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long edit = Long.valueOf(req.getParameter("id"));
       Project project=projectI.findById(edit);
        req.setAttribute("allMilestones",milestoneI.fetchMilestoneByProject(project));
        //resp.sendRedirect("client_dashboard.jsp");
        req.getRequestDispatcher("view_milestone_via_project.jsp").forward(req,resp);
    }


}

