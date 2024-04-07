<%-- 
    Document   : User
    Created on : 12 Jan, 2024, 10:38:02 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="user"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
    </head>
    <body>
        <form method="POST" action="../Assets/Fileupload/UserUpload.jsp" enctype="multipart/form-data">

            <div class="form-group">
                <label for="txt_name">Name</label>
                <input type="text" class="form-control" required name="txt_name" placeholder="Name" autocomplete="off" oninput="validateName(this)">
                <div id="nameError" style="color: red;"></div>
            </div>
            <div class="form-group">
                <label for="txt_address">Address</label>
                <input type="text" class="form-control" autocomplete="off" required name="txt_address">
            </div>
            <tr>
            <div class="form-group">
                <label for="txt_age">Age</label>
                <input type="text" class="form-control" required name="txt_age" id="txt_age" placeholder="Age" oninput="validateAge(this)">
                <span id="age-error" style="color: red;"></span>
            </div>
            <div class="form-group">
                <label for="txt_contact">Contact</label>
                <input type="text" class="form-control" required name="txt_contact" onchange="checknum(this)" autocomplete="off" placeholder="Enter your contact number">
                <span id="contact"></span>
            </div>
            <div class="form-group">
                                <label for="txt_contact">Email</label>

                <input type="email" class="form-control" required name="txt_email" autocomplete="off"  placeholder="Enter your email address" 
                       onchange="validateEmail(this.value)"/><span id="content"></span>
                <span id="emailStatus"></span>
            </div>
            <div class="form-group">
                                <label for="txt_contact">District</label>

                <select name="txt_dis" id="" onchange="getPlace(this.value)">
                    <option value="">..Select...</option>
                    <%
                        String selUser = "select *from tbl_district";
                        ResultSet u1 = user.selectCommand(selUser);
                        while (u1.next()) {
                    %>
                    <option value="<%=u1.getString("district_id")%>"><%=u1.getString("district_name")%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                                <label for="txt_contact">Place</label>

                <select name="txt_place" id="sel_place" autocomplete="off">
                    <option value="">..Select..</option>

                </select>
            </div>
            <div class="form-group">
                                <label for="txt_contact">Photo</label>

                <input type=file name="txt_photo">
            </div>

            <div class="form-group">
                <label for="txt_password">Password</label>
                <input type="password" name="txt_password" id="txt_password" class="form-control" onkeyup="checkPasswordMatch()">
                <span id="password-message" style="color: green;"></span>
                <ul>
                    <li id="length-li">Be at least 8 characters long</li>
                    <li id="uppercase-li">Contain at least one uppercase letter (A-Z)</li>
                    <li id="number-li">Contain at least one number (0-9)</li>
                    <li id="start-letter-li">Start with a letter</li>
                </ul>
                <label for="txt_password">Confirm Password</label>
                <input type="password" name="txt_confirmpassword" id="txt_confirmpassword" class="form-control" onkeyup="checkPasswordMatch()">
                <div id="pass"></div>
            </div>
            <div class="form-group">
                <input type="submit" name="txt_save" id="registerButton" value="Save">
                <input type="submit" name="txt_cancel" value="Cancel">
            </div>

        </form> 
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

        </script><br>
    </body>
</html>
<script>
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

    //age validation
    function validateAge(ageInput) {
        var age = ageInput.value;
        var ageError = document.getElementById("age-error");

        if (!/^\d+$/.test(age)) {
            ageError.innerHTML = "Age should only contain digits.";
            ageInput.setCustomValidity("Invalid age");
        } else {
            age = parseInt(age, 10); // Convert age to an integer
            if (isNaN(age) || age < 18 || age > 150) {
                ageError.innerHTML = "Under 18 is Not Eligible.";
                ageInput.setCustomValidity("Invalid age");
            } else {
                ageError.innerHTML = "";
                ageInput.setCustomValidity("");
            }
        }
    }

    //Password validation
    function checkPasswordMatch() {
        var password = document.getElementById("txt_password").value;
        var confirmPassword = document.getElementById("txt_confirmpassword").value;
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