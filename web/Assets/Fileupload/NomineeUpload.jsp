
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
    <%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nominee Upload</title>

    </head>
    <body>

        <%

            FileItem f_item = null;
            File savedFile = null;

            String field_name = "";
            String photo = "", proof = "";
            String file_name = "";

            String field[] = new String[20];
            String value[] = new String[20];

//checking if request cotains multipart data
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);//true/false

            if (isMultipart) {

                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                //declaring a list of form fields.everything on form adding t itemlist
                List items_list = null;

                //assigning fields to list 'items_list'
                try {
                    items_list = upload.parseRequest(request);//requeat contains evrything on form this is parsed and stored to item_list
                } catch (FileUploadException ex) {
                    out.println(ex);
                }

                //declaring iterator used to iterate through all positions in item_lists
                Iterator itr = items_list.iterator();
                int k = 0;
                //iterating through the list 'items_list'
                while (itr.hasNext())//checking if there is any value in the position like rs.next()
                {

                    //typecasting next element in items_list as fileitem
                    f_item = (FileItem) itr.next();// value to which the iterator points  and is coverted to fileitem format

                    //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc) or multipath
                    if (f_item.isFormField()) {

                        //getting fieldname and value
                        field[k] = f_item.getFieldName();//field
                        value[k] = f_item.getString();//user typing value

                        k++;//
                    } else//when it is an image or multipart
                    {

                        //f_item=(FileItem)itr.next();
                        file_name = f_item.getName();
                        field_name = f_item.getFieldName();

                        if (field_name.equals("txt_photo"))//write the name of image here it is img_product
                        {
                            String ext = file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
                            //setting path to store image
                            File proj_path = new File(config.getServletContext().getRealPath("/"));
                            String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\Web\\Assets\\Files\\Hospital\\";//path for storing image
                            Random r = new Random();//to generate random number
                            int r_num = r.nextInt(1111) + 999;//values between this are generated

                            proof = "Hproof_" + r_num + ext;//generating random number for images so this name and format of imagewil be stored inside the server
                            //creating a file object
                            savedFile = new File(file_path + proof);//fn contains name of file
                            try {
                                //writing the file object
                                f_item.write(savedFile);  //writing to server means the folder             

                            } catch (Exception ex) {
                                out.println(ex);
                            }
                        }

                        //to upload proof of doctor
                    }

                }
                // if(value[7].equals(value[8]))
                // {//Strinh str1="insert into tbl_user ()";//inserting file
                String InsQry = "insert into tbl_nominee(nominee_name,nominee_contact,nominee_email,nominee_address,donor_id,nominee_photo,nominee_relationship)"
                        + "values('" + value[0] + "','" + value[2] + "','" + value[3] + "','" + value[1] + "','" + value[5] + "','" + proof + "','" + value[4] + "')";

                //System.out.println(InsQry);
                //out.println(InsQry);
                boolean status = obj.executeCommand(InsQry);

                DB.MailConnection m = new DB.MailConnection();
                String mailid[] = {value[3]};
                String name = value[0];
                   String selqry="select * from tbl_user where user_id='"+session.getAttribute("uid")+"' ";
                ResultSet r1=obj.selectCommand(selqry);
                r1.next();
                
                String subject = "Nominee Submission";
                String text = "Dear " + name + ", \r\n \r\n"
                        + " This is from EyeForLife, Thanks for registering as a nominee of"+r1.getString("user_name")+".  "+r1.getString("user_email")+"is the donar email"+" and"+r1.getString("user_password")+"is the donar password"
                        + "!. \r\n \r\n"
                        + " Team Eye For Life.";
              
              
                boolean b = m.sendMail(mailid, subject, text);

                if (status == true) {
        %> 
        <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function() {
                window.location.href = '../../User/Nominee.jsp?did=<%=value[5]%>';
            }, 40);//40millisecend it go to next page
        </script>
        <%
                }
            }
           //     else
            //   {
            //       %>
            
            
            
            
            
            
            
        <script type="text/javascript">
            // alert("Pssword Mismtch..");
            //setTimeout(function() {
            // window.location.href = '../../Guest/AgencyRegistration.jsp'
            //   }, 40);//40millisecend it go to next page
            //   </script>
            <%
                //     }
                // }

            %>


    </body>
</html>
