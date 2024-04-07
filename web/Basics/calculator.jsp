<%-- 
    Document   : calculator
    Created on : 23 Dec, 2023, 11:54:11 AM
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
             int result=0;
             int num1=0,num2=0;
             //add
             if(request.getParameter("txt_add")!=null){
                  num1=Integer.parseInt(request.getParameter("txt_num1"));
                 num2=Integer.parseInt(request.getParameter("txt_num2"));
                  result=num1+num2;}
                  //sub
                  if(request.getParameter("txt_sub")!=null){
                  num1=Integer.parseInt(request.getParameter("txt_num1"));
                  num2=Integer.parseInt(request.getParameter("txt_num2"));
                  result=num1-num2;
                  }
                  //mul
                    if(request.getParameter("txt_mul")!=null){
                  num1=Integer.parseInt(request.getParameter("txt_num1"));
                  num2=Integer.parseInt(request.getParameter("txt_num2"));
                  result=num1*num2;
                    }
                  //div
                    if(request.getParameter("txt_div")!=null){
                  num1=Integer.parseInt(request.getParameter("txt_num1"));
                  num2=Integer.parseInt(request.getParameter("txt_num2"));
                  result=num1/num2;
                    }
           
            %>
        <form method="post">
            <table border="2">
                <tr>
                    <td>Num1</td>
                    <td><input type="text" name="txt_num1" ></td>
                </tr>
                  <tr>
                    <td>Num2</td>
                    <td><input type="text" name="txt_num2" ></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="txt_add" value="+">
                   <input type="submit" name="txt_sub" value="-">
                      <input type="submit" name="txt_mul" value="*">
                      <input type="submit" name="txt_div" value="/"></td>
                </tr>
                <tr>
                    <td>
                        result=<%=result%>
                    </td>
                </tr>
                
            </table>
        </form>
    </body>
</html>
