<%-- 
    Document   : DonorRecipientMeet
    Created on : 24 Feb, 2024, 11:04:15 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="meet"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@include file="Head.jsp" %>


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
        <script>
            var currentIndex = 0;
            var currentIndex1 = 0;
            var donors = [];
            var recipients = [];

            function initData() {
            <%
                String donorQuery = "select * from tbl_case c inner join tbl_nominee n on c.nominee_id=n.nominee_id inner join tbl_donor d on d.donor_id=n.donor_id inner join tbl_user u on u.user_id=d.user_id inner join tbl_bloodtype b on b.bloodtype_id=d.bloodtype_id inner join tbl_result r2 on r2.donor_id=d.donor_id where c.case_status=1 and donor_status='1' ";
                String recipientQuery = "select* from tbl_recipient  r inner join tbl_bloodtype b on b.bloodtype_id=r.bloodtype_id inner join tbl_user u on u.user_id=r.user_id where recipient_status=0";
             
                if (request.getParameter("btn_submit") != null) {
                    donorQuery += " and b.bloodtype_id='" + request.getParameter("sel_result") + "'";
                    recipientQuery += " and b.bloodtype_id='" + request.getParameter("sel_result") + "'";
                }
  System.out.println(recipientQuery);
                ResultSet donorResultSet = meet.selectCommand(donorQuery);
                ResultSet recipientResultSet = meet.selectCommand(recipientQuery);

                ResultSet donorCount = meet.selectCommand(donorQuery);
                ResultSet recipientCount = meet.selectCommand(recipientQuery);

                while (donorResultSet.next()) {
            %>
                donors.push({
                    name: '<%=donorResultSet.getString("user_name")%>',
                    gender: '<%=donorResultSet.getString("donor_gender")%>',
                    bloodType: '<%=donorResultSet.getString("blood_type")%>',
                    photo: '<%=donorResultSet.getString("user_photo")%>',
                    report: '<%=donorResultSet.getString("report")%>',
                    address: '<%=donorResultSet.getString("user_address")%>',
                    id :'<%=donorResultSet.getString("donor_id")%>'
});
            <%
                }

                while (recipientResultSet.next()) {
            %>
                recipients.push({
                    name: '<%=recipientResultSet.getString("user_name")%>',
                    gender: '<%=recipientResultSet.getString("recipient_gender")%>',
                    bloodType: '<%=recipientResultSet.getString("blood_type")%>',
                    photo: '<%=recipientResultSet.getString("user_photo")%>',
                    report: '<%=recipientResultSet.getString("recipient_medicalhistory")%>',
                    address: '<%=recipientResultSet.getString("user_address")%>',
                    id :'<%=recipientResultSet.getString("recipient_id")%>'
                });
              
            <%
             
                }
               
            %>
            }

            // Function to display the current recipient
            function displayRecipient(index) {
                var recipient = recipients[index];
                document.getElementById('recipientName').innerText = recipient.name;
                document.getElementById('recipientGender').innerText = recipient.gender;
                document.getElementById('recipientBloodType').innerText = recipient.bloodType;
                document.getElementById('recipientPhoto').src = "../Assets/Files/Hospital/" + recipient.photo;
                document.getElementById('recipientReport').href = "../Assets/Files/Hospital/" + recipient.report;
                document.getElementById('recipientAddress').innerText = recipient.address;
                document.getElementById('recipientId').value = recipient.id;
            }

            // Function to display the current donor
            function displayDonor(index) {
                var donor = donors[index];
                document.getElementById('donorName').innerText = donor.name;
                document.getElementById('donorGender').innerText = donor.gender;
                document.getElementById('donorBloodType').innerText = donor.bloodType;
                document.getElementById('donorPhoto').src = "../Assets/Files/Hospital/" + donor.photo;
                document.getElementById('donorReport').href = "../Assets/Files/Hospital/" + donor.report;
                document.getElementById('donorAddress').innerText = donor.address;
                document.getElementById('donorId').value = donor.id;
            }



            // Function to handle next button click
            function next() {
                currentIndex++;
                if (currentIndex >= donors.length) {
                    currentIndex = 0;
                }
                displayDonor(currentIndex);
            }

            // Function to handle previous button click
            function previous() {
                currentIndex--;
                if (currentIndex < 0) {
                    currentIndex = donors.length - 1;
                }
                displayDonor(currentIndex);
            }

            function next1() {
                currentIndex1++;
                if (currentIndex1 >= recipients.length) {
                    currentIndex1 = 0;
                }
                displayRecipient(currentIndex1);
            }

            // Function to handle previous button click
            function previous1() {
                currentIndex1--;
                if (currentIndex1 < 0) {
                    currentIndex1 = recipients.length - 1;
                }
                displayRecipient(currentIndex1);
            }



        </script>
    </head>
    <%
                
                if(request.getParameter("btn_match")!=null){
                      DB.MailConnection m = new DB.MailConnection();
                
               
                //recipient
                String selQry="select * from tbl_recipient r inner join tbl_user u on u.user_id=r.user_id where recipient_id='"+request.getParameter("recipientId")+"'";
                 ResultSet r1=meet.selectCommand(selQry);
                r1.next();
                
                String mailid[] = {r1.getString("user_email")};
                String name = r1.getString("user_name");
                
                String subject = "Matched Donor";
                String text = "Dear " + name + ", \r\n \r\n"
                        + " This is from EyesForLife,You got a perfect Donor for your upcoming eye donation and we will contact you at the earliest "
                        
                        + "!. \r\n \r\n"
                        + " Team Eyes For Life.";
              
               boolean b = m.sendMail(mailid, subject, text);
               
                
                
               //donor
                
                String selqry="select * from tbl_donor d inner join tbl_user u on d.donor_id=u.user_id where donor_id='"+request.getParameter("donorId")+"' ; ";
                ResultSet d1=meet.selectCommand(selqry);
                d1.next();
                
                String mailid1[] = {d1.getString("user_email")};
                String name1 = d1.getString("user_name");
                
                String subject1 = "Matched Recipient";
                String text1 = "Dear " + name1 + ", \r\n \r\n"
                        + " This is from EyesForLife,You got a perfect Recipient for your upcoming eye donation and we will contact you at the earliest "
                        
                        + "!. \r\n \r\n"
                        + " Team Eyes For Life.";
              
               boolean c = m.sendMail(mailid1, subject1, text1);
               
               
                
                    String insqrydemo="insert into tbl_match(hosp_id,donor_id,recipient_id,match_date,match_time)values('"+session.getAttribute("hid")+"','"+request.getParameter("donorId")+"','"+request.getParameter("recipientId")+"',curdate(),curtime())";
                    if(meet.executeCommand(insqrydemo)){
                        %>
                        <script>
                            alert("Matched");
                            </script>
                        <%
                    }
                    String Rstatus="update tbl_recipient set recipient_status='1' where recipient_status='0' and  recipient_id='"+request.getParameter("recipientId")+"' ";
                    meet.executeCommand(Rstatus);
                  
                    String Dstatus= "update tbl_donor set donor_status='3' where donor_status='1' and donor_id='"+request.getParameter("donorId")+"' ";
                     meet.executeCommand(Dstatus);
                   
                }
                
                %>
    <body onload="initData();
            displayDonor(0);
            displayRecipient(0);">
        <form method="post" action="">
            <table border="2" colspan="2" align="center">
                <tr>
                    <td>   <select name="sel_result" id="sel_result">
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
                    <td>   
                        <input type="submit" name="btn_submit" value="Search" style="width: 100%">
                    </td>
                </tr>

            </table>
        </form>
        <form method="post"  >
            <!-- Donor -->
            <div id="main">
                <%
                    if (donorCount.next()) {
                %>
                <div id="donor">
                    <h2 align="center">Donor</h2>
                    <table border="1" width="300" style="text-align: center">
                        <tr>
                            <td colspan="2"><img id="donorPhoto" width="150" height="150" style="border-radius: 50%"></td>
                        </tr>
                        <tr>
                            <td id="donorName" colspan="2"></td>    
                        </tr>
                        <tr>
                            <td id="donorGender" colspan="2"></td>
                        </tr>
                        <tr>
                            <td id="donorBloodType" colspan="2"></td>
                        </tr>
                        <tr>
                            <td id="donorAddress" colspan="2"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><a id="donorReport" download >Download</a></td>
                        </tr>
                        <tr>
                            <td><button type="button" onclick="previous()">Previous</button></td>
                            <td><button type="button" onclick="next()">Next</button></td>
                        </tr>
                    </table>
                    <input type="hidden" id="donorId" name="donorId">
                </div>
                <%
                } else {
                %>
                <h2>No Donor found</h2>
                <%
                    }

                %>
                <div style="text-align: center;">
                    <button type="submit" name="btn_match">Match Found</button>
