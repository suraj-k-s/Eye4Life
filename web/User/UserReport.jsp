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
                String selqry = "select* from tbl_result r inner join tbl_donor d on d.donor_id=r.donor_id inner join tbl_user u on d.user_id=u.user_id where d.user_id='" + session.getAttribute("uid") + "' ";
//                
                
                ResultSet s1 = result.selectCommand(selqry);
                while (s1.next()) {

                    i++;
            %>
            <tr>
             

                <td> <img src="../Assets/Files/Hospital/<%=s1.getString("report")%>" width="400" height="400"></td>
                
            </tr>
            <style>
         .download-button {
    display: inline-block;
    padding: 10px 20px; /* Adjust padding as needed */
    background-color: #add8e6; /* Light blue background color */
    color: #fff; /* Text color */
    text-decoration: none;
    border: 1px solid #add8e6; /* Border color matches background color */
    border-radius: 5px; /* Rounded corners */
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s, color 0.3s, border-color 0.3s; /* Smooth transition effects */
}

.download-button:hover {
    background-color: #28a745; /* Green color on hover */
    border-color: #28a745;
}


            </style>
            <tr>
                <td colspan="2" align="center"> <a href="../Assets/Files/Hospital/<%=s1.getString("report")%>" download class="download-button" >Download</a></td>
            

            </tr>
            <%
                }
            %>
            <table>
                
                </body>
                </html>
                
   <%@include file="Foot.jsp" %>