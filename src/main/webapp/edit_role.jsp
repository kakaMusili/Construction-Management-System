<%@ page import="java.util.List" %>
<%@ page import="com.musili.projectManagement.model.Project" %>
<%@ page import="com.musili.hr.model.Employee" %>
<%@ page import="com.musili.hr.model.Role" %>
<%@ page import="com.musili.hr.model.enums.AccessLevel" %>
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
    Role role=null;
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("pragma","no-cache");
    response.setHeader("Expires","0");
    if(n==null)
    {
        response.sendRedirect("/ConstructionManagementSystem/client_login.jsp");

    }
    else{
        clientId = (long) session.getAttribute("clientId");
        role= (Role) request.getAttribute("roleDetails");

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
        <div class="col-lg-9">
            <div class="row">
            </div>

            <div class="row">
                <div class="col-md-6 col-md-offset-4 well">
                    <form class="form-signin" action="roleServlet" method="post">
                        <div class="text-center mb-4">
                            <img class="mb-4" src="../../assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
                            <h1 class="h3 mb-3 font-weight-normal">Add Role</h1>
                        </div>

                        <div class="form-label-group">
                            <label for="inputEmail" class="col-md-4">Role : </label>
                            <div class="col-md-6">
                                <input type="text" id="inputEmail" name="role" class="form-control" value="<%=role.getRole()%>" required autofocus>
                            </div>

                        </div>
                        <input type="hidden" name="id" value="<%=role.getId()%>">
                        <div class="form-group">
                            <label class="control-label col-md-4"> Access level:</label>
                            <div class="col-md-6">
                                <select class="form-control" name="accessLevel">
                                    <% for(AccessLevel accessLevel : AccessLevel.values()){ %>
                                    <option value="<%=accessLevel%>"><%=accessLevel%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <input class="btn btn-lg btn-primary btn-block" name="roleObject" type="submit" value="editRole">
                    </form>
                </div>
            </div>
            <div class="row" style="margin-top: 50px;">

                <%
                    List<Role> list= (List<Role>) request.getAttribute("allRoles");

                %>
                <table class="table table-hover table-responsive">
                    <thead>
                    <tr>
                        <th>Role Id</th>
                        <th>Role Name</th>
                        <th>Access Level</th>
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if(list!=null){
                            for(Role roleList: list)
                            {
                    %>
                    <tr>

                        <td><%=roleList.getId()%></td>
                        <td><%=roleList.getRole()%></td>
                        <td><%=roleList.getAccessLevel()%></td>
                        <td>
                            <form class="form-signin" action="roleServlet" method="post">
                                <a href="update_student.jsp?id=<%=roleList.getId() %>">
                                    <input type="hidden" name="roleId" value="<%=roleList.getId()%>">
                                    <button type="submit" name="roleObject" value="editorRole" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        Edit</button>
                                </a>
                            </form>
                        </td>
                        <td>
                            <form class="form-signin" action="roleServlet" method="post">
                                <a href="admin_dashboard.jsp?id=<%=roleList.getId() %>">
                                    <input type="hidden" name="delete" value="<%=roleList.getId()%>">
                                    <button type="submit" name="roleObject" value="deleteRole" class="btn btn-danger">Delete</button>
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
        <div class="col-lg-2">
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
<footer>
    <%@include file="navigation/footer.jsp"%>
</footer>



<%--Bootstrap-footer link--%>
<%@ include file="/bootstrap/bootstrap_footer_link.jsp" %>
</body>
</html>