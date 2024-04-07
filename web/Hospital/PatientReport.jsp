<%-- 
    Document   : PatientReport
    Created on : 17 Feb, 2024, 11:52:23 AM
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
        <title>Patient Report</title>
    </head>
    <body>

        <h1 align="center">Result</h1>
        </form>
        <table border="2" align="center">

            <%
                int i = 0;
                String selqry = "select* from tbl_result r inner join tbl_donor d on d.donor_id=r.donor_id inner join tbl_user u on d.user_id=u.user_id where d.donor_id='" + request.getParameter("don_id") + "' ";
                ResultSet s1 = result.selectCommand(selqry);
                while (s1.next()) {

                    i++;
            %>
            <tr>
             

                <td> <img src="../Assets/Files/Hospital/<%=s1.getString("report")%>" width="400" height="400"></td>
            </tr>
            <%
                }
            %>
            <table>
                </body>
                </html>
                
    <%@include file="Foot.jsp" %>