<%-- 
    Document   : CheckupAppointment
    Created on : 3 Feb, 2024, 11:12:37 AM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="appoint"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Head.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Appointment</title>
</head>
<style>
.result-box {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
    background-color: #f9f9f9;
    padding: 20px;
    margin-top: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.hospital-entry {
    width: calc(25% - 20px);
    margin-bottom: 20px;
    box-sizing: border-box;
    border: 2px solid #4682B4; /* Border color */
    border-radius: 10px;
    padding: 20px;
}

.hospital-details {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.hospital-logo img {
    width: 150px;
    height: 150px;
    border-radius: 5px;
    margin-bottom: 10px;
}

.details {
    text-align: center;
}

.detail {
    margin-bottom: 10px;
}

.highlight {
    color: #4682B4;
    font-weight: bold;
}

.booking-line {
    width: 100%;
    margin-top: 20px;
    border: none;
    border-top: 1px solid #4682B4; /* Line color */
}

.book-appointment-btn {
    margin-top: 10px;
    background-color: #4682B4;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.book-appointment-btn:hover {
    background-color: #3578a8; /* Darker shade for hover */
}
.book-appointment-btn:hover {
    background-color: green;
    select {
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 10px;
    width: 200px; /* Adjust the width as needed */
}

}

</style>
<body>
    <%
    
    session.setAttribute("donorid",request.getParameter("did"));
        
    %>
    <div class="form-box">
 <form method="post" action="" align="center">
    <label for="txt_district">District</label>
    <select name="txt_district" id="txt_district" onchange="getPlace(this.value)">
        <option value="">..select..</option>
        <% 
            String selqry = "select * from tbl_district";
            ResultSet s1 = appoint.selectCommand(selqry);
            while (s1.next()) { 
        %>
        <option value="<%=s1.getString("district_id")%>"><%=s1.getString("district_name")%></option>
        <% } %>
    </select>

    <label for="txt_place">Place</label>
    <select name="place" id="place" onchange="getHosp()">
        <option value="">..select..</option>
    </select>
</form>

        <br><br>
        <div class="result-box" id="result">
    <% int i = 0;
       String selhosp = "select * from tbl_hospital n inner join tbl_place p on p.place_id=n.place_id inner join tbl_district d on d.district_id=p.district_id where hosp_status=0";
       ResultSet h1 = appoint.selectCommand(selhosp);
       while (h1.next()) {
           i++; %>
    <div class="hospital-entry">
        <div class="hospital-details">
            <div class="hospital-logo">
                <img src="../Assets/Files/Hospital/<%=h1.getString("hosp_logo")%>" width="150" height="150">
            </div>
            <div class="details">
                <div class="detail"><span class="highlight">Hospital Name:</span> <%=h1.getString("hosp_name")%></div>
                <div class="detail"><span class="highlight">Hospital Email:</span> <%=h1.getString("hosp_email")%></div>
                <div class="detail"><span class="highlight">Hospital Address:</span> <%=h1.getString("hosp_address")%></div>
                <div class="detail"><span class="highlight">Place Name:</span> <%=h1.getString("place_name")%></div>
            </div>
          <hr class="booking-line">
            <!-- Button with link to another page -->
            <a href="BookAppointment.jsp?hid=<%=h1.getString("hosp_id")%>" class="book-appointment-btn">Book Appointment</a>
      <a href="BookAppointment.jsp?hid=<%=h1.getString("hosp_id")%>&donorid=<%=request.getParameter("did")%>" class="book-appointment-btn">Book Appointment</a>




        </div>
    </div>
    <% } %>
</div>



    </div>  
</body>
</html>


<script src="../Assets/JQuery/jQuery.js"></script>
<script>
                function getPlace(did) {
                    $.ajax({
                        url: "../Assets/AjaxPages/AjaxPlace.jsp?disid=" + did,
                        success: function(html) {
                            $("#place").html(html);
                            getHosp();
                        }
                    });
                }

                function getHosp() {
                    var did = document.getElementById("txt_district").value;
                    var pid = document.getElementById("place").value;
                    $.ajax({
                        url: "../Assets/AjaxPages/AjaxHosp.jsp?did=" + did + "&pid=" + pid,
                        success: function(html) {
                            $("#result").html(html);
                        }
                    });
                }
</script>
   <%@include file="Foot.jsp" %>