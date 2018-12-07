<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.musili.projectManagement.model.Project" %>
<%@ page import="java.util.List" %>
<%@ page import="com.musili.projectManagement.model.Milestone" %><%--
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

    long clientId=0;
    List<Milestone> milestoneList= null;

    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("pragma","no-cache");
    if(n==null)
    {
        response.sendRedirect("/ConstructionManagementSystem/client_login.jsp");

    }
    else{
        clientId = (long) session.getAttribute("clientId");
        milestoneList=(List<Milestone>) request.getAttribute("allMilestones");

    }%>
<body>
<%--Header navigation menu--%>
<%@include file="navigation/client_nav_header.jsp"%>

<div class="container-fluid ">
    <div class="row">
        <div class="col-lg-1" >
            <%--Sidebar navigation menu--%>
            <%@include file="navigation/sidebar_navigation.jsp"%>
        </div>
        <div class="col-lg-8">

            <form action="taskServlet" class="form-horizontal" method="post">
                <fieldset>
                    <legend>register</legend>

                    <div class="form-group">
                        <label class="control-label col-md-4"> Names :</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="taskName" placeholder="Enter Task name" required >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4"> Description :</label>
                        <div class="col-md-6">
                            <textarea class="form-control" name="taskDescription"  rows="3" placeholder="type Task description ... " required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4"> Milestone :</label>
                        <div class="col-md-6">
                            <select class="form-control" name="milestone">
                                <%
                                    if ( milestoneList != null) {
                                        for (Milestone allMilestone : milestoneList) {

                                %>
                                <option value="<%=allMilestone.getId()%>"><%=allMilestone.getMilestoneName()%>
                                </option>
                                <%
                                        }

                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">Expected Start Date:</label>
                        <div class="col-md-6">
                            <input type="date" class="form-control" id="start" name="expectedStartDate" value="<%out.write(formatter.format(date));%>"
                                   min="<%out.write(formatter.format(date));%>" max="2030-12-31" /> </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">Expected End Date:</label>
                        <div class="col-md-6">
                            <input type="date" class="form-control" id="starter" name="expectedEndDate" value="<%out.write(formatter.format(date));%>"
                                   min="<%out.write(formatter.format(date));%>" max="2030-12-31" /> </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2"></label>
                    </div>
                    <div class="col-md-4">
                        <input type="submit" name="task" class="btn btn-primary" value="addTask">
                    </div>
                </fieldset>
            </form>

        </div>
        <div class="col-lg-3">
            <img src="/ConstructionManagementSystem/images/admin.jpg" class="img-rounded" alt="Cinque Terre">
            <p>
            <table class="table table-hover" style="width: 50%">
                <tr> Username : <%= n %></tr>
            </table>

            </p>


        </div>
    </div>

</div>

<%--footer navigation bar--%>

<%@include file="navigation/footer.jsp"%>


<%--Bootstrap-footer link--%>
<%@ include file="/bootstrap/bootstrap_footer_link.jsp" %>
</body>
</html>