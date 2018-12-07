<%@ page import="java.util.List" %>
<%@ page import="com.musili.projectManagement.model.Project" %>
<%@ page import="com.musili.hr.model.Employee" %>
<%@ page import="com.musili.hr.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>Client Dashboard</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%--Bootstrap-Header link--%>
    <%@ include file="/bootstrap/bootstrap_header.jsp"
    %>
    <link href="/ConstructionManagementSystem/style/style.css" rel="stylesheet">
</head>
<%
    String n = (String) session.getAttribute("username");

    String employee = null;
    Employee failedToDeleteEmployee = (Employee) session.getAttribute("failedToDeleteEmployee");

    //session.removeAttribute("edit");
    //(String) session.getAttribute("employeeUsername")

    String hide="";
    String message="";
    long clientId=0;

    List<Employee> list=null;

    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("pragma","no-cache");
    response.setHeader("Expires","0");
    if(n==null)
    {
        response.sendRedirect("/ConstructionManagementSystem/client_login.jsp");

    }
    else
    {
        clientId = (long) session.getAttribute("clientId");
        list= (List<Employee>) request.getAttribute("allEmployees");

    }
    if(employee!=null) {
    message="<strong>Success!</strong> Employee has added successfullly.\n" +
            "        <strong>username : </strong>"+ employee + "\n" +
            "        <strong>password : </strong>"+ employee + "\n" ;
}
    if(failedToDeleteEmployee!=null)
    {
        message="Failed to delete " + failedToDeleteEmployee.getName();
    }

%>
<body>
<%--Header navigation menu--%>
<%@include file="navigation/client_nav_header.jsp"%>

<div class="container-fluid ">
    <div class="row">
        <div class="col-lg-1" >
            <%--Sidebar navigation menu--%>
            <%@include file="navigation/sidebar_navigation.jsp"%>

        </div>
        <div class="col-lg-11">
            <div class="row">
                <span class="badge badge-success">
                    <%out.write(message);%>
                </span>
            </div>
            <div class="row" style="margin-top: 50px;">

                <table class="table table-hover table-responsive">
                    <thead>
                    <tr>
                        <th>Employee Id</th>
                        <th>Employee Name</th>
                        <th>Employee Contact</th>
                        <th HIDDEN>Username</th>
                        <th hidden>Project Assigned</th>
                        <th HIDDEN>Role Assigned</th>
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if(list!=null){
                            for(Employee employeeList: list)
                            {
                    %>
                    <tr>

                        <td><%=employeeList.getId()%></td>
                        <td><%=employeeList.getName()%></td>
                        <td><%=employeeList.getPhoneNumber()%></td>
                        <td HIDDEN><%//employeeList.getUsername()%></td>
                        <td HIDDEN><%//=employeeList.getEmployee().getProject().getProjectName()%></td>
                        <td HIDDEN><%//=employeeList.getRole().getRole()%></td>
                        <td hidden><%%></td>
                        <td>
                            <form class="form-signin" action="employeeServlet" method="post">
                                <a href="update_student.jsp?id=<%=employeeList.getId() %>">
                                    <input type="hidden" name="id" value="<%=employeeList.getId()%>">
                                    <input type="hidden" value="<%=clientId%>" name="client">
                                    <button type="submit" name="employee" value="employeeEditor" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        Edit</button>
                                </a>
                            </form>
                        </td>
                        <td>
                            <form class="form-signin" action="employeeServlet" method="post">
                                <a href="view_employee.jsp?id=<%=employeeList.getId() %>">
                                    <input type="hidden" name="id" value="<%=employeeList.getId()%>">
                                    <input type="hidden" value="<%=clientId%>" name="client">
                                    <button type="submit"  name="employee" value="deleteEmployee" class="btn btn-danger">Delete</button>
                                </a>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>

                </table>
            </div>


        </div>
    </div>

</div>

<%--footer navigation bar--%>
<footer>
    <%@include file="navigation/footer.jsp"%>
</footer>



<%--Bootstrap-footer link--%>
<%@ include file="/bootstrap/bootstrap_footer_link.jsp" %>
</body>
</html>