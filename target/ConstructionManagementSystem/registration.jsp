<%@ page import="com.musili.hr.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.musili.hr.model.enums.AccessLevel" %><%--
  Created by IntelliJ IDEA.
  User: Musili
  Date: 9/15/2018
  Time: 5:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    String n = (String) session.getAttribute("password");

%>

<body>
<%--Header navigation menu--%>
<%@include file="navigation/header.jsp"%>

<div class="Container">
    <div class="row">
        <div class="col-md-10 offset-md-4">
            <form action="register" class="form-horizontal" method="post">
                <fieldset>
                    <legend>register</legend>

                    <div class="form-group">
                        <label class="control-label col-md-2 "> Names :</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="name" placeholder="Enter fullnames" required >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2"> Contacts :</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="contacts" placeholder="0725330643" required >
                        </div>
                    </div>
                    <div class="form-group">
                            <label class="control-label col-md-2"> Email :</label>
                            <div class="col-md-4">
                                <input type="email" class="form-control" name="email" placeholder="kakamusili@gmail.com" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2"> Address:</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="address" placeholder="Mayfair Casino ,Nairobi kenya" required />
                            </div>
                        </div>
                    <div class="form-group">
                        <label class="control-label col-md-2"> Role :</label>
                        <div class="col-md-4">
                            <select class="form-control" name="role">
                                <option value="1">Admin</option>
                            </select>
                        </div>
                    </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">Username :</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="username" placeholder="kaka musili" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">Password :</label>
                            <div class="col-md-4">
                                <input type="password" class="form-control" name="password"  required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">Confirm Password :</label>
                            <div class="col-md-4">
                                <input type="password" class="form-control" name="confirm_password" required />
                            </div>
                            <div class="text danger"><%if (n!=null) out.write(n);%></div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2"></label>
                        </div>
                        <div class="col-md-4">
                            <input type="submit" name="signup" class="btn btn-primary" value="Register">
                        </div>
                    </fieldset>
            </form>
        </div>
    </div>
</div>
<%--footer navigation bar--%>
<%@include file="navigation/footer.jsp"%>

<%--Bootstrap-footer link--%>
<%@ include file="/bootstrap/bootstrap_footer_link.jsp" %>
</body>
</html>