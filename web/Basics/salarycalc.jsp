<%-- 
    Document   : salarycalc
    Created on : 23 Dec, 2023, 2:10:33 PM
    Author     : DOYAL ELDHO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String fname="";
            String lname="";
            String name="";
            String gender="";
            String martial="";
            String department="";
            double Deduction=0;
            double netAmount=0;
            int bsalary=0,TA=0,DA=0,HRA=0,LIC=0,PF=0;
            if(request.getParameter("txt_submit")!=null){
               
                  fname=request.getParameter("txt_fname");
                  lname=request.getParameter("txt_lname");
                  name=fname+" "+lname; 
                   gender=request.getParameter("txt_gender");
                    martial=request.getParameter("txt_martial");
                    department=request.getParameter("department");
                    if(gender.equals("Female") && martial.equals("single")){
                        
                        name="Ms. "+name;
                    }
                    else if(gender.equals("Female") && martial.equals("married")){
                         name="Mrs. " +name;
                         
            }
                    else{
                        name="Mr."+name;
                    }
                    
                   bsalary=Integer.parseInt(request.getParameter("txt_bsalary"));
                   if(bsalary>=10000){
                       TA=(40*bsalary)/100;
                       DA=(35*bsalary)/100;
                       HRA=(30*bsalary)/100;
                       LIC=(25*bsalary)/100;
                       PF=(20*bsalary)/100;
                      Deduction=LIC+PF;
                       netAmount=bsalary+TA+DA+HRA-(LIC+PF);
                   }
                   else if(bsalary>=5000 && bsalary <10000){
                         TA=(35*bsalary)/100;
                       DA=(30*bsalary)/100;
                       HRA=(25*bsalary)/100;
                       LIC=(20*bsalary)/100;
                       PF=(15*bsalary)/100;
                      Deduction=LIC+PF;
                       netAmount=bsalary+TA+DA+HRA-(LIC+PF);
                   }
                   else{
                       TA=(30*bsalary)/100;
                       DA=(25*bsalary)/100;
                       HRA=(20*bsalary)/100;
                       LIC=(15*bsalary)/100;
                       PF=(10*bsalary)/100; 
                     Deduction=LIC+PF;
                       netAmount=bsalary+TA+DA+HRA-(LIC+PF);
                   }
                     
            }
            %>
        <form method="POST">
            <table border="2">
                <tr>
                    <td>First Name</td>
                    <td>
                        <input type="text" name="txt_fname">
                    </td>
                </tr>
                  <tr>
                    <td>Last name</td>
                      <td>
                        <input type="text" name="txt_lname">
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="txt_gender" value="Male">Male
                    <input type="radio" name="txt_gender" value="Female">Female</td>
                </tr
                <tr>
                    <td>Martial</td>
                
                    <td><input type="radio" name="txt_martial" value="single">Single
                    <input type="radio" name="txt_martial" value="married">Married</td>
                </tr>
                <tr>
                    <td>Department</td>
                      <td>
                          <select name="department" id="department">
                                 <option value="Select">Select</option>
                              <option value="BCA">BCA</option>
                              <option value="BBA">BCA</option>
                              <option value="BCOM">BCA</option>
                              <option value="BCA">BA</option>
                          </select>     
                    </td>
                </tr>
              
                 <tr>
                    <td>Basic salary</td>
                      <td>
                        <input type="text" name="txt_bsalary">
                    </td>
                </tr>
               
                    <td colspan="2" align="center">
                        <input type="submit" name="txt_submit" value="submit">
                        <input type="submit" name="txt_cancel" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
      <table border="2">
          <tr>
              <td>Name</td>
              <td><%=name%></td>
          </tr>
            <tr>
              <td>Gender</td>
              <td><%=gender %></td>
          </tr>
            <tr>
              <td>martial</td>
              <td><%=martial %></td>
          </tr>
            <tr>
              <td>Department</td>
              <td><%=department %></td>
          </tr>
            <tr>
              <td>Basic salary</td>
              <td><%=bsalary %></td>
          </tr>
            <tr>
              <td>TA</td>
              <td><%=TA %></td>
          </tr>
          <tr>
              <td>DA</td>
              <td><%=DA %></td>
              +6
          </tr>
          <tr>
              <td>HRA</td>
              <td><%=HRA %></td>
          </tr>
          <tr>
              <td>LIC</td>
              <td><%=LIC %></td>
          </tr>
          <tr>
              <td>PF</td>
              <td><%=PF %></td>
          </tr>
          <tr>
              <td>Deduction</td>
              <td><%=Deduction %></td>
          </tr>
          <tr>
              <td>NET</td>
              <td><%=netAmount %></td>
          </tr>
      </table>
    </body>
</html>
