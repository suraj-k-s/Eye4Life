<%-- 
    Document   : smallestlargest
    Created on : 23 Dec, 2023, 12:22:38 PM
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
            int largest=0,smallest=0;
            if(request.getParameter("txt_find")!=null){
                int num1=Integer.parseInt(request.getParameter("txt_num1"));
                 int num2=Integer.parseInt(request.getParameter("txt_num2"));
                 int num3=Integer.parseInt(request.getParameter("txt_num3"));
                 largest=num1;
                 smallest=num2;
                 if(num2>largest)
                 {
                     largest=num2;
                    
                 }
                  if(num3>largest){
                     largest=num3;
                 }
                 
                 if(num1<smallest){
                     smallest=num1;
                  
                 }
                    if(num3<smallest){
                     smallest=num3;
                 }
            }
            %>
        <form method="POST">
            <table border="2">
                <tr>
                    <td>Num1</td>
                    <td>
                        <input type="text" name="txt_num1">
                    </td>
                </tr>
                <tr>
                    <td>Num1</td>
                      <td>
                        <input type="text" name="txt_num2">
                    </td>
                </tr>
                <tr>
                    <td>Num1</td>
                      <td>
                        <input type="text" name="txt_num3">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txt_find" value="find">
                        <input type="submit" name="txt_cancel" value="cancel">
                    </td>
                </tr>
                <tr>
                    
                    <td>Largest=<%=largest%></td>
                    <td>Smallest=<%=smallest%></td>
                </tr>
            </table>
        </form>
    </body>
</html>
