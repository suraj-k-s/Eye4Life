<%-- 
    Document   : BookAppointment
    Created on : 28 Feb, 2024, 8:02:05 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="book"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Appointment</title>
    </head>
    <body>
        <%
            if(request.getParameter("txt_save")!=null){
                   
               String insqry="insert into tbl_checkupappointment(donor_id,appointment_todate,appointment_bookeddate,hospital_id,appointment_status)values('"+request.getParameter("donorid")+"',curdate(),'"+request.getParameter("txt_date")+"','"+request.getParameter("hid")+"',0)";
           if(book.executeCommand(insqry)){
                %>
                <script>
                    alert("Appointment Booked");
                    </script>
                <%
            }
            }
            %>
            
         
            <form method="POST" action="">
                <table border="2">
                    <tr>
                        <td>Date</td>
                        <td><Input type="date" name="txt_date"></td>
                    </tr>
                       <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txt_save" value="Save">
                        <input type="submit" name="txt_cancel" value="Cancel">
                    </td>
                </tr>
                </table>
            </form>
    </body>
</html>
   <%@include file="Foot.jsp" %>