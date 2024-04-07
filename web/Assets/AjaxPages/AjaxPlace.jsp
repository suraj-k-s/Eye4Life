<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>

                            <option value="">select Place</option>
                            <%
                                String placqry = "select * from tbl_place where district_id='"+request.getParameter("disid")+"'";
                                ResultSet p2 = con.selectCommand(placqry);
                                while (p2.next()) {
                            %>
                            <option value="<%=p2.getString("place_id")%>"><%=p2.getString("place_name")%></option>
                            <%
                                }
                            %>
            