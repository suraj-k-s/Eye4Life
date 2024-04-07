<%-- 
    Document   : Marksheet
    Created on : 23 Dec, 2023, 12:44:46 PM
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
            String name="";
            String department="";
            String classname="";
            int total=0,avg=0;
            String grade="";
            if(request.getParameter("txt_save")!=null){
                name=request.getParameter("txt_name");
                department=request.getParameter("department");
                classname=request.getParameter("txt_class");
               int mark1=Integer.parseInt(request.getParameter("txt_mark1"));
                int mark2=Integer.parseInt(request.getParameter("txt_mark2"));
                 int mark3=Integer.parseInt(request.getParameter("txt_mark3"));
                  total=mark1+mark2+mark3;
                  avg=total/3;
                  if(avg>250){
                      grade="A+";
                  }
                  else if(avg>200||avg<250){
                     grade="B+";
                  }
                  else{
                     grade="B+";
                  }
            }
        %>
      <form method="POST">
            <table border="2">
                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" name="txt_name">
                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                      <td>
                          <select name="department" id="department">
                                 <option value="Select">Select</option>
                              <option value="BCA">BCA</option>
                              <option value="BBA">BCA</option>
                              <option value="BCOM">BCA</option>
                              <option value="BCA">BA</option>
                          </select>     
                    </td>
                </tr>
                <tr>
                    <td>class</td>
                      <td>
                        <input type="text" name="txt_class">
                    </td>
                </tr>
                 <tr>
                    <td>mark1</td>
                      <td>
                        <input type="text" name="txt_mark1">
                    </td>
                </tr>
                 <tr>
                    <td>mark2</td>
                      <td>
                        <input type="text" name="txt_mark2">
                    </td>
                </tr>
                 <tr>
                    <td>mark3</td>
                      <td>
                        <input type="text" name="txt_mark3">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txt_save" value="save">
                        <input type="submit" name="txt_cancel" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
      <table border="2">
          <tr>
              <td>Name</td>
              <td><%=name%></td>
          </tr>
           <tr>
              <td>Department</td>
              <td><%=department%></td>
          </tr>
           <tr>
              <td>class</td>
              <td><%=classname%></td>
          </tr>
           <tr>
              <td>Total</td>
              <td><%=total%></td>
          </tr>
           <tr>
              <td>Average</td>
              <td><%=avg%></td>
          </tr>
           <tr>
              <td>Grade</td>
              <td><%=grade%></td>
          </tr>
      </table>
    </body>
</html>
