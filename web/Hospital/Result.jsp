<%-- 
    Document   : Result
    Created on : 16 Feb, 2024, 3:55:00 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="result"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
        <%
//          
            if(request.getParameter("txt_send")!=null){
                String insqry="insert into tbl_result(report,docter_name,donor_id)values('"+request.getParameter("txt_report")+"','"+request.getParameter("txt_docter")+"','"+request.getParameter("txt_hiddenid")+"')";
                if(result.executeCommand(insqry)){
                    %>
                    <script>
                        alert("Report Sended");
                        
                    </script>
                    <%
                }
            }
           
            %>
           <form method="POST" action="../Assets/Fileupload/ResultUpload.jsp"  enctype="multipart/form-data">
               <table border="2">
           
               <tr>
                   <td>Report</td>
                   <td><input type="file" name="txt_report"></td>
                   
                </tr>
               <tr>
                   <td>Consult Docter</td>
                       <td><input type="text" name="txt_docter">
                           <input type="hidden" name="txt_hiddenid" value="<%=request.getParameter("don_id")%>"></td>
               </tr>
               <tr>
                   <td colspan="2" align="center"><input type="submit" name="txt_send" value="send">
                  <input type="submit" name="txt_cancel" value="Cancel"></td>
               </tr>
                   </table>
           </form>
    </body>
</html>
    <%@include file="Foot.jsp" %>