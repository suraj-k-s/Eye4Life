<%-- 
    Document   : ViewComplaint
    Created on : 13 Jan, 2024, 2:04:40 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="vcomp"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Complaint</title>
        <%
        
        String update = "update tbl_complaint set notification_status=1";
        vcomp.executeCommand(update);
        
        %>
    </head>
    <body>
        <h1 align="center">Complaint Hospital </h1>
        <form method="post" action="">
            <table border="2" align="center">
                <tr>
                    <td>si.no</td>
                    <td>Hospital</td>
                    <td>Subject</td>
                    <td>Complaint</td>
                    <td>reply</td>
                </tr>
                <tr>
                    
                    <%
                        int i=0;
                        String selqry="select *from tbl_complaint c inner join tbl_hospital h on c.hosp_id=h.hosp_id  ";
                        ResultSet v1=vcomp.selectCommand(selqry);
                        while(v1.next()){
                            i++;
                         %>
                         
                <tr>    
                    <td><%=i%></td>
                    <td><%=v1.getString("hosp_name")%></td>
    
                          <td><%=v1.getString("complaint_subject")%></td>
                          <td><%=v1.getString("complaint_content")%></td>
                          <td><a href="Reply.jsp?Hrid=<%=v1.getString("complaint_id")%>">Reply</a></td>
                </tr>
                <%
                        }
                        %>
                </tr>
            </table>
        </form><br><br><br>
        
             <h1 align="center">Complaint User </h1>
        <form method="post" action="">
            <table border="2" align="center">
                <tr>
                    <td>si.no</td>
                    <td>User Name</td>
                    <td>Subject</td>
                    <td>Complaint</td>
                    <td>reply</td>
                </tr>
                <tr>
                    
                    <%
                        int j=0;
                        String selQry="select *from tbl_complaint c inner join tbl_user u on c.user_id=u.user_id  ";
                        ResultSet u1=vcomp.selectCommand(selQry);
                        while(u1.next()){
                            j++;
                         %>
                         
                <tr>    
                    <td><%=j%></td>
                    <td><%=u1.getString("user_name")%></td>
    
                          <td><%=u1.getString("complaint_subject")%></td>
                          <td><%=u1.getString("complaint_content")%></td>
                          <td><a href="Reply.jsp?Urid=<%=u1.getString("complaint_id")%>">Reply</a></td>
                </tr>
                <%
                        }
                        %>
                </tr>
            </table>
        </form>
    </body>
</html>
 <%@include file="Foot.jsp" %>