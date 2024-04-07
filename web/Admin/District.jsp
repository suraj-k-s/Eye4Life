<%-- 
    Document   : District
    Created on : 28 Dec, 2023, 10:55:17 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <body>
        <%
            String id="";
            String name="";
            String dis=request.getParameter("txt_district");
            if (request.getParameter("txt_save") != null) {
                if(request.getParameter("txt_hidden").equals(""))
                {
                    String district="select * from tbl_district where district_name='"+dis+"' ";
                    ResultSet d1=con.selectCommand(district);
                    if(d1.next()){
                        %>
                        <script>
                            alert("Data already exist");
                        </script>
                        <%
                    }
                    
                    else{
                          String insQry = "insert into tbl_district(district_name)values('" + request.getParameter("txt_district") + "')";
                
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Inserted successfully");
            window.location = "District.jsp";
        </script>
        <%
//                        response.sendRedirect("District.jsp");
                }    
                            }
              
                }else{
                    String up="update  tbl_district set district_name='"+request.getParameter("txt_district")+"' where district_id='"+request.getParameter("edit")+"' ";
                    if(con.executeCommand(up)){
                         %>
        <script>
            alert("Updated successfully");
            window.location = "District.jsp";
        </script>
        <%
                    }
                }

            }

            if (request.getParameter("delID") != null) {
                String delQry = "delete from tbl_district where district_id='" + request.getParameter("delID") + "'";
                if (con.executeCommand(delQry)) {
        %>
        <script>
            alert("Deleted successfully");
            window.location = "District.jsp";
        </script>
        <%
//                        response.sendRedirect("District.jsp");
                }

            }
          
            if(request.getParameter("edit")!=null){
            String ed="select * from tbl_district where district_id='"+request.getParameter("edit")+"' ";//request.getparameter used to get value from textbox
             ResultSet s2=con.selectCommand(ed);
            s2.next();
            id=s2.getString("district_id"); // current string value assign to name and id to id
            name=s2.getString("district_name");
           
            }
        %>
        <form method="POST" action="">
            <table border="2">
                <tr>
                    <td>District</td>
                    <td><input type="text" name="txt_district" required autocomplete="off" value="<%=name%>">
                    <input type="hidden" name="txt_hidden" value="<%=id%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txt_save" value="Save">
                        <input type="submit" name="txt_cancel" value="Cancel">
                    </td>
                </tr>
            </table>

        </form><br>
        <table border="2">
            <tr>
                <td>Si NO</td>
                <td>District Name</td>
                <td>Action</td>
                <td>Update</td>
            </tr>
            <tr>
                <%                        int i = 0;
                    String selqry = "select * from tbl_district";
                    ResultSet rs = con.selectCommand(selqry);//ResultSet contain all datas
                    while (rs.next()) //rs.next() to extracting single datas
                    {
                        i++;
                %>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><a href="District.jsp?delID=<%=rs.getString("district_id")%>">DELETE</a></td>
                 <td><a href="District.jsp?edit=<%=rs.getString("district_id")%>">EDIT</a></td>
            </tr>
            <%
                }

            %>

        </table>
    </body>
</html>
 <%@include file="Foot.jsp" %>