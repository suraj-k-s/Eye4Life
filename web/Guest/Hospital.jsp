<%-- 
Document   : Hospital
Created on : 29 Dec, 2023, 2:31:08 PM
Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="hosp"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="../Assets/Template/Guest/images/favicon.png" type="">

        <title> Online MediLab </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="../Assets/Template/Guest/css/bootstrap.css" />

        <!-- fonts style -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

        <!--owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

        <!-- font awesome style -->
        <link href="../Assets/Template/Guest/css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="../Assets/Template/Guest/css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="../Assets/Template/Guest/css/responsive.css" rel="stylesheet" />

    </head>


    <body>

        <div class="hero_area">

            <div class="hero_bg_box">
                <img src="../Assets/Template/Guest/images/hero-bg.png" alt="">
            </div>

            <!-- header section strats -->
            <header class="header_section">
                <div class="container">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="index.html">
                            <span>
                                Eye4Life
                            </span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="../index.html">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Login.jsp">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Hospital.jsp">Hospital</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="User.jsp">User</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="../indexContact.jsp">Contact Us</a>
                                </li>

                            </ul>
                        </div>
                    </nav>
                </div>
            </header>
            <br><br><br><br>
            <div class="container">
                <form method="POST" action="../Assets/Fileupload/HospitalUpload.jsp" enctype="multipart/form-data">
                    <h1 class="text-center">New Hospital</h1>
                    <table class="table" cellpadding="10" align="center">
                        <tr>
                            <td>Hospital Name</td>
                            <td>
                                <input type="text" class="form-control" required name="txt_name" placeholder="Name" autocomplete="off" oninput="validateName(this)">
                                <div id="nameError" style="color: red;"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td>
                                <label for="txt_address">Address</label>
                                <input type="text" class="form-control" autocomplete="off" required name="txt_address">

                            </td>
                        </tr>
                        <tr>
                            <td>Contact</td>
                            <td>
                                <input type="text" class="form-control" required name="txt_contact" onchange="checknum(this)" autocomplete="off" placeholder="Enter your contact number">
                                <span id="contact"></span>

                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>
                                <input type="email" class="form-control" required name="txt_email" autocomplete="off"  placeholder="Enter your email address" 
                                       onchange="validateEmail(this.value)"/><span id="content"></span>
                                <span id="emailStatus"></span>
                            </td>

                        </tr>

                        <tr>
                            <td>District</td>
                            <td>
                                <select name="dis" id="" onchange="getPlace(this.value)">
                                    <option value="select">select District</option>
                                    <%
                                        String selqry = "select * from tbl_district";
                                        ResultSet p1 = hosp.selectCommand(selqry);
                                        while (p1.next()) {
                                    %>
                                    <option value="<%=p1.getString("district_id")%>"><%=p1.getString("district_name")%></option>
                                    <%
                                        }
                                    %>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td>Place</td>
                            <td>
                                <select name="place" id="sel_place">
                                    <option value="select">select Place</option>
                                    <%
                                        String placqry = "select * from tbl_place";
                                        ResultSet p2 = hosp.selectCommand(placqry);
                                        while (p2.next()) {
                                    %>
                                    <option value="<%=p2.getString("place_id")%>"><%=p2.getString("place_name")%></option>
                                    <%
                                        }
                                    %>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td>Logo</td>
                            <td>
                                <input type="file" class="form-control-file" required autocomplete="off" name="txt_logo">
                            </td>
                        </tr>
                        <tr>
                            <td>Proof</td>
                            <td>
                                <input type="file" class="form-control-file" required autocomplete="off" name="txt_proof">
                            </td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td>
                                <input type="password" class="form-control" required autocomplete="off" name="txt_password" id="password" onkeyup="checkPasswordMatch()">
                                <ul id="passwordRules">
                                    <li id="length-li">Be at least 8 characters long</li>
                                    <li id="uppercase-li">Contain at least one uppercase letter (A-Z)</li>
                                    <li id="number-li">Contain at least one number (0-9)</li>
                                    <li id="start-letter-li">Start with a letter</li>
                                </ul>
                                <span id="password-message" style="color: red;"></span> <!-- Error message container -->
                            </td>
                        </tr>
                        <tr>
                            <td>Confirm Password</td>
                            <td>
                                <input type="password" class="form-control" required autocomplete="off" name="txt_confirmpassword" id="confirmPassword" onkeyup="checkPasswordMatch()">
                                <span id="pass" style="color: red;"></span> <!-- Password match message container -->
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <button type="submit" name="txt_register" class="btn btn-primary">Register</button>
                                <button type="submit" name="txt_cancel" class="btn btn-secondary">Cancel</button>
                            </td>
                        </tr>
                    </table>
                </form>

            </div>
            <br><br><br><br><br><br><br><br><br>
            <!-- footer section -->
            <footer class="footer_section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-3 footer_col">
                            <div class="footer_contact">
                                <h4>
                                    Reach at..
                                </h4>
                                <div class="contact_link_box">
                                    <a href="">
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                        <span>
                                            Location
                                        </span>
                                    </a>
                                    <a href="">
                                        <i class="fa fa-phone" aria-hidden="true"></i>
                                        <span>
                                            Call +01 1234567890
                                        </span>
                                    </a>
                                    <a href="">
                                        <i class="fa fa-envelope" aria-hidden="true"></i>
                                        <span>
                                            demo@gmail.com
                                        </span>
                                    </a>
                                </div>
                            </div>
                            <div class="footer_social">
                                <a href="">
                                    <i class="fa fa-facebook" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-twitter" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-linkedin" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-instagram" aria-hidden="true"></i>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 footer_col">
                            <div class="footer_detail">
                                <h4>
                                    About
                                </h4>
                                <p>
                                    Beatae provident nobis mollitia magnam voluptatum, unde dicta facilis minima veniam corporis laudantium alias tenetur eveniet illum reprehenderit fugit a delectus officiis blanditiis ea.
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-2 mx-auto footer_col">
                            <div class="footer_link_box">
                                <h4>
                                    Links
                                </h4>
                                <div class="footer_links">
                                    <a class="active" href="index.html">
                                        Home
                                    </a>
                                    <a class="" href="about.html">
                                        About
                                    </a>
                                    <a class="" href="departments.html">
                                        Departments
                                    </a>
                                    <a class="" href="doctors.html">
                                        Doctors
                                    </a>
                                    <a class="" href="contact.html">
                                        Contact Us
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3 footer_col ">
                            <h4>
                                Newsletter
                            </h4>
                            <form action="#">
                                <input type="email" placeholder="Enter email" />
                                <button type="submit">
                                    Subscribe
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="footer-info">
                        <p>
                            &copy; <span id="displayYear"></span>
                            <a href="https://html.design/"><br><br></a>
                            &copy; <span id="displayYear"></span>
                            <a href="https://themewagon.com/"></a>
                        </p>

                    </div>  
                </div>
            </footer>
            <!-- footer section -->
            <script src="../Assets/JQuery/jQuery.js"></script>
            <script>
                                    function getPlace(did)
                                    {
                                        $.ajax({url: "../Assets/AjaxPages/AjaxPlace.jsp?disid=" + did,
                                            success: function(result) {
                                                $("#sel_place").html(result);
                                            }
                                        })
                                    }

                                    //Name Validation
                                    function validateName(input) {
                                        var name = input.value;
                                        var errorMessage = document.getElementById("nameError");

                                        if (/\d/.test(name) || name.charAt(0) !== name.charAt(0).toUpperCase()) {
                                            errorMessage.innerHTML = "Name must start with a capital letter and cannot contain numbers.";
                                            errorMessage.style.color = "red";
                                            input.value = '';
                                            input.focus();
                                        } else {
                                            errorMessage.innerHTML = ""; // Clear the error message if no issues
                                        }
                                    }

                                    //Contact Validation

                                    function checknum(elem) {
                                        var numericExpression = /^\d{10}$/;
                                        if (elem.value.match(numericExpression)) {
                                            document.getElementById("contact").innerHTML = "<span style='color: green;'>Contact Number dialed perfectly</span>";
                                            return true;
                                        } else {
                                            document.getElementById("contact").innerHTML = "<span style='color: red;'>Invalid Contact Number</span>";
                                            elem.focus();
                                            return false;
                                        }
                                    }
                                    //email validation
                                    function validateEmail(email) {
                                        var emailexp = /@gmail\.com$/;



                                        if (email.match(emailexp)) {
                                            //            document.getElementById("content").innerHTML = "<span style='color: green;'>Your email is spot-on</span>";
                                            checkEmailAjax(email);
                                        } else {
                                            document.getElementById("content").innerHTML = "<span style='color: red;'>Check Email Address Entered</span>";
                                            document.getElementById("emailStatus").innerHTML = "";
                                        }
                                    }

                                    function checkEmailAjax(email) {
                                        var xhr = new XMLHttpRequest();
                                        xhr.onreadystatechange = function() {
                                            if (xhr.readyState == 4 && xhr.status == 200) {
                                                document.getElementById("emailStatus").innerHTML = xhr.responseText;
                                                document.getElementById("content").innerHTML = "";
                                            }
                                        };
                                        xhr.open("GET", "../Assets/AjaxPages/AjaxEmail.jsp?email=" + encodeURIComponent(email), true);
                                        xhr.send();
                                    }

                                    //Password validation
                                    function checkPasswordMatch() {
                                        var password = document.getElementById("password").value;
                                        var confirmPassword = document.getElementById("confirmPassword").value;
                                        var passMessage = document.getElementById("pass");

                                        var lengthLi = document.getElementById("length-li");
                                        var uppercaseLi = document.getElementById("uppercase-li");
                                        var numberLi = document.getElementById("number-li");
                                        var startLetterLi = document.getElementById("start-letter-li");
                                        var passwordMessage = document.getElementById("password-message");

                                        // Regular expressions for checking password requirements
                                        var lengthPattern = /.{8,}/;
                                        var uppercasePattern = /[A-Z]/;
                                        var numberPattern = /[0-9]/;
                                        var startLetterPattern = /^[A-Za-z]/;

                                        // Check and update each requirement
                                        var isLengthValid = lengthPattern.test(password);
                                        var isUppercaseValid = uppercasePattern.test(password);
                                        var isNumberValid = numberPattern.test(password);
                                        var isStartLetterValid = startLetterPattern.test(password);

                                        lengthLi.innerHTML = isLengthValid ? "Be at least 8 characters long &#10004;" : "Be at least 8 characters long";
                                        uppercaseLi.innerHTML = isUppercaseValid ? "Contain at least one uppercase letter (A-Z) &#10004;" : "Contain at least one uppercase letter (A-Z)";
                                        numberLi.innerHTML = isNumberValid ? "Contain at least one number (0-9) &#10004;" : "Contain at least one number (0-9)";
                                        startLetterLi.innerHTML = isStartLetterValid ? "Start with a letter &#10004;" : "Start with a letter";

                                        if (isLengthValid && isUppercaseValid && isNumberValid && isStartLetterValid) {
                                            passwordMessage.innerHTML = "<span style='color: green;'>Password meets all requirements &#10004;</span>";
                                            // Enable the registration button if all requirements are met
                                            document.getElementById("registerButton").disabled = false;
                                        } else {
                                            passwordMessage.innerHTML = "";
                                            // Disable the registration button if any requirement is not met
                                            document.getElementById("registerButton").disabled = true;
                                        }

                                        // Check if passwords match
                                        if (password === confirmPassword) {
                                            passMessage.innerHTML = "<span style='color: green;'>Passwords match &#10004;</span>";
                                        } else if (confirmPassword) {
                                            passMessage.innerHTML = "<span style='color: red;'>Passwords do not match</span>";
                                            document.getElementById("registerButton").disabled = true;
                                        } else {
                                            passMessage.innerHTML = "";
                                        }
                                    }


            </script>

            <!-- jQery -->
            <script type="text/javascript" src="../Assets/Template/Guest/js/jquery-3.4.1.min.js"></script>
            <!-- popper js -->
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
            </script>
            <!-- bootstrap js -->
            <script type="text/javascript" src="../Assets/Template/Guest//js/bootstrap.js"></script>
            <!-- owl slider -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
            </script>
            <!-- custom js -->
            <script type="text/javascript" src="../Assets/Template/Guest/js/custom.js"></script>
            <!-- Google Map -->
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
            </script>
            <!-- End Google Map -->

    </body>

</html>
