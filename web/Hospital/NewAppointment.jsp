<%-- 
    Document   : HospitalVerification
    Created on : 12 Jan, 2024, 11:11:53 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="appoint"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital Verification</title>
    </head>
    <body>
        <%
            if (request.getParameter("accept") != null) {
                String acp = "Update tbl_checkupappointment set appointment_status=1 where appointment_id='" + request.getParameter("accept") + "' ";
                if (appoint.executeCommand(acp)) {
        %>
        <script>
            alert("Accepted");
            window.location = "AcceptedUser.jsp";
        </script>
        <%
                }

            }
            if (request.getParameter("reject") != null) {
                String acp = "Update tbl_checkupappointment set appointment_status=2 where appointment_id='" + request.getParameter("reject") + "' ";
                if (appoint.executeCommand(acp)) {
        %>
        <script>
            alert("Rejected");
            window.location = "Homepage.jsp";
        </script>
        <%
                }

            }
        %>
        <form method="post" action="">
            <table border="2">
                <tr>
                    <td>Si NO</td>
                    <td>Patient Name</td>
                    <td>Blood Type</td>
                    <td>Photo</td>
                    <td>Email</td>
                    <td>Appointment Date</td>
                    <td>Action</td>

                </tr>
                <%
                    int i = 0;
                    String selqry = "select* from tbl_checkupappointment c inner join tbl_donor d on d.donor_id=c.donor_id inner join tbl_user u on u.user_id=d.user_id inner join tbl_bloodtype b on b.bloodtype_id=d.bloodtype_id where appointment_status=0 and hospital_id='" + session.getAttribute("hid") + "' ";
                    ResultSet s1 = appoint.selectCommand(selqry);

                    while (s1.next()) {
                        i++;
                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=s1.getString("user_name")%></td>
                    <td><%=s1.getString("blood_type")%></td>
                    <td><img src="../Assets/Files/Hospital/<%=s1.getString("user_photo")%>" width="150" height="150"></td>
                    <td><%=s1.getString("user_email")%></td>
                    <td><%=s1.getString("donor_registrationdate")%></td>
                    <td><a href="NewAppointment.jsp?accept=<%=s1.getString("appointment_id")%>">Accept</a>
                        <br><a href="NewAppointment.jsp?reject=<%=s1.getString("appointment_id")%>">Reject</a></td>
                </tr>
                 <%
            }
        %>
            </table>
        </form>
       
            <br> <br> <br> <br>
    </body>
</html>
<%@include file="Foot.jsp" %>