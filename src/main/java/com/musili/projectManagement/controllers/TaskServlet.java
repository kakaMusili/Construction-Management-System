package com.musili.projectManagement.controllers;

import com.musili.common.commonServlets.CommonServletI;
import com.musili.projectManagement.beans.MilestoneI;
import com.musili.projectManagement.beans.TaskI;
import com.musili.projectManagement.model.Milestone;
import com.musili.projectManagement.model.Project;
import com.musili.projectManagement.model.Task;

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
import java.util.Map;

@WebServlet("taskServlet")
public class TaskServlet extends HttpServlet {

    @EJB
    CommonServletI commonServletI;

    @EJB
    MilestoneI milestoneI;

    @EJB
    TaskI taskI;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taskButton=req.getParameter("task");

        if(taskButton.equalsIgnoreCase("adderTask")){

            //populating the milestone

            req.setAttribute("allMilestones",milestoneI.findAll());

            req.getRequestDispatcher("add_task.jsp").forward(req,resp);

        }
        else if(taskButton.equalsIgnoreCase("viewerTask"))
        {
            populateTaskDetails(req,resp);
        }
        else if(taskButton.equalsIgnoreCase("addTask")){

            createTask(req,resp);

        }
        else if(taskButton.equalsIgnoreCase("deleteTask"))
        {
            removeTask(req,resp);
        }
        else if(taskButton.equalsIgnoreCase("editorTask"))
        {
            long edit = Long.valueOf(req.getParameter("id"));
            Task task =taskI.findById(edit);
            req.setAttribute("editTask", task);
            //populating the projects
            req.setAttribute("allMilestones",milestoneI.findAll());
            req.getRequestDispatcher("edit_task.jsp").forward(req,resp);
        }
        else if(taskButton.equalsIgnoreCase("editTask"))
        {
            updateTask(req,resp);
        }
        else if(taskButton.equalsIgnoreCase("viewViaMilestone"))
        {
            viewTaskViaMilestone(req,resp);
        }
    }


    private void populateTaskDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // HttpSession session = req.getSession();
        req.setAttribute("allTasks",taskI.findAll());
        //resp.sendRedirect("client_dashboard.jsp");
        req.getRequestDispatcher("view_task.jsp").forward(req,resp);
    }
    private void createTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Map projectMap = commonServletI.getFormParameters(req);

        Task task=new Task();
        String name = (String) projectMap.get("taskName");
        String milestoneDescription=(String) projectMap.get("taskDescription");
        long milestoneId= Long.valueOf((String) projectMap.get("milestone"));

        try {
            Date expEndDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedEndDate"));
            Date expStartDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedStartDate"));
            long expDuration = commonServletI.getDuration(expEndDate, expStartDate);

            Milestone milestone=new Milestone();
            milestone.setId(milestoneId);

            task.setTaskName(name);
            task.setTaskDescription(milestoneDescription);
            task.setMilestone(milestone);
            task.setExpectedStartDate(expStartDate);
            task.setExpectedEndDate(expEndDate);
            task.setExpectedDuration(expDuration);

            taskI.add(task);

            populateTaskDetails(req, resp);

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    private void removeTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id=Long.valueOf(req.getParameter("id"));

        Task task=taskI.findById(id);

        task.setId(id);
        task.setDeleted(true);

        taskI.edit(task);

        populateTaskDetails(req, resp);



    }

    private void updateTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Map projectMap = commonServletI.getFormParameters(req);

        Task task=new Task();
        long id = Long.valueOf((String) projectMap.get("id"));
        String name = (String) projectMap.get("taskName");
        String milestoneDescription=(String) projectMap.get("taskDescription");
        long milestoneId= Long.valueOf((String) projectMap.get("milestone"));

        try {
            Date expEndDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedEndDate"));
            Date expStartDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("expectedStartDate"));
            long expDuration = commonServletI.getDuration(expEndDate, expStartDate);

            //setting the actual date
            Date actEndDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("actualEndDate"));
            Date actStartDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) projectMap.get("actualStartDate"));
            long actDuration = commonServletI.getDuration(actEndDate, actStartDate);

            Milestone milestone=new Milestone();
            milestone.setId(milestoneId);

            task.setId(id);
            task.setTaskName(name);
            task.setTaskDescription(milestoneDescription);
            task.setMilestone(milestone);
            task.setExpectedStartDate(expStartDate);
            task.setExpectedEndDate(expEndDate);
            task.setExpectedDuration(expDuration);
            task.setActualStartDate(actStartDate);
            task.setActualEndDate(actEndDate);
            task.setActualDuration(actDuration);

            taskI.edit(task);

            populateTaskDetails(req, resp);

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    private void viewTaskViaMilestone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long edit = Long.valueOf(req.getParameter("id"));
        Milestone milestone=milestoneI.findById(edit);
        req.setAttribute("allTasks",taskI.fetchTaskByMilestone(milestone));
        //resp.sendRedirect("client_dashboard.jsp");
        req.getRequestDispatcher("view_task_via_milestone.jsp").forward(req,resp);
    }
}
