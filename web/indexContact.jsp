<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!doctype html>
    <html lang="en">
        <head>
            <title>Contact Form 07</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

            <link rel="stylesheet" href="Assets/Template/Contact/css/style.css">

        </head>
        <style>
            //for back switch
            /* Style for the button with link appearance */
            .link-button {
                display: inline-block;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                background-color: #3498db;
                color: #fff;
                border: 1px solid #3498db;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            /* Hover effect */
            .link-button:hover {
                background-color: #2980b9;
            }
            
        </style>

        <body>
        <%
            if (request.getParameter("txt_submit") != null) {

                DB.MailConnection m = new DB.MailConnection();
                String mailid[] = {request.getParameter("email")};
                String name = request.getParameter("name");

                String subject = "Enquiry";
                String text = "Dear " + name + ", \r\n \r\n"
                        + " This is from EyeForLife, Thanks for Contacting Us ..We will make quick decision and contact you at the earliest" + ""
                        + "!. \r\n \r\n"
                        + " Team Eye For Life.";

                boolean b = m.sendMail(mailid, subject, text);
                String contact = "insert into tbl_contact(name,email,subject,message)"
                        + "values('" + request.getParameter("name") + "','" + request.getParameter("email") + "','" + request.getParameter("subject") + "','" + request.getParameter("message") + "')";
                if (con.executeCommand(contact)) {
        %>
        <script>
            alert("sended");
        </script>

        <%
                }
            }
        %>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Contact Us
                        </h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="wrapper">
                            <div class="row no-gutters">
                                <div class="col-md-6 d-flex align-items-stretch">
                                    <div class="contact-wrap w-100 p-md-5 p-4 py-5">
                                        <h3 class="mb-4">Write us</h3>
                                        <div id="form-message-warning" class="mb-4"></div> 
                                        <div id="form-message-success" class="mb-4">
                                            Your message was sent, thank you!
                                        </div>
                                        <form method="POST" >
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control"  name="name" id="name" placeholder="Name" autocomplete="off">
                                                    </div>
                                                </div>
                                                <div class="col-md-12"> 
                                                    <div class="form-group">
                                                        <input type="email" class="form-control" autocomplete="off" name="email" id="email" placeholder="Email">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" autocomplete="off" name="subject" id="subject" placeholder="Subject">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <textarea name="message" class="form-control" autocomplete="off" id="message" cols="30" rows="6" placeholder="Message"></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="submit" name="txt_submit" value="Send Message" class="btn btn-primary">
                                                        <div class="submitting"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-6 d-flex align-items-stretch">
                                    <div class="info-wrap w-100 p-md-5 p-4 py-5 img">
                                        <h3>Contact information</h3>
                                        <p class="mb-4">We're open for any suggestion or just to have a chat</p>
                                        <div class="dbox w-100 d-flex align-items-start">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa fa-map-marker"></span>
                                            </div>
                                            <div class="text pl-3">
                                                <p><span>Address:</span> Vengola P.O Perumbavoor</p>
                                            </div>
                                        </div>
                                        <div class="dbox w-100 d-flex align-items-center">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa fa-phone"></span>
                                            </div>
                                            <div class="text pl-3">
                                                <p><span>Phone:</span> <a href="tel://1234567920">9188096252</a></p>
                                            </div>
                                        </div>
                                        <div class="dbox w-100 d-flex align-items-center">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa fa-paper-plane"></span>
                                            </div>
                                            <div class="text pl-3">
                                                <p><span>Email:</span> <a href="mailto:info@yoursite.com">eyesforlife@gmail.com</a></p>
                                            </div>
                                        </div>
                                        <div class="dbox w-100 d-flex align-items-center">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa fa-globe"></span>
                                            </div>
                                            <div class="text pl-3">
                                                <p><span>Website</span> <a href="#">EyesfForLife.com</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="Assets/Template/Contact/js/jquery.min.js"></script>
        <script src="Assets/Template/Contact/js/popper.js"></script>
        <script src="Assets/Template/Contact/js/bootstrap.min.js"></script>
        <script src="Assets/Template/Contact/js/jquery.validate.min.js"></script>
        <script src="Assets/Template/Contact/js/main.js"></script>

    </body>
</html>

