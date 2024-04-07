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
        <title>Accept Hospital</title>
    </head>
    <body>
        <%
             if(request.getParameter("reject")!=null){
                String ap="Update tbl_case set case_status=2 where case_id='"+request.getParameter("reject")+"' ";
                if(acp.executeCommand(ap)){
                    %>
                    <script>
                        alert("Rejected");
                       
                        </script>
                    <%
                }
                  response.sendRedirect("DeathVerification.jsp");
            }
          
                    int i=0;
            String selqry="select * from tbl_case c inner join tbl_nominee n on c.nominee_id=n.nominee_id inner join tbl_donor d on d.donor_id=n.donor_id inner join tbl_user u on u.user_id=d.user_id inner join tbl_bloodtype b on b.bloodtype_id=d.bloodtype_id where case_status=1 and donor_status='1' ";
             ResultSet d1=acp.selectCommand(selqry);
            while(d1.next()){
                i++;
                %>
                      <form method="post" action="">
            <table border="2">
                <tr>
                    <td>si.No</td>
                    <td>Donor Name</td>
                    <td>Donor Gender</td>
                    <td>Blood Type</td>
                    <td>Photo</td>
                    <td>Nominee</td>
                    <td>Address</td>
                    <td>Action</td>
                </tr>
                <tr>
                    <td><%=i%></td>
                      <td><%=d1.getString("user_name")%></td>
                        <td><%=d1.getString("donor_gender")%></td>
                          <td><%=d1.getString("blood_type")%></td>
                          <td><img src="../Assets/Files/Hospital/<%=d1.getString("user_photo")%>" width="150" height="150"></td>
                            <td><%=d1.getString("nominee_name")%></td>
                   <td><%=d1.getString("user_address")%></td>
                                  <td>
                          <br><a href="DeathVerification.jsp?reject=<%=d1.getString("case_id") %>">Reject</a></td>
                </tr>
                </table>
        </form>
                <%
            }
            %>
  
        </table>
    </body>
</html>
 <%@include file="Foot.jsp" %>