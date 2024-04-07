<%-- 
    Document   : AcceptHospital
    Created on : 13 Jan, 2024, 10:23:23 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="acp"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accepted User</title>
    </head>
    <body>
        <%
             if(request.getParameter("reject")!=null){
                String ap="Update tbl_checkupappointment set appointment_status=2 where appointment_id='"+request.getParameter("reject")+"' ";
                if(acp.executeCommand(ap)){
                    %>
                    <script>
                        alert("Rejected");
                       
                        </script>
                    <%
                }
                  response.sendRedirect("Homepage.jsp");
            }
            int i=0;
            String selqry="select* from tbl_checkupappointment c inner join tbl_donor d on d.donor_id=c.donor_id inner join tbl_user u on u.user_id=d.user_id inner join tbl_bloodtype b on b.bloodtype_id=d.bloodtype_id where appointment_status=1";
            ResultSet a1=acp.selectCommand(selqry);
            while(a1.next()){
                i++;
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
                    <td>Upload</td>
                    <td>Result</td>
                </tr>
                <tr>
                    <td><%=i%></td>
                    <td><%=a1.getString("user_name")%></td>
                    <td><%=a1.getString("blood_type")%></td>
                     <td><img src="../Assets/Files/Hospital/<%=a1.getString("user_photo")%>" width="150" height="150"></td>
                      <td><%=a1.getString("user_email")%></td>
                               <td><%=a1.getString("donor_registrationdate")%></td>
             
                               <td>
                           <a href="NewAppointment.jsp?reject=<%=a1.getString("appointment_id") %>">Reject</a></td>
                               <td><a href="Result.jsp?don_id=<%=a1.getString("donor_id")%>">Upload Chart</a></td>
                               <td><a href="PatientReport.jsp?don_id=<%=a1.getString("donor_id")%>">Result</a></td>
                </tr>
            </table>
        </form>
            <%
            }
            %>
       
    </body>
</html>
    <%@include file="Foot.jsp" %>