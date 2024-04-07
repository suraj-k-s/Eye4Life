<%-- 
    Document   : Recipient
    Created on : 26 Jan, 2024, 11:48:10 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="recep"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recipient</title>
    </head>
    <body>
        <%
            if (request.getParameter("delete") != null) {
                String del = "delete from tbl_recipient where recipient_id= '" + request.getParameter("delete") + "' ";
                if(recep.executeCommand(del)) {
                    
        %>
        <script>
            alert("deleted");
        </script>
        <%
                }
            }

        %>
        <table border="2">
            <form method="post" action="../Assets/Fileupload/RecipientUpload.jsp" enctype="multipart/form-data" >
                <tr>
                    <td>Gender</td>
                    <td><input type="text" name="txt_gender" required autocomplete="off"></td>

                </tr>
                <tr>
                    <td>D.O.B</td>
                    <td><input type="text" name="txt_dob" required autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Age</td>
                    <td><input type="number" name="txt_age" required autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Blood Type</td>
                    <td>
                        <select name="txt_bloodtype" id="" >
                            <option value="">..Select...</option>
                            <%                                String selUser = "select *from tbl_bloodtype";
                                ResultSet u1 = recep.selectCommand(selUser);
                                while (u1.next()) {
                            %>
                            <option value="<%=u1.getString("bloodtype_id")%>"><%=u1.getString("blood_type")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Medical History</td>
                    <td><input type="file" name="txt_file"></td>
                </tr>
                <tr>
                    <td>Treatment Hospital Name</td>
                    <td><input type="text" name="txt_hsptl" required autocomplete="off"></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txt_save" value="Save">
                        <input type="submit" name="txt_cancel" value="Cancel">
                    </td>
                </tr>
            </form>
        </table>
        <table border="2">
            <tr>
                <td>Si.No</td>
                <td>User Name</td>
                <td>Gender</td>
                <td>Age</td>
                <td>Blood Type</td>
                <td>Medical History</td>
                <td>Hospital Name</td>
                <td>Action</td>
            </tr>
            <%
                int i = 0;
                String selqry = "select* from tbl_recipient r inner join tbl_bloodtype b on r.bloodtype_id =b.bloodtype_id inner join tbl_user u on r.user_id =u.user_id";
                ResultSet r1 = recep.selectCommand(selqry);
                while (r1.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=r1.getString("recipient_gender")%></td>
                <td><%=r1.getString("user_name")%></td>
                <td><%=r1.getString("recipient_age")%></td>

                <td><%=r1.getString("blood_type")%></td>
            <td><a href="../Assets/Files/Hospital/<%=r1.getString("recipient_medicalhistory")%>" download><img src="../Assets/Files/Hospital/<%=r1.getString("recipient_medicalhistory")%>" width="150" height="150"></a></td>

                <td><%=r1.getString("recipient_treatmenthsptl")%></td>
                <td><a href="Recipient.jsp?delete=<%=r1.getString("recipient_id")%>">DELETE</a></td>     
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
   <%@include file="Foot.jsp" %>