</div>

                <!-- Recipient -->
                <%                    if (recipientCount.next()) {
                %>
                <div id="recipient">
                    <h2 align="center">Recipient</h2>
                    <table border="1" width="300" style="text-align: center">
                        <tr>
                            <td colspan="2"><img id="recipientPhoto" width="150" height="150" style="border-radius: 50%"></td>
                        </tr>
                        <tr>
                            <td colspan="2" id="recipientName"></td> 
                        </tr>
                        <tr>
                            <td colspan="2" id="recipientGender"></td>
                        </tr>
                        <tr>
                            <td colspan="2" id="recipientBloodType"></td>
                        </tr>
                        <tr>
                            <td colspan="2" id="recipientAddress"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><a id="recipientReport" download>Download</a></td>
                        </tr>
                        <tr>
                            <td><button type="button" onclick="previous1()">Previous</button></td>
                            <td><button type="button" onclick="next1()">Next</button></td>
                        </tr>
                    </table>
                    <input type="hidden" id="recipientId" name="recipientId">
                </div>
                <%
                } else {
                %>
                <h2>No Recipient found</h2>
                <%
                    }
                
                
                
                if(request.getParameter("btn_match")!=null)
                {
                    String donorId = request.getParameter("donorId");
                    String recipientId = request.getParameter("recipientId");
                    
                   out.println(donorId+recipientId);
                }

                %>
            </div>
        </form>
    </body>
</html>
    <%@include file="Foot.jsp" %>