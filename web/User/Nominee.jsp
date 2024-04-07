<%-- 
    Document   : Nominee
    Created on : 2 Feb, 2024, 3:14:17 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="nominee"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nominee</title>
    </head>
    <body>+
        <%
            if(request.getParameter("delete")!=null){
             String del="delete from tbl_nominee where nominee_id='"+request.getParameter("delete")+"' ";
             if(nominee.executeCommand(del)){
                %>
             <script>
                 alert("Deleted successfully");
                 </script>
             <%
        }   
             }
           
           
            %>
        <form method="POST" action="../Assets/Fileupload/NomineeUpload.jsp" enctype="multipart/form-data">
            <table border="2">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" required autocomplete="off">
                        

                    </td></tr>
                <tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txt_address" required autocomplete="off" placeholder="Enter Address here..."></textarea>

                    </td></tr>
                <tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txt_contact" required autocomplete="off" >

                    </td></tr>
                <tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txt_email" required autocomplete="off">

                    </td></tr>

                <tr>
                    <td>Photo</td>
                    <td>
                        <input type=file name="txt_photo" required autocomplete="off">
                    </td>

                </tr>
                <tr>
                    <td>Nominee Relationship</td>
                    <td><input type="text" name="txt_relation" required autocomplete="off">
                        <input type="hidden" name="txt_id" value="<%=request.getParameter("did")%>" autocomplete="off">
                        
                    </td></tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txt_save" value="Save">
                        <input type="submit" name="txt_cancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
 <table border="2">
            <tr>
                <td>Si.No</td>
                <td>User Name</td>
                <td>Address</td>
                <td>Contact</td>
              <td>Relation</td>
                <td>Photo</td>
                <td>Donor Name</td>
                    
                <td>Action</td>
            </tr>
            <%
           
                int i = 0;
                String selqry = "select* from tbl_nominee n inner join tbl_donor d on d.donor_id =n.donor_id inner join tbl_user u on u.user_id=d.user_id where u.user_id='"+session.getAttribute("uid")+"' ";
                ResultSet r1 = nominee.selectCommand(selqry);
                while (r1.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=r1.getString("nominee_name")%></td>
                <td><%=r1.getString("nominee_address")%></td>
                <td><%=r1.getString("nominee_contact")%></td>

                <td><%=r1.getString("nominee_relationship")%></td>
                <td><img src="../Assets/Files/Hospital/<%=r1.getString("nominee_photo")%>" width="150" height="150"></td>
                <td><%=r1.getString("user_name")%></td>
                <td><a href="Nominee.jsp?delete=<%=r1.getString("nominee_id")%>&did=<%=request.getParameter("did")%>">DELETE</a></td>     
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
   <%@include file="Foot.jsp" %>