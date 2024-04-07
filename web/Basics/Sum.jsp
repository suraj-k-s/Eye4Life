<%-- 
    Document   : Sum
    Created on : 23 Dec, 2023, 11:33:15 AM
    Author     : DOYAL ELDHO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int sum=0;
        if(request.getParameter("Btn")!=null)
        {
            int Num1=Integer.parseInt(request.getParameter("txtnum"));
             int Num2=Integer.parseInt(request.getParameter("txtnum1"));
            sum=Num1+Num2;
        }
        
        %>
        <form method="post">
            <table border="1">
                <tr>
                    <td>Number1</td>
                    <td><input type="text" name="txtnum"></td>
                </tr>
                 <tr>
                    <td>Number2</td>
                    <td><input type="text" name="txtnum1"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="Btn" value="Sum"></td>
                </tr>
            </table>
            Sum=<%=sum%>
        </form>
    </body>
</html>
