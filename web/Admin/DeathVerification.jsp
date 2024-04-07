<%-- 
    Document   : DeathVerification
    Created on : 24 Feb, 2024, 10:02:37 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="death"></jsp:useBean>
    <%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Death Verification</title>
    </head>
    <body>
        <%
            if(request.getParameter("accept")!=null){
                String acp="Update tbl_case set case_status=1 where case_id='"+request.getParameter("accept")+"' ";
                if(death.executeCommand(acp)){
                    %>
                    <script>
                        alert("Accepted");
                     window.location="AcceptDeath.jsp";
                        </script>
                    <%
                }
                   
            }
               if(request.getParameter("reject")!=null){
                String acp="Update tbl_case set case_status=2 where case_id='"+request.getParameter("reject")+"' ";
                if(death.executeCommand(acp)){
                    %>
                    <script>
                        alert("Rejected");
                       window.location="DeathVerification.jsp";
                        </script>
                    <%
                }
                  
            }
               %>
                    <form method="post" action="">
            <table border="2">
                <tr>
                    <td>si.No</td>
                    <td>Donor Name</td>
                    <td>Donor Gender</td>
                    <td>Blood Type</td>
                    <td>Photo</td>
                    <td>Nominne</td>
                    <td>Address</td>
                    <td>Action</td>
                </tr>
               <%
            int i=0;
            String selqry="select * from tbl_case c inner join tbl_nominee n on c.nominee_id=n.nominee_id inner join tbl_donor d on d.donor_id=n.donor_id inner join tbl_user u on u.user_id=d.user_id inner join tbl_bloodtype b on b.bloodtype_id=d.bloodtype_id where case_status=0";
             ResultSet d1=death.selectCommand(selqry);
                ResultSet d11=death.selectCommand(selqry);
            if(d11.next()){
                
           
                while(d1.next()){
                i++;
                %>
                 
                <tr>
                    <td><%=i%></td>
                      <td><%=d1.getString("user_name")%></td>
                        <td><%=d1.getString("donor_gender")%></td>
                          <td><%=d1.getString("blood_type")%></td>
                          <td><img src="../Assets/Files/Hospital/<%=d1.getString("user_photo")%>" width="150" height="150"></td>
                            <td><%=d1.getString("nominee_name")%></td>
                   <td><%=d1.getString("user_address")%></td>
                                  <td><a href="DeathVerification.jsp?accept=<%=d1.getString("case_id") %>">Accept</a>
                          <br><a href="DeathVerification.jsp?reject=<%=d1.getString("case_id") %>">Reject</a></td>
                </tr>
            
                <%
            }}
            else{
                  %>
                    <tr>
                        <td colspan="8" align="center">No Death cases Reported</td>
                    </tr>
                    <%
            }
            %>
      </table>
        </form>
    </body>
</html>
 <%@include file="Foot.jsp" %>