<%-- 
    Document   : Login
    Created on : 12 Jan, 2024, 12:41:41 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="log"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>

<%
    if (request.getParameter("btn_login") != null) {
        String email = request.getParameter("txt_email");
        String password = request.getParameter("txt_password");

        String hosp = "select * from tbl_hospital where hosp_email='" + email + "' and hosp_password='" + password + "' and hosp_status=1 ";
        ResultSet h1 = log.selectCommand(hosp);
        String user1 = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "' ";
        ResultSet u1 = log.selectCommand(user1);
        
        //admin
           String admin = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "' ";
        ResultSet a1 = log.selectCommand(admin); 
        
        if (h1.next()) {
            session.setAttribute("hid", h1.getString("hosp_id"));
            session.setAttribute("hname", h1.getString("hosp_name"));
            response.sendRedirect("../Hospital/Homepage.jsp");
        } else if (u1.next()) {
            session.setAttribute("uid", u1.getString("user_id"));
            session.setAttribute("uname", u1.getString("user_name"));
            response.sendRedirect("../User/Homepage.jsp");
        } else if (a1.next()) {
            session.setAttribute("aid", a1.getString("admin_id"));
            session.setAttribute("aname", a1.getString("admin_name"));
            response.sendRedirect("../Admin/HomePage.jsp");
        } 
        else {
%>
<script>
    alert("Invalid User");
</script>
<%
        }
    }

%>




<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login V1</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="../Assets/Template/Login/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../Assets/Template/Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="../Assets/Template/Login/css/util.css">
        <link rel="stylesheet" type="text/css" href="../Assets/Template/Login/css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="../Assets/Template/Login/images/img-01.png" alt="IMG">
                    </div>

                    <form class="login100-form validate-form" method="Post">
                        <span class="login100-form-title">
                            Login
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                            <input class="input100" type="email" name="txt_email" placeholder="Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
                            <input class="input100" type="password" name="txt_password" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" type="submit" name="btn_login">
                                Login
                            </button>
                        </div>

                        <div class="text-center p-t-12">
                            <span class="txt1">
                                Forgot
                            </span>
                            <a class="txt2" href="RecoveryPassword.jsp">
                                Password?
                            </a>
                        </div>

                        <div class="text-center p-t-136">
                            <a class="txt2" href="../index.html">
                                Create your Account
                                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>




        <!--===============================================================================================-->	
        <script src="../Assets/Template/Login/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="../Assets/Template/Login/vendor/bootstrap/js/popper.js"></script>
        <script src="../Assets/Template/Login/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="../Assets/Template/Login/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="../Assets/Template/Login/vendor/tilt/tilt.jquery.min.js"></script>
        <script >
    $('.js-tilt').tilt({
        scale: 1.1
    })
        </script>
        <!--===============================================================================================-->
        <script src="../Assets/Template/Login/js/main.js"></script>

    </body>
</html>