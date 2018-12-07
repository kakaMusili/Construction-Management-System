<%@ page import="com.musili.hr.model.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="com.musili.projectManagement.model.Project" %>
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

    long clientId=0;

    String hide="";
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("pragma","no-cache");
    response.setHeader("Expires","0");
    if(n==null)
    {
        response.sendRedirect("/ConstructionManagementSystem/client_login.jsp");

    }
    else{
       clientId = (long) session.getAttribute("clientId");

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
            </div>
            <div class="row" style="margin-top: 50px;">

                <%
                    List<Project> list= (List<Project>) request.getAttribute("allProjects");

                    if(list!=null) {
                        for(Project p:list)
                        {
                           if(p.getActualDuration()==0)hide="hidden";
                        }
                    }

                    %>
                <table class="table table-hover table-responsive">
                    <thead>
                    <tr>
                        <th>Project Id</th>
                        <th>Project Name</th>
                        <th>Project Location</th>
                        <th>Project City</th>
                        <th>Project Country</th>
                        <th>Expected Start Date</th>
                        <th>Expected End Date</th>
                        <th>Expected Duration</th>
                        <th <%=hide%>>Actual Start Date</th>
                        <th <%=hide%>>Actual End Date</th>
                        <th <%=hide%>>Actual Duration</th>
                        <td>View Milestone</td>
                        <td>Add Milestone</td>
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if(list!=null){
                            for(Project projectlist: list)
                            {
                    %>
                    <tr>

                        <td><%=projectlist.getId()%></td>
                        <td><%=projectlist.getProjectName()%></td>
                        <td><%=projectlist.getProjectLocation()%></td>
                        <td><%=projectlist.getProjectCity()%></td>
                        <td><%=projectlist.getProjectCountry()%></td>
                        <td><%=projectlist.getExpectedStartDate()%></td>
                        <td><%=projectlist.getExpectedEndDate()%></td>
                        <td><%=projectlist.getExpectedDuration()%></td>
                        <td <%=hide%>><%=projectlist.getActualStartDate()%></td>
                        <td <%=hide%>><%=projectlist.getActualEndDate()%></td>
                        <td <%=hide%>><%=projectlist.getActualDuration()%></td>
                        <td>
                            <form class="form-signin" action="milestoneServlet" method="post">
                                <a href="edit_project.jsp?id=<%=projectlist.getId() %>">
                                    <input type="hidden" name="id" value="<%=projectlist.getId()%>">
                                    <input   name="editor" value="editpro" type="hidden">
                                    <button type="submit" name="milestone" value="viewViaProject" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        view Milestone</button>
                                </a>
                            </form>
                        </td>
                        <td>
                            <form class="form-signin" action="milestoneServlet" method="post">
                                <a href="edit_project.jsp?id=<%=projectlist.getId() %>">
                                    <input type="hidden" name="id" value="<%=projectlist.getId()%>">
                                    <input   name="editor" value="editpro" type="hidden">
                                    <button type="submit" name="milestone" value="addViaProject" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                       Add Milestone</button>
                                </a>
                            </form>
                        </td>
                        <td>
                            <form class="form-signin" action="projectServlet" method="post">
                                <a href="edit_project.jsp?id=<%=projectlist.getId() %>">
                                    <input type="hidden" name="id" value="<%=projectlist.getId()%>">
                                    <input   name="editor" value="editpro" type="hidden">
                                    <button type="submit" name="project" value="editorProject" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        Edit</button>
                                </a>
                            </form>
                        </td>
                        <td>
                            <form class="form-signin" action="projectServlet" method="post">
                                <a href="client_dashboard.jsp?id=<%=projectlist.getId() %>">
                                    <input type="hidden" name="id" value="<%=projectlist.getId()%>">
                                    <button type="submit" onclick="window.alert('are you sure you want to delete');"
                                           name="project" value="deleteProject" class="btn btn-danger">Delete</button>
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
        <%--<div class="col-lg-2">
            <img src="/ConstructionManagementSystem/images/admin.jpg" class="img-rounded" alt="Cinque Terre">
            <p>
            <table class="table table-hover" style="width: 50%">
                <tr> Username : <%=n %></tr>
                <tr> ClientId : <%=clientId %></tr>
            </table>
            <form  action="edit" method="post">
                <input  name="populate" type="hidden" value="add_role">
                <button class="btn btn-default" type="submit">
                    <i class="fas fa-user-edit"></i>
                    Edit Profile
                </button>
            </form>

            </p>

        </div>--%>
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