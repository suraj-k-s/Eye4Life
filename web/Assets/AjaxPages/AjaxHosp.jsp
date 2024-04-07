<%-- 
    Document   : AjaxHosp
    Created on : 3 Feb, 2024, 2:44:02 PM
    Author     : DOYAL ELDHO
--%>
<jsp:useBean class="DB.ConnectionClass" id="hosp"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>

<%
    int i = 0;
    String selhosp = "select * from tbl_hospital n inner join tbl_place p on  p.place_id=n.place_id inner join tbl_district d on d.district_id=p.district_id where true";
    if (request.getParameter("pid") != "") {
        selhosp += " and n.place_id='" + request.getParameter("pid") + "' ";
    }
    if (request.getParameter("did") != "") {
        selhosp += " and p.district_id='" + request.getParameter("did") + "' ";
    }
       ResultSet h1 = hosp.selectCommand(selhosp);
       while (h1.next()) {
           i++; 
%>

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
            <a href="your_page_link.jsp" class="book-appointment-btn">Book Appointment</a>
        </div>
    </div>
    <% } %>