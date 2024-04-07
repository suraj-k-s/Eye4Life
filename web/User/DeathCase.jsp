<%-- 
    Document   : DeathCase
    Created on : 23 Feb, 2024, 3:22:47 PM
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
        <title>Death Case</title>
    </head>
    <body>
        <form method="post" action="../Assets/Fileupload/DeathUpload.jsp" enctype="multipart/form-data">
            <table border="2">
                <tr>
                    <td>Hospital Name</td>
                    <td><input type="text" name="txt_hosp" required autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txt_address" required autocomplete="off"></textarea></td>
                </tr>
                   <tr>
                       <td>Hospital Contact</td>
                    <td><input type="text" name="txt_number" required autocomplete="off"></td>
                </tr>
                    <tr>
                       <td>Death Certificate</td>
                    <td><input type="file" name="txt_certificate" required autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Nominee Name</td>
                    <td>
                  <select name="txt_dis">
                    <option value="">---select---</option>

                    <%
                    String selqry = "select * from tbl_nominee  n inner join tbl_donor d on d.donor_id=n.donor_id where user_id='"+session.getAttribute("uid")+"' ";
                   ResultSet s1=donor.selectCommand(selqry);
                    while(s1.next()) {
                        %>
                        <option value="<%=s1.getString("nominee_id") %>"><%=s1.getString("nominee_name")%></option>
                       <%           
                    }
                    %>
                </select>
                    </td>
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