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
    <body>
        <%
            if(request.getParameter("txt_save")!=null){
                String insqry="insert into tbl_donor(donor_gender,donor_dob,donor_age,donor_registrationdate,bloodtype_id,user_id)values('"+request.getParameter("txt_gender")+"','"+request.getParameter("txt_dob")+"',"
                        + "'"+request.getParameter("txt_age")+"',CurDate(),'"+request.getParameter("txt_bloodtype")+"','"+session.getAttribute("uid")+"')";
                if(donor.executeCommand(insqry)){
                    %>
                    <script>
                        alert("inserted");
                        </script>
                    <%
                }
            }
            if(request.getParameter("delete")!=null){
                String del="delete  from tbl_donor where donor_id='"+request.getParameter("delete")+"' ";
                if(donor.executeCommand(del)){
                    %>
                    <script>
                        alert("deleted");
                    </script>
                    <%
                }
            }
            %>
        <table border="2">
            <form method="post" action="">
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
                            <%
                                String selUser="select* from tbl_bloodtype";
                                ResultSet u1=donor.selectCommand(selUser);
                                while(u1.next()){
                                    %>
                                    <option value="<%=u1.getString("bloodtype_id")%>"><%=u1.getString("blood_type")%></option>
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
            </form>
        </table>
                                <table border="2">
            <tr>
                <td>Si.No</td>
                <td>User Name</td>
                <td>Gender</td>
                <td>Age</td>
                <td>Blood Type</td>
                <td>Registration Date</td>
                <td>Action</td>
                <td>Add Nominee</td>
                <td>Appointment</td>
            </tr>
            <%
                int i = 0;
                String selqry = "select* from tbl_donor r inner join tbl_bloodtype b on r.bloodtype_id =b.bloodtype_id inner join tbl_user u on r.user_id =u.user_id where u.user_id='"+session.getAttribute("uid")+"'";
                ResultSet r1 = donor.selectCommand(selqry);
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
               
                <td><a href="Donor.jsp?delete=<%=r1.getString("donor_id")%>">DELETE</a></td>     
                  
                <td><a href="Nominee.jsp?did=<%=r1.getString("donor_id")%>">Add</a></td> 
                        <td><a href="CheckupAppointment.jsp?did=<%=r1.getString("donor_id")%>">Book Appointment</a></td> 
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
    <%@include file="Foot.jsp" %>
