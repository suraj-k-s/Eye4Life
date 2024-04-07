<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@include file="Head.jsp" %>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <!-- Sidebar Toggle (Topbar) -->
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
            </button>



            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">


                <!-- Nav Item - Alerts -->
                <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="ViewComplaint.jsp"  role="button">
                        <i class="fas fa-bell fa-fw"></i>
                        <!-- Counter - Alerts -->
                        <span class="badge badge-danger badge-counter">
                            <%

                                String selQry = "select count(*) as id from tbl_complaint where notification_status='0'";
                                ResultSet rs = con.selectCommand(selQry);
                                rs.next();
                                out.println(rs.getString("id"));

                            %>  
                        </span>
                    </a>

                </li>


                <div class="topbar-divider d-none d-sm-block"></div>

                <!-- Nav Item - User Information -->
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">Doyal Eldho</span>
                        <img class="img-profile rounded-circle"
                             src="doyal.jpg">
                    </a>
                    <!-- Dropdown - User Information -->
                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                         aria-labelledby="userDropdown">

                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="../Guest/Login.jsp" data-toggle="modal" data-target="#logoutModal" onclick="logout()">
                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                            Logout
                        </a>

                        <script>
                            function logout() {
                                // Ask for confirmation
                                if (confirm("Are you sure you want to logout?")) {
                                    // Redirect to the logout page
                                    window.location.href = "../Guest/Login.jsp";
                                } else {
                                    // If the user cancels, do nothing
                                    return false;
                                }
                            }
                        </script>
                    </div>
                </li>

            </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

            </div>

            <!-- Content Row -->
            <div class="row">

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Donor</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <%                                            String selDonor = "select count(*) as id from tbl_donor where donor_status='" + 1 + "' ";
                                            ResultSet rsDonor = con.selectCommand(selDonor);
                                            rsDonor.next();
                                            out.println(rsDonor.getString("id"));

                                        %> 
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-solid fa-user fa-2x text-gray-300"></i>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        Recipient</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <%                                              String selRecipient = "select count(*) as id from tbl_recipient";
                                            ResultSet rsRecipient = con.selectCommand(selRecipient);
                                            rsRecipient.next();
                                            out.println(rsRecipient.getString("id"));

                                        %> 
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-solid fa-user fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Donation
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">

                                                <%                                                        String selDonor1 = "select count(*) as id from tbl_donor where donor_status='" + 3 + "'";
                                                    ResultSet rsDonorRecipient = con.selectCommand(selDonor1);
                                                    rsDonorRecipient.next();
                                                    out.println(rsDonorRecipient.getString("id"));

                                                %> 
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="progress progress-sm mr-2">
                                                <div class="progress-bar bg-info" role="progressbar"
                                                     style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                    <i class="fa-solid fa-box-heart"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pending Requests Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                        New Appointments</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <%                                               String appoint = "select count(*) as id from tbl_checkupappointment ";
                                            ResultSet rsappoint = con.selectCommand(appoint);
                                            rsappoint.next();
                                            out.println(rsappoint.getString("id"));

                                        %> 
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-duotone fa-hospital fa-2x text-gray-300"></i>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Content Row -->

            <div class="row">

                <!-- Area Chart -->
                <div class="col-xl-8 col-lg-7">
                    <div class="card shadow mb-4" style="min-height: 500px">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-area">
                                <canvas id="myAreaChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pie Chart -->
                <div class="col-xl-4 col-lg-5">
                    <div class="card shadow mb-4" style="min-height: 500px">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>

                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2">
                                <canvas id="myPieChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>
        <!-- /.container-fluid -->

    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <script>



        <%            String selChart = "SELECT 'Jan' AS month,COUNT(*) AS total_matches FROM tbl_match WHERE MONTHNAME(match_date) = 'January' UNION ALL SELECT 'Feb' AS month, COUNT(*) AS total_matches FROM tbl_match WHERE MONTHNAME(match_date) = 'February' UNION ALL SELECT  'Mar' AS month, COUNT(*) AS total_matches FROM   tbl_match WHERE   MONTHNAME(match_date) = 'March' UNION ALL SELECT   'Apr' AS month, COUNT(*) AS total_matches FROM  tbl_match WHERE   MONTHNAME(match_date) = 'April' UNION ALL SELECT  'May' AS month, COUNT(*) AS total_matches FROM  tbl_match WHERE  MONTHNAME(match_date) = 'May' UNION ALL SELECT   'Jun' AS month,   COUNT(*) AS total_matches FROM   tbl_match WHERE   MONTHNAME(match_date) = 'June' UNION ALL SELECT   'Jul' AS month,  COUNT(*) AS total_matches FROM   tbl_match WHERE  MONTHNAME(match_date) = 'July' UNION ALL SELECT   'Aug' AS month, COUNT(*) AS total_matches FROM  tbl_match WHERE  MONTHNAME(match_date) = 'August' UNION ALL SELECT  'Sep' AS month, COUNT(*) AS total_matches FROM  tbl_match WHERE   MONTHNAME(match_date) = 'September' UNION ALL SELECT  'Oct' AS month, COUNT(*) AS total_matches FROM  tbl_match WHERE  MONTHNAME(match_date) = 'October' UNION ALL SELECT 'Nov' AS month, COUNT(*) AS total_matches FROM  tbl_match WHERE  MONTHNAME(match_date) = 'November' UNION ALL SELECT 'Dec' AS month, COUNT(*) AS total_matches FROM tbl_match WHERE MONTHNAME(match_date) = 'December'";
            ResultSet rsX = con.selectCommand(selChart);
            ResultSet rsY = con.selectCommand(selChart);
        %>


                            var xValues = [
        <%
            while (rsX.next()) {
                out.print("'" + rsX.getString("month") + "',");
            }
        %>
                            ];

                            var yValues = [
        <%
            while (rsY.next()) {
                out.print(rsY.getString("total_matches") + ",");
            }
        %>
                            ];



                            var barColors = [
                                "#b91d47",
                                "#00aba9",
                                "#2b5797",
                                "#e8c3b9",
                                "#1e7145",
                                "#b91d47",
                                "#00aba9",
                                "#2b5797",
                                "#e8c3b9",
                                "#1e7145",
                                "#b91d47",
                                "#00aba9",
                                "#2b5797",
                                "#e8c3b9",
                                "#1e7145",
                                "#b91d47",
                                "#00aba9",
                                "#2b5797",
                                "#e8c3b9",
                                "#1e7145"
                            ];

                            new Chart("myAreaChart", {
                                type: "bar",
                                data: {
                                    labels: xValues,
                                    datasets: [{
                                            label: "Donation Wise",
                                            backgroundColor: barColors,
                                            data: yValues
                                        }]
                                },
                                options: {
                                    title: {
                                        display: true,
                                        text: "All Donation Data"
                                    }
                                }
                            });




        <%
            String selDeath = "SELECT count(*) as death FROM `tbl_case`";
            String selHospital = "SELECT count(*) as hospital FROM `tbl_hospital` WHERE `hosp_status`=1";
            String seDonor = "SELECT count(*) as donor FROM `tbl_donor` WHERE `donor_status`=1";

            ResultSet rsDeath = con.selectCommand(selDeath);
            ResultSet rsHospital = con.selectCommand(selHospital);
            ResultSet rsDono = con.selectCommand(seDonor);

            rsDeath.next();
            rsHospital.next();
            rsDono.next();


        %>
                            var x = ['death', 'hospital', 'donor'];

                            var y = [
        <%                                    out.println("'" + rsDeath.getString("death") + "','" + rsHospital.getString("hospital") + "','" + rsDono.getString("donor") + "'");
        %>
                            ];


                            new Chart("myPieChart", {
                                type: "pie",
                                data: {
                                    labels: x,
                                    datasets: [{
                                            backgroundColor: barColors,
                                            data: y
                                        }]
                                },
                                options: {
                                    title: {
                                        display: true,
                                        text: "All Donation Data"
                                    }
                                }
                            });
    </script>
    <!-- End of Main Content -->
    <%@include file="Foot.jsp" %>