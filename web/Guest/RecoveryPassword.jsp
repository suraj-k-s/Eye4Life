<%-- 
    Document   : ResetPassword
    Created on : 14 Mar, 2024, 3:25:46 PM
    Author     : DOYAL ELDHO
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .required {
            color: red;
        }

        span {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<%
    if (request.getParameter("btnotp") != null) {
        DB.MailConnection m = new DB.MailConnection();
        String mailid1[] = {request.getParameter("txtemail")};
        Random r = new Random();
        int r_num = r.nextInt(111111) + 99999;
        session.setAttribute("otp", r_num);
        session.setAttribute("email", request.getParameter("txtemail"));
        String subject1 = "Matched Recipient";
        String text1 = "Dear user, \r\n \r\n"
                + " OTP is " + r_num
                + "\r\n \r\n"
                + " Team Eyes For Life.";

        boolean c = m.sendMail(mailid1, subject1, text1);
        if (c) {
%>
<script>
    alert("OTP Sent Successfully, check your Email");
    window.location="OTP.jsp";
</script>
<%
        }
    }
%>
<body>
<div class="container">
    <h2 class="text-center mt-5">Account Recovery</h2>
    <form id="form1" name="form1" method="post" action="">
        <div class="form-group">
            <label for="txtemail">Enter Email<span class="required">*</span></label>
            <input type="email" class="form-control" name="txtemail" id="txtemail" placeholder="Email" required autocomplete="off">
            <span id="email"></span>
        </div>
        <div class="text-center">
            <input type="submit" class="btn btn-primary" name="btnotp" id="btnotp" value="Send OTP">
        </div>
    </form>
</div>
<!-- Bootstrap JS dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
