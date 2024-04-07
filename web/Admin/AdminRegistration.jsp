<%-- 
    Document   : AdminRegistration
    Created on : 28 Dec, 2023, 12:43:10 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="adm"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminRegistration</title>
    </head>
    <body>
        <%
            String insqry="insert into tbl_admin(admin_name,admin_email,admin_password) values('"+request.getParameter("txt_name")+"','"+request.getParameter("txt_email")+"' '"+request.getParameter("txt_password")+"' )";
         if(adm.executeCommand(insqry)){
             %>
             <script>
                 alert("Inserted successfully");
                 window.location="AdminRegistration.jsp";
             </script>
                 
             <%
         }
            
        %>
        <form method="post" action="">
            <table border="2">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txt_email"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txt_password"></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txt_save" value="Save">
                         <input type="submit" name="txt_cancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
        <br><table border="2">
            <tr>
                <td>Si NO</td>
                <td>Name</td>
                <td>Action</td>
                <td>Update</td>
            </tr>
            <tr>
                <%
         int i=0;
                String selqry="select *from tbl_admin";
             ResultSet a1= adm.selectCommand(selqry);
             while(a1.next()){
              i++;
              %>
         
              <%
             }
                %>
            </tr>
        </table>
    </body>
</html>
