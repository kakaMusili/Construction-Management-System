<%--
  Created by IntelliJ IDEA.
  User: Musili
  Date: 9/15/2018
  Time: 10:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Client Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%--Bootstrap-Header link--%>
    <%@ include file="/bootstrap/bootstrap_header.jsp"
    %>
    <link href="/ConstructionManagementSystem/style/style.css" rel="stylesheet">
</head>
<%

    String n = (String) request.getAttribute("failed");
    String fail="";

    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("pragma","no-cache");
    response.setHeader("Expires","0");
    if(n!=null)
    {
        fail="Username or Password is incorrect";

    }%>
<body>
<%--Header navigation menu--%>
<%@include file="navigation/header.jsp"%>
<div class="container " style="width:300px">

    <div class="wrapper">
        <div class="col-md-12 col-md-offset-0 well">
            <form class="form-signin" action="login" method="post">
                <div class="text-center mb-4">
                    <img class="mb-4" src="../../assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
                    <h1 class="h3 mb-3 font-weight-normal">Client Login</h1>
                </div>

                <div class="form-label-group">
                    <label for="inputEmail">Username : </label>
                    <input type="text" id="inputEmail" name="username" class="form-control" placeholder="Enter Username" required autofocus>
                </div>

                <div class="form-label-group">
                    <label for="inputPassword">Password : </label>
                    <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Enter Password" required>

                </div>
                <span class="text-danger">
                    <% out.write(fail);%>
                </span>

                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <input  name="login" type="hidden" value="client">
                <input class="btn btn-lg btn-primary btn-block" name="student" type="submit" value="Sign in">
                <div class="text-center">
                    New Client? <a href="registration.jsp">Sign Up Here</a>
                </div>
            </form>
        </div>
    </div>
</div>

<%--footer navigation bar--%>
<div class="footer">
    <%@include file="navigation/footer.jsp"%>
</div>

<%--Bootstrap-footer link--%>
<%@ include file="/bootstrap/bootstrap_footer_link.jsp" %>
</body>
</html>
