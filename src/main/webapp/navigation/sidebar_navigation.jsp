<%--
  Created by IntelliJ IDEA.
  User: Musili
  Date: 9/24/2018
  Time: 8:23 AM
  To change this template use File | Settings | File Templates.
--%>
    <div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <form action="projectServlet" method="post">
    <input type="hidden" value="<%=clientId%>" name="client">
    <button class="btn btn-dark" type="submit" name="project" value="viewProject">
    <i class="fas fa-home fa-2x"></i>
    Dashboard
    </button>
    </form>
    <%--<a href="client_dashboard.jsp">View Projects</a>--%>
    <form action="projectServlet" method="post">
    <button class="btn btn-dark"  name="project" type="submit" value="adderProject">
    <i class="fas fa-plus-circle  fa-2x"></i>
    Add Project
    </button>
    </form><%--<a href="client_dashboard.jsp">View Projects</a>--%>
    <form action="milestoneServlet" method="post">
    <button class="btn btn-dark"  name="milestone" type="submit" value="adderMilestone">
    <i class="fas fa-plus-square fa-2x"></i>
    Add Milestone
    </button>
    </form>
    <form action="milestoneServlet" method="post">
    <input type="hidden" value="<%=clientId%>" name="client">
    <button class="btn btn-dark"  name="milestone" type="submit" value="viewerMilestone">
    <i class="fas fa-stream fa-2x"></i>
    View Milestone
    </button>
    </form>
     <form action="taskServlet" method="post">
    <button class="btn btn-dark"  name="task" type="submit" value="adderTask">
    <i class="fas fa-plus fa-2x"></i>
    Add Task
    </button>
    </form>
     <form action="taskServlet" method="post">
    <input type="hidden" value="<%=clientId%>" name="client">
    <button class="btn btn-dark"  name="task" type="submit" value="viewerTask">
    <i class="fas fa-align-right fa-2x"></i>
    View Tasks
    </button>
    </form>
    <form  action="employeeServlet" method="post">
    <input type="hidden" value="<%=clientId%>" name="client">
    <button class="btn btn-dark" type="submit" name="employee" value="adderEmployee">
    <i class="fas fa-user-plus fa-2x"></i>
    Add Employee
    </button>
    </form>
    <form  action="employeeServlet" method="post">
    <input type="hidden" value="<%=clientId%>" name="client">
    <button class="btn btn-dark" type="submit" name="employee" value="viewEmployee">
    <i class="fas fa-users fa-2x"></i>
    View Employee
    </button>
    </form>
    <form  action="roleServlet" method="post">
    <input  name="populate" type="hidden" value="add_role">
    <input type="hidden" value="<%=clientId%>" name="client">
    <button class="btn btn-dark" type="submit" name="roleObject" value="viewRole">
    <i class="fas fa-tasks fa-2x"></i>
    Add role
    </button>
    </form>
    </div>
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>
    <script>
    function openNav() {
    document.getElementById("mySidenav").style.width = "200px";
    }

    function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    }
    </script>
