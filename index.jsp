<%@ page language="java" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="assets/style.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script>
      $(document).ready(function(){
        $("#eye").click(function(){
          $("#eye").toggleClass('fa-eye-slash').addClass('custom');
          var pass = $("#pass");
          if(pass.attr("type") === "password"){
            pass.attr("type","text");
          }
          else{
            pass.attr("type","password");
          }
        });
      });
    </script>
    <title>Login Form</title>
  </head>
  <body>
    <div class="container">
      <img src=".assets/avatar.png" alt="Avatar">
      <p>
        <%

          String login_status = String.valueOf(session.getAttribute("login_status"));

          if(login_status != "null"){
            out.print(login_status);
          }
          else{
            out.print("&nbsp;");
          }

        %>
      </p>
      <form method="post" action="LoginServlet">
        <div class="form-input">
          <i class="fa fa-user cust" aria-hidden="true"></i>
          <input type="text" name="uname" id="uname" placeholder="Enter Username" required><br />
          <i class="fa fa-lock cust" aria-hidden="true"></i>
          <input type="password" name="pass" id="pass" placeholder="Enter Password">
          <i class="fa fa-eye eye" aria-hidden="true" id="eye"></i><br />
          <input type="submit" name="submit" value="LOGIN"><br />
          <a href="#">Forget Password</a>
        </div>
      </form>
    </div>
  </body>
</html>
