<%-- 
    Document   : FeedbackUser
    Created on : 13 Jan, 2024, 1:55:36 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="fb"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>feedback</title>
    </head>
    <body>
        <%
            if(request.getParameter("txt_save")!=null){
                String insqry="insert into tbl_feedback(feedback_content,user_id)values('"+request.getParameter("txt_feedback")+"','"+session.getAttribute("uid")+"')";
            if(fb.executeCommand(insqry)){
                %>
                <script>
                    alert("feedback sended");
                    </script>
                <%
            }  
            }
          
            %>
        <form method="post" action="">
             <table border="2" colspan="2" align="center">
            
                    <td>Feedback</td>
                    <td><textarea name="txt_feedback" required autocomplete="off" placeholder="write here.."></textarea></td>
                </tr>
                  <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txt_save" value="send">
                         <input type="submit" name="txt_cancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
   <%@include file="Foot.jsp" %>