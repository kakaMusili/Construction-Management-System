<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.musili.projectManagement.model.Project" %><%--
  Created by IntelliJ IDEA.
  User: Musili
  Date: 9/16/2018
  Time: 1:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
    Date date = new Date();

    String n = (String) session.getAttribute("username");

    Project project = (Project) request.getAttribute("editProject");

    long clientId=0;

    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    response.setHeader("pragma", "no-cache");
    response.setHeader("Expires", "0");
    if(n==null)
    {
        response.sendRedirect("/ConstructionManagementSystem/client_login.jsp");

    }
    else{
        clientId = (long) session.getAttribute("clientId");

    }%>
<body>
<%--Header navigation menu--%>
<%@include file="navigation/client_nav_header.jsp" %>

<div class="container-fluid ">
    <div class="row">
        <div class="col-lg-1">
            <%--Sidebar navigation menu--%>
            <%@include file="navigation/sidebar_navigation.jsp"%>

        </div>
        <div class="col-lg-8">

            <form action="projectServlet" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Edit Project</legend>

                    <div class="form-group">
                        <label class="control-label col-md-4"> Names :</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="projectName"
                                   value="<%=project.getProjectName()%>" required>
                        </div>
                        <input type="hidden" name="id" value="<%=project.getId()%>">
                    </div>
                    <input type="hidden" name="client" value="<%=project.getClient().getId()%>">

                    <div class="form-group">
                        <label class="control-label col-md-4"> Description :</label>
                        <div class="col-md-6">
                            <textarea class="form-control" name="projectDescription"  rows="3"  required><%=project.getProjectDescription()%></textarea>                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4"> Country :</label>
                        <div class="col-md-6">
                            <select class="form-control" value="<%=project.getProjectCountry()%>"
                                    name="projectCountry">
                                <option value="Country1">Country1</option>
                                <option value="Country2">Country2</option>
                                <option value="Country3">Country3</option>
                                <option value="Country4">Country4</option>
                                <option value="Country5">Country5</option>
                                <option value="Country6">Country6</option>
                                <option value="Country7">Country7</option>
                                <option value="Country8">Country8</option>
                                <option value="Country9">Country9</option>
                                <option value="Country10">Country10</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4"> City :</label>
                        <div class="col-md-6">
                            <select class="form-control" value="<%=project.getProjectCity()%>" name="projectCity">
                                <option value="City1">City1</option>
                                <option value="City2">City2</option>
                                <option value="City3">City3</option>
                                <option value="City4">City4</option>
                                <option value="City5">City5</option>
                                <option value="City6">City6</option>
                                <option value="City7">City7</option>
                                <option value="City8">City8</option>
                                <option value="City9">City9</option>
                                <option value="City10">City10</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4"> Location :</label>
                        <div class="col-md-6">
                            <select class="form-control" value="<%=project.getProjectLocation()%>"
                                    name="projectLocation">
                                <option value="location1">Location1</option>
                                <option value="location2">Location2</option>
                                <option value="location3">Location3</option>
                                <option value="location4">Location4</option>
                                <option value="location5">Location5</option>
                                <option value="location6">Location6</option>
                                <option value="location7">Location7</option>
                                <option value="location8">Location8</option>
                                <option value="location9">Location9</option>
                                <option value="location10">Location10</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">Expected Start Date:</label>
                        <div class="col-md-6">
                            <input type="date" class="form-control" id="start" name="expectedStartDate"
                                   value="<%=project.getExpectedStartDate()%>"
                                   min="<%out.write(formatter.format(date));%>" max="2030-12-31"/></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">Expected End Date:</label>
                        <div class="col-md-6">
                            <input type="date" class="form-control" id="starter" name="expectedEndDate"
                                   value="<%=project.getExpectedEndDate()%>"
                                   min="<%out.write(formatter.format(date));%>" max="2030-12-31"/></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">Actual Start date:</label>
                        <div class="col-md-6">
                            <input type="date" class="form-control" id="actualstart" name="actualStartDate"
                                   value="<%=project.getActualStartDate()%>"
                                   min="<%out.write(formatter.format(date));%>" max="2030-12-31"/></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">Actual End Date:</label>
                        <div class="col-md-6">
                            <input type="date" class="form-control" id="actualend" name="actualEndDate"
                                   value="<%=project.getActualEndDate()%>"
                                   min="<%out.write(formatter.format(date));%>" max="2030-12-31"/></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2"></label>
                    </div>
                    <div class="col-md-4">
                        <input name="editor" value="editproject" type="hidden">
                        <input type="submit" class="btn btn-primary" name="project" value="editProject">
                    </div>
                </fieldset>
            </form>

        </div>
        <div class="col-lg-3">
            <img src="/ConstructionManagementSystem/images/admin.jpg" class="img-rounded" alt="Cinque Terre">
            <p>
            <table class="table table-hover" style="width: 50%">
                <tr> Username : <%= n %>
                </tr>
            </table>

            </p>

        </div>
    </div>

</div>

<%--footer navigation bar--%>

<%@include file="navigation/footer.jsp" %>

<%--Bootstrap-footer link--%>
<%@ include file="/bootstrap/bootstrap_footer_link.jsp" %>
</body>
</html>