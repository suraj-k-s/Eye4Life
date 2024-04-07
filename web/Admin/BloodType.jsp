<%-- 
    Document   : BloodType
    Created on : 29 Dec, 2023, 10:39:50 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="blood"></jsp:useBean>
    <%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blood Type</title>
    </head>
    <body>
        <%
            String id="";
            String bname="";
            String blooddemo=request.getParameter("txt_group");
            if(request.getParameter("txt_save")!=null){
                if(request.getParameter("txt_hidden").equals("")){
                     String district="select * from tbl_bloodtype where blood_type='"+blooddemo+"' ";
                    ResultSet d1=blood.selectCommand(district);
                    if(d1.next()){
                        %>
                        <script>
                            alert("Data already exist");
                        </script>
                        <%
                    }
                    else{
                        String insqry="insert into tbl_bloodtype(blood_type)values('"+request.getParameter("txt_group")+"')";
                if(blood.executeCommand(insqry)){
                    %>
                    <script>
                        alert("Inserted successfully");
                        window.location="BloodType.jsp";
                        </script>
                    <%
                }    
                    }
                  
                }
                else{
                    String update="Update tbl_bloodtype set blood_type='"+request.getParameter("txt_group")+"' where bloodtype_id='"+request.getParameter("edit")+"' ";
                    if(blood.executeCommand(update)){
                          %>
                    <script>
                        alert("Updated successfully");
                        window.location="BloodType.jsp";
                        </script>
                    <%
                    }
                }
            }
            if(request.getParameter("del")!=null){
               String delete="delete from tbl_bloodtype where bloodtype_id='"+request.getParameter("del")+"'";
               if(blood.executeCommand(delete)){
                   %>
                   <script>
                        alert("Deleted successfully");
                        window.location="BloodType.jsp";
                   </script>
                  <%
               }
           }        
            if(request.getParameter("edit")!=null){
                String ed="select *from tbl_bloodtype where bloodtype_id='"+request.getParameter("edit")+"' ";
                ResultSet ed1=blood.selectCommand(ed);
                ed1.next();
                id=ed1.getString("bloodtype_id");
                bname=ed1.getString("blood_type");
            }
            %>
         <form method="POST" action="">
            <table border="2">
                <tr>
                    <td>Blood Group</td>
                    <td><input type="text" name="txt_group" required autocomplete="off" value="<%=bname%>">
                    <input type="hidden" name="txt_hidden" value="<%=id %>"></td>
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
                <%
            int i=0;
                String selqry="select *from tbl_bloodtype";
                ResultSet b1= blood.selectCommand(selqry);
                while(b1.next()){
                    i++;
                    %>
                    <td><%=i%></td>
                    <td><%=b1.getString("blood_type")%></td>
                    <td><a href="BloodType.jsp?del=<%=b1.getString("bloodtype_id")%>">DELETE</a></td>
                    <td><a href="BloodType.jsp?edit=<%=b1.getString("bloodtype_id")%>">EDIT</a></td><tr>
                    <%
                }
                %>
            </tr>
        </table>
    </body>
</html>
 <%@include file="Foot.jsp" %>