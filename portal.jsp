<%@ page language="java" %>

<%

  String login_status = String.valueOf(session.getAttribute("login_status"));

  if(login_status.equals("yes")){

%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="assets/style.css" type="text/css">
    <title>Portal Home</title>
  </head>
  <body>
    <div class="user">
      <p>Hello
        <%
          String uname = String.valueOf(session.getAttribute("uname"));
          out.print(uname);
        %>
      </p>
    </div>
    <h1>Welcome to the Portal</h1>
    <span class="lines" onclick="openNav()">&#9776;</span>
    <div id="sidebar" class="sidebar">
      <span class="close" onclick="closeNav()">&times;</span>
      <a href="#">Home</a>
      <a href="#">About</a>
      <a href="#">Service</a>
      <a href="#">Gallery</a>
      <a href="#">Client</a>
      <a href="#">Contact</a>
      <a href="LogoutServlet">Logout</a>
    </div>
    <script type="text/javascript">
      const openNav = () => {
        document.getElementById("sidebar").style.width = "250px";
      }
      const closeNav = () => {
        document.getElementById("sidebar").style.width = "0px";
      }
    </script>
  </body>
</html>

<%
  }
  else{
    session.setAttribute("login_status","Please login");

%>
<jsp:forward page="index.jsp" />
<%

  }

%>
