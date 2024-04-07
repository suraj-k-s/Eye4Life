<%-- 
    Document   : RejectHospital
    Created on : 13 Jan, 2024, 10:23:38 AM
    Author     : DOYAL ELDHO
--%>
<%-- 
    Document   : AcceptHospital
    Created on : 13 Jan, 2024, 10:23:23 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="rej"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reject Hospital</title>
    </head>
    <body>
        <%
                 if(request.getParameter("accept")!=null){
                String acp="Update tbl_hospital set hosp_status=1 where hosp_id='"+request.getParameter("accept")+"' ";
                if(rej.executeCommand(acp)){
                    %>
                    <script>
                        alert("Accepted");
                     
                        </script>
                    <%
                }
                    response.sendRedirect("AcceptHospital.jsp");
            }
                 %>
                   <form method="post" action="">
            <table border="2">
             <tr>
                    <td>Si NO</td>
                    <td>Hospital</td>
                    <td>Email</td>
                    <td>logo</td>
                    <td>contact</td>
                    <td>Action</td>
                </tr>
                <%
            int i=0;
            String selqry="select *from tbl_hospital where hosp_status=2 ";
            ResultSet a1=rej.selectCommand(selqry);
            while(a1.next()){
                i++;
            %>
           
                <tr>
                    <td><%=i%></td>
                    <td><%=a1.getString("hosp_name")%></td>
                    <td><%=a1.getString("hosp_email")%></td>
                     <td><img src="../Assets/Files/Hospital/<%=a1.getString("hosp_logo")%>" width="150" height="150"></td>
                      <td><%=a1.getString("hosp_contact")%></td>
                      <td>
                      <a href="HospitalVerification.jsp?accept=<%=a1.getString("hosp_id") %>">Accept</a></td>
                </tr>
            
            <%
            }
            %>
       </table>
        </form>
    </body>
</html>
 <%@include file="Foot.jsp" %>