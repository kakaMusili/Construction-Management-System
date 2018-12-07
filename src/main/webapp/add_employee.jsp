<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.musili.hr.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.musili.hr.model.Employee" %>
<%@ page import="com.musili.hr.model.enums.AccessLevel" %>
<%@ page import="com.musili.projectManagement.model.Project" %>
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

    List<Project> projectList= (List<Project>) request.getAttribute("allProjects");

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

    }

%>
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

            <form action="employeeServlet" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Add Employee</legend>

                    <div class="form-group">
                        <label class="control-label col-md-4"> Names :</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="name" placeholder="Enter Employee Names"
                                   required>
                        </div>
                        <input type="hidden" name="client" value="<%=clientId%>">
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4"> Contacts:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="phoneNumber"
                                   placeholder="Enter Employee Contact" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4"> Project :</label>
                        <div class="col-md-6">
                            <select class="form-control" name="project">
                                <%
                                    if ( projectList != null) {
                                        for (Project allProject : projectList) {

                                %>
                                <option value="<%=allProject.getId()%>"><%=allProject.getProjectName()%>
                                </option>
                                <%
                                        }

                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4"> Employee Role :</label>
                        <div class="col-md-6">
                            <select class="form-control" name="role">
                                <%
                                    List<Role> list = (List<Role>) request.getAttribute("allRoles");
                                    if (list != null) {
                                        for (Role roleList : list) {

                                %>
                                <option value="<%=roleList.getId()%>"><%=roleList.getRole()%>
                                </option>
                                <%
                                        }

                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-4">Username :</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="username" placeholder="kaka musili" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2"></label>
                    </div>
                    <div class="col-md-4">
                        <input type="submit" name="employee" class="btn btn-primary" value="addEmployee">
                    </div>
                </fieldset>
            </form>

        </div>
        <div class="col-lg-3">
            <img src="/ConstructionManagementSystem/images/admin.jpg" class="img-rounded" alt="Cinque Terre">
            <p>
            <table class="table table-hover" style="width: 50%">
                <tr> Username : <%=n %></tr>
            <tr> ClientId : <%=clientId %></tr>
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
