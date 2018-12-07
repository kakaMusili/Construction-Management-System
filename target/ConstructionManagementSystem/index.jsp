<!doctype html>
<html lang="en">
<head>
    <title>Welcome to Mjengo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%--Bootstrap-Header link--%>
    <%@ include file="/bootstrap/bootstrap_header.jsp"
    %>
    <link href="/ConstructionManagementSystem/style/style.css" rel="stylesheet">
</head>
<%

    String n = (String) session.getAttribute("failed");
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
                    <h1 class="h3 mb-3 font-weight-normal">Employee Login</h1>
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
                <input  name="login" type="hidden" value="employee">
                <input class="btn btn-lg btn-primary btn-block" name="student" type="submit" value="Sign in">
                <span class="text-danger">
            </span>
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