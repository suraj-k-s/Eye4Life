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
    <%@include file="Head.jsp" %>
    <body>
        <%
            String selqry="select * from tbl_user where user_id='"+session.getAttribute("uid")+"' ";
            ResultSet s1=mp.selectCommand(selqry);
            s1.next();
          
            
            %>
            <table >
                <tr>
   
                 <td colspan="2" align="center"><img src="../Assets/Files/Hospital/<%=s1.getString("user_photo")%>" width="150" height="150"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=s1.getString("user_name") %></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=s1.getString("user_address")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                     <td><%=s1.getString("user_contact")%></td>
                </tr>
                 <tr>
                     <td>Email</td>
                     <td><%=s1.getString("user_email")%></td>
                     
                </tr>
                <tr>
                    <td colspan="2" align="center"><a href="EditProfile.jsp" value="">Edit Profile</a></td>
                </tr>
            </table>
                
    </body>
    <%@include file="Foot.jsp" %>

</html>
      