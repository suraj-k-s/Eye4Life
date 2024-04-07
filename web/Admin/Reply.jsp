<%-- 
    Document   : Reply
    Created on : 13 Jan, 2024, 2:50:17 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="reply"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reply</title>
    </head>
    <body>
        <%
            if(request.getParameter("txt_send")!=null)
            {
                  String Hinsqry="Update tbl_complaint set complaint_reply='"+request.getParameter("txt_reply")+"' and complaint_status=1 where complaint_id='"+request.getParameter("Hrid")+"'  " ;
                  if(reply.executeCommand(Hinsqry)){
                      %>
                      <script>
                          alert("Reply Sended");
                          window.location="Reply.jsp";
                      </script>
                      <%
                  }
                   String Uinsqry="Update tbl_complaint set complaint_reply='"+request.getParameter("txt_reply")+"' and complaint_status=1 where complaint_id='"+request.getParameter("Urid")+"' " ;
                  if(reply.executeCommand(Uinsqry)){
                      %>
                      <script>
                          alert("Reply Sened");
                          window.location="Reply.jsp";
                      </script>
                      <%
                  }
                  
            }
          
            %>
        <form method="POST" action="">
        <table>
   <tr>
    <td>
        Complaint Reply
    </td>
    <td>
        <textarea name="txt_reply" required autocomplete="off"> </textarea></td>
 
</tr>
<tr>
       <td colspan="2" align="center"><input type="submit" name="txt_send" value="send"></td>
</tr>
</table>
</form> 
    </body>
</html>
 <%@include file="Foot.jsp" %>