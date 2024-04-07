<jsp:useBean class="DB.ConnectionClass" id="user"></jsp:useBean>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>Reset Password</title>
            <style>
                .required {
                    color: red;
                }
                span
                {
                    color: red;
                    font-size: 12px;
                    font-size: 14px;

                }
                .p-viewer {
                    z-index: 9999;
                    position: absolute;
                    left: 560px;
                    margin-top: -60px;
                }

                #message {
                    display:none;
                    color: #000;
                    position: relative;
                    padding: 10px 10px;
                    margin-top: 0px;
                }

                #message p {
                    padding: 0px 35px;
                    font-size: 12px;
                }
                .valid {
                    color: green;
                }

                .valid:before {
                    position: relative;
                    left: -35px;
                    content: "?";
                }

                /* Add a red text color and an "x" when the requirements are wrong */
                .invalid {
                    color: red;
                }

                .invalid:before {
                    position: relative;
                    left: -35px;
                    content: "?";
                }

            </style>
        </head>
    <%

        if (request.getParameter("btnreset") != null) {
            String email = session.getAttribute("email").toString();
            String newp = request.getParameter("txtnew");
            String rep = request.getParameter("txtconfirm");

            if (newp.equals(rep)) {
                String upQry = "update tbl_user set user_password='" + newp + "' where user_email='" + email + "'";
                if (user.executeCommand(upQry)) {
    %> 
    <script>
        alert("Password Updated");
        window.location = "Login.jsp";
    </script> 
    <%
                }
            }
        }

    %>
    <body>
        <p>
            <%
            %>
        </p>
        <br><br><br><br><br>
                            <div id="tab" align="center">
                                <form id="form1" name="form1" method="post" action="">
                                    <table width="407" border="1" cellpadding="10">
                                        <h2> Reset Password</h2>
                                        <tr>
                                            <td><p>New Password<span class="required">  *</span></p>
                                                <p>
                                                    <label for="txtnew"></label>
                                                    <input type="password" name="txtnew" id="txtnew" size="35"required/>
                                                    <i class="fa fa-eye "id="togglePassword" style="margin-left: -30px; cursor: pointer;"></i></p>
                                                <span id="err"></span></div>
                                                <div id="message">
                                                    <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                                                    <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                                                    <p id="number" class="invalid">A <b>number</b></p>
                                                    <p id="length" class="invalid">Minimum <b>8 characters</b></p>
                                                </div>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p>Confirm Password<span class="required">  *</span></p>
                                                <p>
                                                    <label for="txtconfirm"></label>
                                                    <input type="password" name="txtconfirm" id="txtconfirm" onchange="validateConfirmPassword()" size="35" required />
                                                    <span id="scpassword"></span>

                                                </p></td>
                                        </tr>
                                        <tr>
                                            <td><div align="center">
                                                    <input type="submit" name="btnreset" id="btnreset" value="Reset" />
                                                </div></td>
                                        </tr>
                                    </table>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                </form>
                            </div>
                            </body>

                            </html>
                            <script src="../ASSETS/Jquery/jQuery.js"></script>
                            <script >
                                                        //--------------------------------Password Validation------------------------------------------------------ 

                                                        //password validation
                                                        var myInput = document.getElementById("txtnew");
                                                        var letter = document.getElementById("letter");
                                                        var capital = document.getElementById("capital");
                                                        var number = document.getElementById("number");
                                                        var length = document.getElementById("length");

                                                        // When the user clicks on the password field, show the message box
                                                        myInput.onfocus = function() {
                                                            document.getElementById("message").style.display = "block";
                                                        }

                                                        // When the user clicks outside of the password field, hide the message box
                                                        myInput.onblur = function() {
                                                            document.getElementById("message").style.display = "none";
                                                        }

                                                        // When the user starts to type something inside the password field
                                                        myInput.onkeyup = function() {
                                                            // Validate lowercase letters
                                                            var lowerCaseLetters = /[a-z]/g;
                                                            if (myInput.value.match(lowerCaseLetters)) {
                                                                letter.classList.remove("invalid");
                                                                letter.classList.add("valid");
                                                            } else {
                                                                letter.classList.remove("valid");
                                                                letter.classList.add("invalid");
                                                            }

                                                            // Validate capital letters
                                                            var upperCaseLetters = /[A-Z]/g;
                                                            if (myInput.value.match(upperCaseLetters)) {
                                                                capital.classList.remove("invalid");
                                                                capital.classList.add("valid");
                                                            } else {
                                                                capital.classList.remove("valid");
                                                                capital.classList.add("invalid");
                                                            }

                                                            // Validate numbers
                                                            var numbers = /[0-9]/g;
                                                            if (myInput.value.match(numbers)) {
                                                                number.classList.remove("invalid");
                                                                number.classList.add("valid");
                                                            } else {
                                                                number.classList.remove("valid");
                                                                number.classList.add("invalid");
                                                            }

                                                            // Validate length
                                                            if (myInput.value.length >= 8) {
                                                                length.classList.remove("invalid");
                                                                length.classList.add("valid");
                                                            } else {
                                                                length.classList.remove("valid");
                                                                length.classList.add("invalid");
                                                            }
                                                        }

                                                        //--------------------------------Show Password Eye Icon------------------------------------------------------ 

                                                        const togglePassword = document.querySelector('#togglePassword');
                                                                const password = document.querySelector('#txtnew');
                                                                togglePassword.addEventListener('click', function(e) {
                                                                    // toggle the type attribute
                                                                    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                                                                            password.setAttribute('type', type);
                                                                    // toggle the eye slash icon
                                                                    this.classList.toggle('fa-eye-slash');
                                                                });


                                                        //--------------------------------Confirm Password Validation------------------------------------------------------ 

                                                        function validateConfirmPassword()
                                                        {
                                                            var cpassword = document.getElementById("txtconfirm").value;
                                                            var password = document.getElementById("txtnew").value;
                                                            if (cpassword == password)
                                                            {
                                                                document.getElementById("scpassword").innerHTML = "";
                                                                return true;
                                                            }
                                                            else
                                                                document.getElementById("scpassword").innerHTML = "<span style='color: red;text: 12px;font-size: 14px;'>Password doesn't match</span>";
                                                            elem.focus();
                                                            return false;
                                                        }
                            </script>

