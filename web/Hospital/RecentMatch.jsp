<%-- 
    Document   : RecentMatch
    Created on : 8 Mar, 2024, 3:07:00 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recent Match</title>
    </head>
    <body>
        <form method="post" action="">
            <table border="2">
                
                <tr>
                    <td>Donor </td>
                    <td>Donor Photo</td>
                    <td>Recipient</td>
                    <td>Recipient Photo</td>
                    <td>Match Date</td>
                    <td>Match Time</td>
                </tr>
        <%
            int i=0;
            String selqry="select * from tbl_match m inner join tbl_donor d on m.donor_id=d.donor_id inner join tbl_user u on u.user_id=d.user_id  where hosp_id='"+session.getAttribute("hid")+"'  and donor_status='3' ";
            ResultSet s1=con.selectCommand(selqry);
            s1.next();
                
            String selQry="select *from tbl_match m1 inner join tbl_recipient r inner join  tbl_user u1 on u1.user_id=r.user_id where recipient_status='1' and hosp_id='"+session.getAttribute("hid")+"' ";
            ResultSet r1=con.selectCommand(selQry);
            r1.next();
            %>
                
    
    <tr>
               <td><%=s1.getString("user_name") %></td>
               <td><img src="../Assets/Files/Hospital/<%=s1.getString("user_photo")%>" width="150" height="150"></td>
                  <td><%=r1.getString("user_name") %></td>
                    <td><img src="../Assets/Files/Hospital/<%=r1.getString("user_photo")%>" width="150" height="150"></td>
                            <td><%=r1.getString("match_date") %></td>
                                    <td><%=r1.getString("match_time") %></td>
    </tr>
               
             </table>
        </form>
    </body>
</html>
    <%@include file="Foot.jsp" %>