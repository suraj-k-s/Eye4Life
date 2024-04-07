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
                String ap="Update tbl_donor set donor_status=2 where donor_id='"+request.getParameter("reject")+"' ";
                if(acp.executeCommand(ap)){
                    %>
                    <script>
                        alert("Rejected");
                       
                        </script>
                    <%
                }
                  response.sendRedirect("UserVerification.jsp");
            }
          
            %>
             <form method="post" action="">
                              <table border="2">
            <tr>
                <td>Si.No</td>
                <td>User Name</td>
                <td>Gender</td>
                <td>Age</td>
                <td>Blood Type</td>
                <td>Registration Date</td>
                <td>Report</td>
                <td>Action</td>
               
            </tr>
            <%
                int j = 0;
                String selqry1 = "select* from tbl_donor r inner join tbl_bloodtype b on r.bloodtype_id =b.bloodtype_id inner join tbl_user u on r.user_id =u.user_id inner join tbl_result r1 on r1.donor_id=r.donor_id where donor_status=1";
                ResultSet r1 = acp.selectCommand(selqry1);
                while (r1.next()) {
                    j++;
            %>
            <tr>
                <td><%=j%></td>
                      <td><%=r1.getString("user_name")%></td>
                <td><%=r1.getString("donor_gender")%></td>
          
                <td><%=r1.getString("donor_age")%></td>

                <td><%=r1.getString("blood_type")%></td>
                <td><%=r1.getString("donor_registrationdate")%></td>
                <td> <a href="../Assets/Files/Hospital/<%=r1.getString("report") %>" class="buttondemo" download>Download</a></td>
  
                <td><a href="AcceptUser.jsp?reject=<%=r1.getString("donor_id")%>">Reject</a> </td>     
           
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
 <%@include file="Foot.jsp" %>