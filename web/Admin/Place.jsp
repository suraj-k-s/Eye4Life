<%-- 
    Document   : Place

    Created on : 29 Dec, 2023, 11:30:32 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="place"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%@page import ="java.sql.ResultSet"  %>
    <%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
    </head>
    <body>
        <%
            String id="";
            String pname="";
            String dis_id="";
            String placearea=request.getParameter("txt_place");
            if(request.getParameter("txt_save")!=null){
                if(request.getParameter("txt_hidden").equals(""))
                {
                     String district="select * from tbl_place where place_name='"+placearea+"' ";
                    ResultSet d1=place.selectCommand(district);
                    if(d1.next()){
                        %>
                        <script>
                            alert("Data already exist");
                        </script>
                        <%
                    }
                    else{
                              String insqry="insert into tbl_place(place_name,district_id)values('"+request.getParameter("txt_place")+"','"+request.getParameter("dis")+"')";
               
                if(place.executeCommand(insqry)){
                     %>
                    <script>
                        alert("Inserted successfully");
                        window.location="Place.jsp";
                        </script>
                    <%
                } 
                    }
               
                }
              else
                {
                    String upd="update tbl_place set place_name='"+request.getParameter("txt_place")+"' , district_id='"+request.getParameter("dis  ")+"' where place_id='"+request.getParameter("pedit")+"' ";
                   if(place.executeCommand(upd)){
                       %>
                    <script>
                        alert("Updated successfully");
                        window.location="Place.jsp";
                        </script>
                    <%   
                   }
                }
            }
              if(request.getParameter("delete")!=null){
              String delete="delete from tbl_place where place_id ='"+request.getParameter("delete")+"' ";
               if(place.executeCommand(delete)){
                   %>
                   <script>
                        alert("Deleted successfully");
                        window.location="place.jsp";
                   </script>
                  <%
               }
           }     
              if(request.getParameter("pedit")!=null){
                  String selp="select * from tbl_place where place_id='"+request.getParameter("pedit")+"' and district_id ";
                  ResultSet Rs1=place.selectCommand(selp);
                  Rs1.next();
                  id=Rs1.getString("place_id");
                  pname=Rs1.getString("place_name");
                  dis_id=Rs1.getString("district_id");
              }
            %>
        <form method="post" action="">
            <table border="2">
                <tr>
                    <td>District</td>
                    <td>
                        <select name="dis" id="">
                            <option value="select">select District</option>
                            <%
                           String selqry="select * from tbl_district";
                           ResultSet p1=place.selectCommand(selqry);
                           while(p1.next()){
                               %>
                               <option value="<%=p1.getString("district_id")%>"<% if(p1.getString("district_id").equals(dis_id))
                               {
                                   out.println("selected");
                               }%>>
                                   <%=p1.getString("district_name")%></option>
                               <%
                           }
                                %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><input type="text" name="txt_place" required autocomplete="off" value="<%=pname%>"></td>
                    <td><input type="hidden" name="txt_hidden" value="<%=id%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txt_save" value="Save">
                        <input type="submit" name="txt_cancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
        <table border="2"> 
            <tr>
                <td>si NO</td>
                <td>Place</td>
                <td>District</td>
                <td>Action</td>
                <td>Update</td>
            </tr>
            <tr>
                <%
                int i=0;
                String selplace="select * from tbl_place p inner join tbl_district d on p.district_id = d.district_id ";
                ResultSet p2=place.selectCommand(selplace);
                while(p2.next()){
                    i++;
                   %>
                   <td><%=i%></td>
                   <td><%=p2.getString("place_name")%></td>
                   <td><%=p2.getString("district_name")%></td>
                   <td><a href="Place.jsp?delete=<%=p2.getString("place_id")%>">DELETE</a></td>
                   <td><a href="Place.jsp?pedit=<%=p2.getString("place_id")%>">EDIT</a></td><tr>
                   <%
                }
                
              %>  
            </tr>
        </table>
    </body>
</html>
 <%@include file="Foot.jsp" %>