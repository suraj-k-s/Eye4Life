<%-- 
    Document   : HospitalVerification
    Created on : 12 Jan, 2024, 11:11:53 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="hv"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital Verification</title>
    </head>
    <body>
        <%
            if(request.getParameter("accept")!=null){
                String acp="Update tbl_hospital set hosp_status=1 where hosp_id='"+request.getParameter("accept")+"' ";
                if(hv.executeCommand(acp)){
                    %>
                    <script>
                        alert("Accepted");
                     window.location="AcceptHospital.jsp";
                        </script>
                    <%
                }
                   
            }
               if(request.getParameter("reject")!=null){
                String acp="Update tbl_hospital set hosp_status=2 where hosp_id='"+request.getParameter("reject")+"' ";
                if(hv.executeCommand(acp)){
                    %>
                    <script>
                        alert("Rejected");
                       window.location="RejectHospital.jsp";
                        </script>
                    <%
                }
                  
            }
               %>
             
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
            String selqry="select *from tbl_hospital where hosp_status=0";
            ResultSet s1=hv.selectCommand(selqry);
                  ResultSet s11=hv.selectCommand(selqry);
                  if(s11.next()){
                      
                  
            while(s1.next()){
                i++;
          %>
          
            
              
                <tr>
                    <td><%=i%></td>
                    <td><%=s1.getString("hosp_name")%></td>
                    <td><%=s1.getString("hosp_email")%></td>
                     <td><img src="../Assets/Files/Hospital/<%=s1.getString("hosp_logo")%>" width="150" height="150"></td>
                      <td><%=s1.getString("hosp_contact")%></td>
                      <td><a href="HospitalVerification.jsp?accept=<%=s1.getString("hosp_id") %>">Accept</a>
                          <br><a href="HospitalVerification.jsp?reject=<%=s1.getString("hosp_id") %>">Reject</a></td>
                </tr>
     
             <%
            }
                  }
                  else{
                        %>
                    <tr>
                        <td colspan="8" align="center">No Data Found</td>
                    </tr>
                    <%
                  }
            %>
      </table>
    </body>
</html>
 <%@include file="Foot.jsp" %>