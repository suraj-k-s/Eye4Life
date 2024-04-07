<%-- 
    Document   : MyProfile
    Created on : 12 Jan, 2024, 2:28:21 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="mp"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
    </head>
    <body>
        <%
            String selqry="select * from tbl_hospital where hosp_id='"+session.getAttribute("hid")+"' ";
            ResultSet s1=mp.selectCommand(selqry);
            s1.next();
        
            
            %>
            <table border="2" align="center">
                <tr>
   
                 <td colspan="2" align="center"><img src="../Assets/Files/Hospital/<%=s1.getString("hosp_logo")%>" width="150" height="150"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=s1.getString("hosp_name") %></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=s1.getString("hosp_address")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                     <td><%=s1.getString("hosp_contact")%></td>
                </tr>
                 <tr>
                     <td>Email</td>
                     <td><%=s1.getString("hosp_email")%></td>
                     
                </tr>
                <tr>
                    <td colspan="2" align="center"><a href="EditProfile.jsp" value="">Edit Profile</a></td>
                </tr>
            </table>
                
    </body>
</html>
    <%@include file="Foot.jsp" %>