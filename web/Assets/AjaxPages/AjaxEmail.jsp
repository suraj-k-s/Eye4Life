<jsp:useBean class="DB.ConnectionClass" id="check"></jsp:useBean>
<%@page import ="java.sql.ResultSet"  %>
<%
        String sela="select * from tbl_admin where admin_email='"+request.getParameter("email")+"' ";
		ResultSet s1=check.selectCommand(sela);
		String selh="select * from tbl_hospital where hosp_email='"+request.getParameter("email")+"'";
		ResultSet sh=check.selectCommand(selh);
		String selu="select * from tbl_user where user_email='"+request.getParameter("email")+"'";
			ResultSet su=check.selectCommand(selu);
        if(s1.next())
        {
            %>
            <p style="color:red">Already Existing Email</p>
            <%
        }
        else if(sh.next())
        {
            %>
            <p style="color:red">Already Existing Email</p>
            <%
        }
        else if(su.next())
        {
           %>
            <p style="color:red">Already Existing Email</p>
            <%
        }
        else
        {
            %>
            <p style="color:green"></p>
            <%
        }
%>