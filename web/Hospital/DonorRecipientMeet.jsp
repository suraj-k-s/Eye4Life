<%-- 
    Document   : DonorRecipientMeet
    Created on : 24 Feb, 2024, 11:04:15 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="meet"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donor_Recipient_Meet</title>
        <style>
            #main {
                display: flex;
            }

            #main > div {
                margin: 40px 100px;
            }

        </style>
    </head>
    <body onload="getDonor('')">
        <form method="post" action="">
            <table border="2" colspan="2" align="center">
                <tr>
                    <td>   <select name="sel_result" id="sel_result" onchange="getDonor(this.value)">
                            <option value="">---select Group---</option>

                            <%
                                String insqry = "select * from tbl_bloodtype ";
                                ResultSet s1 = meet.selectCommand(insqry);
                                while (s1.next()) {
                            %>
                            <option value="<%=s1.getString("bloodtype_id")%>"><%=s1.getString("blood_type")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
            </table>
        </form>

        <div id="main">
            <div id="donor">
            </div>
            <div id="recipient">
            </div>
        </div>
    </body>
</html>
<script src="../Assets/JQuery/jQuery.js"></script>
<script>
                        function getDonor(did) {

                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxDonor.jsp?did=" + did,
                                success: function(html) {
                                    $("#donor").html(html);
                                }
                            });

                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxRecipient.jsp?did=" + did,
                                success: function(html) {
                                    $("#recipient").html(html);
                                }
                            });
                        }
</script>

    <%@include file="Foot.jsp" %>