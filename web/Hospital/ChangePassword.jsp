<%-- 
    Document   : ChangePassword
    Created on : 12 Jan, 2024, 7:59:56 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="cp"></jsp:useBean>
<%@page import ="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        <%
            if(request.getParameter("txt_update")!=null){
              String pass=request.getParameter("txt_password");
              String Npass=request.getParameter("txt_newpassword");
              String Cpass=request.getParameter("txt_confirmpassword");
              String selUser="select * from tbl_hospital where hosp_password='"+pass+"' and hosp_id='"+session.getAttribute("uid")+"' ";
              ResultSet u1=cp.selectCommand(selUser);
              if(u1.next()){
                  if(Cpass.equals(Npass)){
                      String upd="Update tbl_hospital set hosp_password='"+Cpass+"' where hosp_id='"+session.getAttribute("uid")+"' ";
                  if(cp.executeCommand(upd)){
                              %>
                       <script>
                          alert("Password Updated");
                          window.location="ChangePassword.jsp";
                          </script>
                      <%
                  }
                 
              }
                   else{
                      %>
                      <script>
                          alert(" Password doesnt match");
                          window.location="ChangePassword.jsp";
                          </script>
                      <%
                  }
              }
              else{
                  %>
                   <script>
                          alert("Invalid User Password");
                          window.location="ChangePassword.jsp";
                          </script>
                                  <%
              }
            }
            %>
        <form method="post" action="">
            <table border="2">
                <tr>
                    <td>Current Password</td>
                    <td><input type="password" name="txt_password"></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="password" name="txt_newpassword"></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="txt_confirmpassword"></td>
                </tr>
                  <tr>
                    <td colspan="2" align="center"><input type="submit" name="txt_update" value="Update"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
