<jsp:useBean class="DB.ConnectionClass" id="Donor"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>

<%
    int i = 0;
    String selhosp = "select* from tbl_recipient  r inner join tbl_bloodtype b on b.bloodtype_id=r.bloodtype_id inner join tbl_user u on u.user_id=r.user_id where recipient_status=0";

    if (request.getParameter("did") != "") {
        selhosp += " and b.bloodtype_id='" + request.getParameter("did") + "' ";
    }
    ResultSet h1 = Donor.selectCommand(selhosp);
    ResultSet h2 = Donor.selectCommand(selhosp);
    if (h2.next()) {
%>
<h2 align="center">Recipient</h2>
<table border="1" >

    <tr>            

        <td width="40">si.No</td>
        <td width="100">Name</td>
        <td width="40">Gender</td>
        <td width="50">Blood Group</td>
        <td width="150">Photo</td>
        <td width="150">Report</td>
        <td width="150">Address</td>

    </tr>
    <%
        while (h1.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=h1.getString("user_name")%></td>
        <td><%=h1.getString("recipient_gender")%></td>
        <td><%=h1.getString("blood_type")%></td>
        <td><img src="../Assets/Files/Hospital/<%=h1.getString("user_photo")%>" width="150" height="150" style="border-radius: 50%"></td>
        <td><a href="../Assets/Files/Hospital/<%=h1.getString("recipient_medicalhistory")%>" download>Download</a></td>

        <td><%=h1.getString("user_address")%></td>

    </tr>
    <%
        }
    %>
</table>
<%
    }
%>
