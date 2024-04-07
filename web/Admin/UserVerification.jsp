<%-- 
    Document   : Donor
    Created on : 26 Jan, 2024, 10:21:48 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="donor"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donor</title>
    </head>
    <style>
        .buttondemo {
            display: inline-block;
            padding: 8px 18px;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
            text-transform: uppercase;
            color: #fff;
            background-color: #3498db; /* Choose your desired background color */
            border: 2px solid #3498db; /* Choose your desired border color */
            border-radius: 5px; /* Adjust the border-radius for rounded corners */
            transition: background-color 0.3s ease, color 0.3s ease;

        }
        .buttondemo:hover {
            background-color: #2980b9; /* Change the background color on hover */
            color: #fff; /* Change the text color on hover */
        }
    </style>
    <body>
        <%

            if (request.getParameter("accept") != null) {
                String acp = "Update tbl_donor set donor_status=1 where donor_id='" + request.getParameter("accept") + "' ";
                if (donor.executeCommand(acp)) {
        %>
        <script>
            alert("Accepted");
            window.location = "AcceptUser.jsp";
        </script>
        <%
                }

            }
            if (request.getParameter("reject") != null) {
                String acp = "Update tbl_donor set donor_status=2 where donor_id='" + request.getParameter("reject") + "' ";
                if (donor.executeCommand(acp)) {
        %>
        <script>
            alert("Rejected");
            window.location = "UserVerification.jsp";
        </script>
        <%
                }

            }
        %>

        <table border="2">
            <tr>
                <td>Si.No</td>
                <td>Donor</td>
                <td>Gender</td>
                <td>Age</td>
                <td>Blood Type</td>
                <td>Registration Date</td>
                <td>Report</td>
                <td>Action</td>

            </tr>
            <%
                int i = 0;
                String selqry = "select* from tbl_donor r inner join tbl_bloodtype b on r.bloodtype_id =b.bloodtype_id inner join tbl_user u on r.user_id =u.user_id inner join tbl_result r1 on r1.donor_id=r.donor_id where donor_status=0";
                ResultSet r1 = donor.selectCommand(selqry);
                ResultSet r11 = donor.selectCommand(selqry);

                if (r11.next()) {

                    while (r1.next()) {
                        i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=r1.getString("user_name")%></td>
                <td><%=r1.getString("donor_gender")%></td>

                <td><%=r1.getString("donor_age")%></td>

                <td><%=r1.getString("blood_type")%></td>
                <td><%=r1.getString("donor_registrationdate")%></td>
                <td> <a href="../Assets/Files/Hospital/<%=r1.getString("report")%>" class="buttondemo" download>Download</a></td>
                <td><a href="UserVerification.jsp?accept=<%=r1.getString("donor_id")%>">Accept</a>  ||
                    <a href="UserVerification.jsp?Reject=<%=r1.getString("donor_id")%>">Reject</a> </td>     

            </tr>
            <%
                    }
                }
                else
                {
                    %>
                    <tr>
                        <td colspan="8" align="center">No Data Found</td>
                    </tr>
                    <%
                }
            %>
        </table>
    </body>
</html>
<%@include file="Foot.jsp" %>
