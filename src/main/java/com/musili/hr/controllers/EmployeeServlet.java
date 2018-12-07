package com.musili.hr.controllers;

import com.musili.hr.Notification.Sms;
import com.musili.hr.beans.ClientI;
import com.musili.hr.beans.EmployeeI;
import com.musili.hr.beans.RoleI;
import com.musili.common.commonServlets.CommonServletI;
import com.musili.hr.beans.UserI;
import com.musili.hr.model.Client;
import com.musili.hr.model.Employee;
import com.musili.hr.model.Role;
import com.musili.hr.model.User;
import com.musili.projectManagement.beans.ProjectI;
import com.musili.projectManagement.model.Project;

import javax.ejb.EJB;
import javax.enterprise.event.Event;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("employeeServlet")
public class EmployeeServlet extends HttpServlet {

    @EJB
    EmployeeI employeeI;

    @EJB RoleI roleI;

    @EJB
    ProjectI projectI;

    @EJB
    UserI userI;

    @EJB
    CommonServletI commonServletI;

    @EJB
    ClientI clientI;

    @Inject
    @Sms
    private Event<Employee> employeeEvent;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String value=req.getParameter("employee");

        if(value.equals("adderEmployee"))
        {
            long id=Long.valueOf(req.getParameter("client"));

            Client client=null;
            client=clientI.findById(id);

            //populating the roles
            req.setAttribute("allRoles",roleI.fetchAll(client));

            //populating the projects
            req.setAttribute("allProjects",projectI.fetchAll(client));
            //
            req.getRequestDispatcher("add_employee.jsp").forward(req,resp);
        }
        else if(value.equals("addEmployee"))
        {
            createEmployee(req,resp);

        }
       else if(value.equals("deleteEmployee"))
        {

            deleteEmployee(req,resp);
        }
        else if(value.equals("employeeEditor"))
        {
            employeeEditor(req,resp);
        }
        else if(value.equals("editEmployee"))
        {
            editEmployee(req,resp);

        }
        else if(value.equals("viewEmployee"))
        {
            viewEmployee(req, resp);
        }




    }

    private void createEmployee(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException
    {

        Map employeeMap=commonServletI.getFormParameters(req);
        Role role=new Role();
        Client client=new Client();
        Project project=new Project();

        String name= (String) employeeMap.get("name");
        String contact=(String) employeeMap.get("phoneNumber");
        String  empType= (String) employeeMap.get("employeeType");
        long empRole=Long.valueOf((String) employeeMap.get("role"));
        long clientId=Long.valueOf((String) employeeMap.get("client"));
        String username=(String) employeeMap.get("username");
        long projectId=Long.valueOf((String) employeeMap.get("project"));
        String password=username;

        role.setId(empRole);
        client.setId(clientId);
        project.setId(projectId);

        Employee employee=new Employee();
        employee.setName(name);
        employee.setPhoneNumber(contact);
        employee.setClient(client);
        employee.setProject(project);


        User user=new User();

        //role,username,password,client
        user.setRole(role);
        user.setUsername(username);
        user.setPassword(password);
        user.setEmployee(employee);

        employeeI.add(employee);
        userI.add(user);

        //setting session
        HttpSession session=req.getSession();
        session.setAttribute("employeeUsername", username);

        //sending notification to Employee
        employeeEvent.fire(employee);

        viewEmployee(req,resp);

    }

    private void deleteEmployee(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException
    {

        long id=Long.valueOf(req.getParameter("id"));

        Employee employee=employeeI.findById(id);


        employee.setId(id);
        employee.setDeleted(true);

        employeeI.edit(employee);
        viewEmployee(req, resp);

    }

    private void editEmployee(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException
    {
        Map employeeMap=commonServletI.getFormParameters(req);;
        Role role=new Role();
        Project project=new Project();

        long edit = Long.valueOf((String) employeeMap.get("id"));
        String name= (String) employeeMap.get("name");
        String contact=(String) employeeMap.get("phoneNumber");
        long empRole= Long.valueOf((String)employeeMap.get("role"));
        long projectId= Long.valueOf((String)employeeMap.get("project"));
        //String username=(String) employeeMap.get("username");
       //String password=username;

        role.setId(empRole);

        project.setId(projectId);

        Employee employee=new Employee();
        employee.setId(edit);
        employee.setName(name);
        employee.setPhoneNumber(contact);
        employee.setProject(project);

        User user=new User();
        user.setId(user.getId());
        user.setEmployee(employee);

        if(employeeI.edit(employee)!=null)
        {
            viewEmployee(req, resp);
        }


    }

    private void employeeEditor(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        long edit = Long.valueOf(req.getParameter("id"));
        Employee employee=employeeI.findById(edit);
        req.setAttribute("editEmployee",  employee);

        long id=Long.valueOf(req.getParameter("client"));

        Client client=null;
        client=clientI.findById(id);

        //populating the roles
        req.setAttribute("allRoles",roleI.fetchAll(client));

        //populating the projects
        req.setAttribute("allProjects",projectI.fetchAll(client));
        //
        req.getRequestDispatcher("edit_employee.jsp").forward(req,resp);
    }

    private void viewEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        long id=Long.valueOf(req.getParameter("client"));

        Client client=null;
        client=clientI.findById(id);

        req.setAttribute("allEmployees",employeeI.findAll());

        req.getRequestDispatcher("view_employee.jsp").forward(req,resp);
    }
}
