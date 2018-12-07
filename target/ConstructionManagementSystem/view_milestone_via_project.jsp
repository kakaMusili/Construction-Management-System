<%@ page import="com.musili.hr.model.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="com.musili.projectManagement.model.Project" %>
<%@ page import="com.musili.projectManagement.model.Milestone" %>
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
                    List<Milestone> list= (List<Milestone>) request.getAttribute("allMilestones");

                %>
                <table class="table table-hover table-responsive">
                    <thead>
                    <tr>
                        <th>Milestone Id</th>
                        <th>Project Name</th>
                        <th>Milestone Name</th>
                        <th>Milestone Description</th>
                        <th>Expected Start Date</th>
                        <th>Expected End Date</th>
                        <th>Expected Duration</th>
                        <th>Actual Start Date</th>
                        <th>Actual End Date</th>
                        <th>Actual Duration</th>
                        <th>view Task</th>
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if(list!=null){
                            for(Milestone milestonelist: list)
                            {
                    %>
                    <tr>

                        <td><%=milestonelist.getId()%></td>
                        <td><%=milestonelist.getProject().getProjectName()%></td>
                        <td><%=milestonelist.getMilestoneName()%></td>
                        <td><%=milestonelist.getMilestoneDescription()%></td>
                        <td><%=milestonelist.getExpectedStartDate()%></td>
                        <td><%=milestonelist.getExpectedEndDate()%></td>
                        <td><%=milestonelist.getExpectedDuration()%></td>
                        <td ><%=milestonelist.getActualStartDate()%></td>
                        <td ><%=milestonelist.getActualEndDate()%></td>
                        <td ><%=milestonelist.getActualDuration()%></td>
                        <td>
                            <form class="form-signin" action="taskServlet" method="post">
                                <a href="edit_project.jsp?id=<%=milestonelist.getId() %>">
                                    <input type="hidden" name="id" value="<%=milestonelist.getId()%>">
                                    <input   name="editor" value="editpro" type="hidden">
                                    <button type="submit" name="task" value="viewViaMilestone" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        View Task</button>
                                </a>
                            </form>
                        </td>
                        <td>
                            <form class="form-signin" action="milestoneServlet" method="post">
                                <a href="edit_project.jsp?id=<%=milestonelist.getId() %>">
                                    <input type="hidden" name="id" value="<%=milestonelist.getId()%>">
                                    <input   name="editor" value="editpro" type="hidden">
                                    <button type="submit" name="milestone" value="editorMilestone" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        Edit</button>
                                </a>
                            </form>
                        </td>
                        <td>
                            <form class="form-signin" action="milestoneServlet" method="post">
                                <a href="client_dashboard.jsp?id=<%=milestonelist.getId() %>">
                                    <input type="hidden" name="id" value="<%=milestonelist.getId()%>">
                                    <button type="submit" onclick="window.alert('are you sure you want to delete');"
                                            name="milestone" value="deleteMilestone" class="btn btn-danger">Delete</button>
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
