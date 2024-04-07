<%-- 
    Document   : Category
    Created on : 28 Dec, 2023, 11:05:06 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="cat"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>
    </head>
    <body>
       <%
          String id="";
          String name="";
            if(request.getParameter("txt_save")!=null){
                if(request.getParameter("txt_hidden").equals("")){
                      String category="insert into tbl_category(category_name)values('"+request.getParameter("txt_category")+"')";
               if(cat.executeCommand(category)){
                   %>
                   <script>
                        alert("Inserted successfully");
                        window.location="Category.jsp";
                   </script>
                  <%
               } 
                }
                else{
                    String up="update tbl_category set category_name='"+request.getParameter("txt_category")+"' where category_id='"+request.getParameter("edit")+"' ";
                    if(cat.executeCommand(up)){
                         %>
        <script>
            alert("Updated successfully");
            window.location = "Category.jsp";
        </script>
        <%
                    }
                }
                
           }
                 if(request.getParameter("del")!=null){
               String delete="delete from tbl_category where category_id='"+request.getParameter("del")+"'";
               if(cat.executeCommand(delete)){
                   %>
                   <script>
                        alert("Deleted successfully");
                        window.location="Category.jsp";
                   </script>
                  <%
               }
           }        
            if(request.getParameter("edit")!=null){
                String str1="select *from tbl_category where category_id='"+request.getParameter("edit")+"' ";
                ResultSet s2=cat.selectCommand(str1);
                s2.next();
                id=s2.getString("category_id");
                name=s2.getString("category_name");
                
                
            }
        %>
        <form method="POST" action="">
            <table border="2">
                <tr>
                    <td>Category</td>
                    <td><input type="text" name="txt_category" value="<%= name%>">
                        <input type="hidden" name="txt_hidden" value="<%=id%>"
                    </td></tr>
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
                <td>Si No</td>
                <td>Name</td>
                <td>Action</td>
                <td>Update</td>
            </tr>
            <tr>
                <%
           int i=0;
           String selqry="select * from tbl_category";
           ResultSet s1=cat.selectCommand(selqry);
           while(s1.next()){
               i++;
             %>
             <td><%= i%></td>
             <td><%=s1.getString("category_name")%></td>
                <td><a href="Category.jsp?del=<%=s1.getString("category_id")%>">DELETE</a></td>
                  <td><a href="Category.jsp?edit=<%=s1.getString("category_id")%>">EDIT</a></td>
                <tr>
             <%
           }
           %>
            </tr>
        </table>
    </body>
</html>
 <%@include file="Foot.jsp" %>