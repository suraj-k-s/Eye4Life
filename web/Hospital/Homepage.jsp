<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Livedoc | Landing, Responsive &amp; Business Templatee</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="../Assets/Template/User/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../Assets/Template/User/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../Assets/Template/User/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="../Assets/Template/User/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="../Assets/Template/User/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="../Assets/Template/User/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="../Assets/Template/User/assets/css/theme.css" rel="stylesheet" />
   <link href="../Assets/Template/form.css" rel="stylesheet" />
  </head>


  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block" data-navbar-on-scroll="data-navbar-on-scroll" style="background-color: #00e7fffc">
        <div class="container"><a class="navbar-brand" href="index.html"><img src="../Assets/Template/User/assets/img/gallery/logo.png" width="118" alt="logo" /></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"> </span></button>
          <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
             <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base">
                  <li class="nav-item px-2"><a class="nav-link" aria-current="page" href="Homepage.jsp">Home</a></li>
                <li class="nav-item px-2"><a class="nav-link" aria-current="page" href="MyProfile.jsp">Profile</a></li>
              
               <li class="nav-item px-2"><a class="nav-link" href="NewAppointment.jsp">Appointment</a></li>
                      <li class="nav-item px-2"><a class="nav-link" href="AcceptedUser.jsp">Users</a></li>
               <li class="nav-item px-2"><a class="nav-link" href="FindMatch.jsp">Find Match</a></li>
         
          
               <li class="nav-item px-2"><a class="nav-link" href="Result.jsp">Result</a></li>
                          <li class="nav-item px-2"><a class="nav-link" href="RecentMatch.jsp">Recent Donation</a></li>
               <li class="nav-item px-2"><a class="nav-link" href="ComplaintHospital.jsp">Complaint</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <section class="py-xxl-10 pb-0" id="home">
        <div class="bg-holder bg-size" style="background-image:url(../Assets/Template/User/assets/img/gallery/hero-bg.png);background-position:top center;background-size:cover;">
        </div>
        <!--/.bg-holder-->

        <div class="container">
          <div class="row min-vh-xl-100 min-vh-xxl-25">
              <div class="col-md-5 col-xl-6 col-xxl-7 order-0 order-md-1 text-end"><img class="pt-7 pt-md-0 w-100" src="hosppic.jpg" alt="hero-header" style="border-radius: 50%"/></div>
            <div class="col-md-75 col-xl-6 col-xxl-5 text-md-start text-center py-6">
                   <h1>Welcome <%=session.getAttribute("hname")%></h1>
            
              <p class="fs-1 mb-5">Two eyes when donated can bring countless smiles  <br />to those who regaain their vision  </p>
              <!--<a class="btn btn-lg btn-primary rounded-pill" href="#!" role="button">Make an Appointment</a>-->
            </div>
          </div>
        </div>
      </section>


        <section class="py-0 bg-primary">

          <div class="container">
            <div class="row justify-content-md-between justify-content-evenly py-4">
              <div class="col-12 col-sm-8 col-md-6 col-lg-auto text-center text-md-start">
                <p class="fs--1 my-2 fw-bold text-200">Eyes For Life</p>
              </div>
              <div class="col-12 col-sm-8 col-md-6">
                <p class="fs--1 my-2 text-center text-md-end text-200"> 
                  <svg class="bi bi-suit-heart-fill" xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#F95C19" viewBox="0 0 16 16">
                    <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"></path>
                  </svg><a class="fw-bold text-info" href="https://themewagon.com/" target="_blank"> </a>
                </p>
              </div>
            </div>
          </div>
          <!-- end of .container-->

        </section>
        <!-- <section> close ============================-->
        <!-- ============================================-->


      </section>
    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->




    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="vendors/@popperjs/popper.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
    <script src="vendors/is/is.min.js"></script>
    <script src="https://scripts.sirv.com/sirvjs/v3/sirv.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="vendors/fontawesome/all.min.js"></script>
    <script src="../Assets/Template/User/assets/js/theme.js"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fjalla+One&amp;family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100&amp;display=swap" rel="stylesheet">
  </body>

</html>