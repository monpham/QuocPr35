<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/07/20
  Time: 8:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Simulor - Responsive Bootstrap 4 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
    <meta content="Coderthemes" name="author">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets\images\favicon.ico">

    <!-- plugin css -->
    <link href="assets\libs\datatables\dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="assets\libs\datatables\responsive.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="assets\libs\datatables\buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link href="assets\libs\datatables\select.bootstrap4.min.css" rel="stylesheet" type="text/css">

    <!-- App css -->
    <link href="assets\css\bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets\css\icons.min.css" rel="stylesheet" type="text/css">
    <link href="assets\css\app.min.css" rel="stylesheet" type="text/css">

</head>

<body>

<!-- Begin page -->
<div id="wrapper">

    <!-- Topbar Start -->
    <div class="navbar-custom">
        <ul class="list-unstyled topnav-menu float-right mb-0">

     <%--             <li class="dropdown d-none d-lg-block">
                      <a class="nav-link dropdown-toggle mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                          <img src="assets\images\flags\us.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">English <i class="mdi mdi-chevron-down"></i> </span>
                      </a>
                      <div class="dropdown-menu dropdown-menu-right">
                          <!-- item-->
                          <a href="javascript:void(0);" class="dropdown-item notify-item">
                              <img src="assets\images\flags\germany.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">German</span>
                          </a>

                          <!-- item-->
                          <a href="javascript:void(0);" class="dropdown-item notify-item">
                              <img src="assets\images\flags\italy.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Italian</span>
                          </a>

                          <!-- item-->
                          <a href="javascript:void(0);" class="dropdown-item notify-item">
                              <img src="assets\images\flags\spain.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Spanish</span>
                          </a>

                          <!-- item-->
                          <a href="javascript:void(0);" class="dropdown-item notify-item">
                              <img src="assets\images\flags\russia.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Russian</span>
                          </a>

                      </div>
                  </li>--%>


             <%--     <li class="dropdown notification-list">
                      <a class="nav-link dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                          <i class="fe-bell noti-icon"></i>
                          <span class="badge badge-danger rounded-circle noti-icon-badge">2</span>
                      </a>
                      <div class="dropdown-menu dropdown-menu-right dropdown-lg">

                          <!-- item-->
                          <div class="dropdown-item noti-title">
                              <h5 class="m-0">
                                          <span class="float-right">
                                              <a href="" class="text-dark">
                                                  <small>Clear All</small>
                                              </a>
                                          </span>Notification
                              </h5>
                          </div>

                          <div class="slimscroll noti-scroll">

                              <!-- item-->
                              <a href="javascript:void(0);" class="dropdown-item notify-item">
                                  <div class="notify-icon">
                                      <img src="assets\images\users\avatar-2.jpg" class="img-fluid rounded-circle" alt=""> </div>
                                  <p class="notify-details">Cristina Pride</p>
                                  <p class="text-muted mb-0 user-msg">
                                      <small>Hi, How are you? What about our next meeting</small>
                                  </p>
                              </a>

                              <!-- item-->
                              <a href="javascript:void(0);" class="dropdown-item notify-item active">
                                  <div class="notify-icon bg-warning"><i class="mdi mdi-comment-account-outline"></i> </div>
                                  <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">1 min ago</small></p>
                              </a>

                              <!-- item-->
                              <a href="javascript:void(0);" class="dropdown-item notify-item">
                                  <div class="notify-icon bg-info"><i class="mdi mdi-account-plus"></i></div>
                                  <p class="notify-details">New user registered.<small class="text-muted">5 hours ago</small></p>
                              </a>

                              <!-- item-->
                              <a href="javascript:void(0);" class="dropdown-item notify-item">
                                  <div class="notify-icon">
                                      <img src="assets\images\users\avatar-4.jpg" class="img-fluid rounded-circle" alt=""> </div>
                                  <p class="notify-details">Karen Robinson</p>
                                  <p class="text-muted mb-0 user-msg">
                                      <small>Wow ! this admin looks good and awesome design</small>
                                  </p>
                              </a>




                              <!-- item-->
                              <a href="javascript:void(0);" class="dropdown-item notify-item">
                                  <div class="notify-icon bg-danger"><i class="mdi mdi-comment-account-outline"></i></div>
                                  <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">4 days ago</small></p>
                              </a>

                              <!-- item-->
                              <a href="javascript:void(0);" class="dropdown-item notify-item">
                                  <div class="notify-icon bg-primary">
                                      <i class="mdi mdi-heart"></i>
                                  </div>
                                  <p class="notify-details">Carlos Crouch liked
                                      <b>Admin</b>
                                      <small class="text-muted">13 days ago</small>
                                  </p>
                              </a>
                          </div>

                          <!-- All-->
                          <a href="javascript:void(0);" class="dropdown-item text-center text-primary notify-item notify-all">
                              View all
                              <i class="fi-arrow-right"></i>
                          </a>

                      </div>
                  </li>

                  <li class="dropdown notification-list">
                      <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                          <img src="assets\images\users\avatar-4.jpg" alt="user-image" class="rounded-circle">
                          <span class="pro-user-name ml-1">
                                      Morgan K <i class="mdi mdi-chevron-down"></i>
                                  </span>
                      </a>
                      <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                          <!-- item-->
                          <div class="dropdown-item noti-title">
                              <h6 class="m-0">
                                  Welcome !
                              </h6>
                          </div>

                          <!-- item-->
                          <a href="javascript:void(0);" class="dropdown-item notify-item">
                              <i class="dripicons-user"></i>
                              <span>My Account</span>
                          </a>

                          <!-- item-->
                          <a href="javascript:void(0);" class="dropdown-item notify-item">
                              <i class="dripicons-gear"></i>
                              <span>Settings</span>
                          </a>

                          <!-- item-->
                          <a href="javascript:void(0);" class="dropdown-item notify-item">
                              <i class="dripicons-help"></i>
                              <span>Support</span>
                          </a>

                          <!-- item-->
                          <a href="javascript:void(0);" class="dropdown-item notify-item">
                              <i class="dripicons-lock"></i>
                              <span>Lock Screen</span>
                          </a>

                          <div class="dropdown-divider"></div>

                          <!-- item-->
                          <a href="javascript:void(0);" class="dropdown-item notify-item">
                              <i class="dripicons-power"></i>
                              <span>Logout</span>
                          </a>

                      </div>
                  </li>

                  <li class="dropdown notification-list">
                      <a href="javascript:void(0);" class="nav-link right-bar-toggle waves-effect waves-light">
                          <i class="fe-settings noti-icon"></i>
                      </a>
                  </li>--%>

        </ul>

        <ul class="list-unstyled menu-left mb-0">

            <li class="float-left">
                <button class="button-menu-mobile open-left disable-btn">
                    <i class="fe-menu"></i>
                </button>
            </li>
            <%--   <li class="app-search d-none d-sm-block">
                   <form>
                       <div class="input-group">
                           <input type="text" class="form-control" placeholder="Search...">
                           <div class="input-group-append">
                               <button class="btn btn-primary" type="submit">
                                   <i class="fe-search"></i>
                               </button>
                           </div>
                       </div>
                   </form>
               </li>--%>
        </ul>
    </div>
    <!-- end Topbar -->

    <!-- ========== Left Sidebar Start ========== -->
    <div class="left-side-menu">

        <div class="slimscroll-menu">

            <!-- LOGO -->
            <a href="/admin" class="logo text-center mb-4">
                   <%--     <span class="logo-lg">
                            <img src="assets\images\logo-dark.png" alt="" height="20">
                        </span>--%>
                <span class="logo-sm">
                            <img src="assets\images\logo-sm.png" alt="" height="24">
                        </span>
            </a>

            <!--- Sidemenu -->
            <div class="left-side-menu">

                <div class="slimscroll-menu">

                    <!-- LOGO -->
                    <a href="index.html" class="logo text-center mb-4">
                        <%--            <span class="logo-lg">
                                        <img src="assets\images\logo-dark.png" alt="" height="20">
                                    </span>--%>
                        <span class="logo-sm">
                            <img src="assets\images\logo-sm.png" alt="" height="24">
                        </span>
                    </a>

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">

                        <ul class="metismenu" id="side-menu">

                            <li class="menu-title">Navigation</li>

                            <li>
                                <a href="/admin">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span> Dashboard </span>
                                </a>
                            </li>
                            <li>

                            </li>
                            <li>
                                <a href="/calendar">
                                    <i class="fe-pie-chart"></i>
                                    <span> Calendar </span>
                                </a>
                            </li>

                            <li>
                                <a href="/tables">
                                    <i class="fe-type"></i>
                                    <span> Advanced Tables </span>
                                </a>
                            </li>
                            <li>
                                <a href="/contacts">
                                    <i class="fe-grid"></i>
                                    <span> Contacts </span>
                                </a>
                            </li>
                            <li>
                                <a href="/productsadmin">
                                    <i class="fe-layout"></i>
                                    <span> Products </span>
                                </a>
                            </li>
                            <li>
                                <a href="/orders">
                                    <i class="fe-layout"></i>
                                    <span> Orders </span>
                                </a>
                            </li>
                            <li>
                                <a href="/invoice">
                                    <i class="fe-edit"></i>
                                    <span> Invoice </span>
                                </a>
                            </li>
                            <%--


                                                <li>
                                                    <a href="javascript: void(0);">
                                                        <i class="fe-edit"></i>
                                                        <span class="badge badge-primary float-right">04</span>
                                                        <span> Forms </span>
                                                    </a>
                                                    <ul class="nav-second-level" aria-expanded="false">
                                                        <li>
                                                            <a href="form-elements.html">General Elements</a>
                                                        </li>
                                                        <li>
                                                            <a href="form-advanced.html">Advanced Form</a>
                                                        </li>
                                                        <li>
                                                            <a href="form-editors.html">Editors</a>
                                                        </li>
                                                        <li>
                                                            <a href="form-uploads.html">File Uploads</a>
                                                        </li>
                                                    </ul>
                                                </li>
                            --%>

                            <%--         <li>
                                         <a href="javascript: void(0);">
                                             <i class="fe-book-open"></i>
                                             <span> Pages </span>
                                             <span class="menu-arrow"></span>
                                         </a>
                                         <ul class="nav-second-level" aria-expanded="false">

                                             <li>
                                                 <a href="/calendar">Calendar</a>
                                             </li>
                                             <li>
                                                 <a href="/invoice">Invoice</a>
                                             </li>
                                             <li>
                                                 <a href="/sweet">Sweet Alerts</a>
                                             </li>
                                         </ul>
                                     </li>--%>
                            <%--    <li>
                                    <a href="javascript: void(0);">
                                        <i class="fe-grid"></i>
                                        <span> Tables </span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul class="nav-second-level" aria-expanded="false">

                                        <li>
                                            <a href="/tables">Advanced Tables</a>
                                        </li>
                                        <li>
                                            <a href="/contacts">Contacts</a>
                                        </li>
                                    </ul>
                                </li>--%>

                            <li class="menu-title">HOST</li>



                            <li>
                                <a href="/maps">
                                    <i class="fe-map-pin"></i>
                                    <span> Maps </span>
                                </a>
                            </li>
                            <li>
                                <a href="/logout">
                                    <i class="fe-briefcase"></i>
                                    <span> Log Out </span>
                                </a>
                            </li>

                        </ul>

                    </div>
                    <!-- End Sidebar -->

                    <div class="clearfix"></div>

                </div>
                <!-- Sidebar -left -->

            </div>
            <!-- End Sidebar -->

            <div class="clearfix"></div>

        </div>
        <!-- Sidebar -left -->

    </div>
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Simulor</a></li>
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                                    <li class="breadcrumb-item active">Advanced Tables</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Advanced Tables</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <!-- end row-->
                <form:form modelAttribute="pagedListHolder" action="orders">
                    Filter: <input type="text" name="keyword" id="keyword" size="50" value="${keyword}" required />
                    <input type="submit" value="Search" />

                </form:form>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">

                                <h4 class="header-title">Transaction</h4>
                                <p class="sub-header">
                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page
                                    that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                </p>


                                <table id="datatable-buttons" class="table table-striped dt-responsive nowrap">
                                    <thead>
                                    <tr>
                                        <th>UUID - SHA</th>
                                        <th>NAME</th>
                                        <th>EMAIL</th>
                                        <th>ADDRESS</th>
                                        <th>PHONE</th>
                                        <th>STATUS</th>
                                        <th>DATE</th>
                                        <th>ACTION</th>
                                        <th>INVOICE</th>
                                        <th>PAYMENT</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="s" items="${pagedListHolder.pageList}">
                                        <tr>
                                            <td>${s.security}</td>
                                            <td>${s.transactionname}</td>
                                            <td>${s.transactionmail}</td>
                                            <td>${s.transactionaddress}</td>
                                            <td>${s.transactionphone}</td>
                                            <td>${s.transactionstatus}</td>
                                            <td>${s.transactiondate}</td>
                                            <td><a href='<c:url value="/viewdetails/${s.id}/${s.transactionname}"/>'>View Details</a></td>
                                            <td><a href='<c:url value="/invoices?id=${s.id}"/>'>Invoice</a></td>
                                            <td>$  ${s.payment}</td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <c:url value="/orders" var="pagedLink">
                                    <c:param name="p" value="~" />
                                </c:url>
                                <tg:paging pagedListHolder="${pagedListHolder}"	pagedLink="${pagedLink}" />
                            </div> <!-- end card body-->
                        </div> <!-- end card -->
                    </div><!-- end col-->
                </div>
                <!-- end row-->



                <!-- end row-->



                <!-- end row-->

            </div> <!-- container-fluid -->

        </div> <!-- content -->



        <!-- Footer Start -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        2018 - 2019 &copy; Simulor theme by <a href="">Coderthemes</a>
                    </div>
                    <div class="col-md-6">
                        <div class="text-md-right footer-links d-none d-sm-block">
                            <a href="#">About Us</a>
                            <a href="#">Help</a>
                            <a href="#">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->

    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->


</div>
<!-- END wrapper -->

<!-- Right Sidebar -->
<div class="right-bar">
    <div class="rightbar-title">
        <a href="javascript:void(0);" class="right-bar-toggle float-right">
            <i class="mdi mdi-close"></i>
        </a>
        <h5 class="m-0 text-white">Settings</h5>
    </div>
    <div class="slimscroll-menu">
        <hr class="mt-0">
        <h5 class="pl-3">Basic Settings</h5>
        <hr class="mb-0">


        <div class="p-3">
            <div class="checkbox checkbox-primary mb-2">
                <input id="checkbox1" type="checkbox" checked="">
                <label for="checkbox1">
                    Notifications
                </label>
            </div>
            <div class="checkbox checkbox-primary mb-2">
                <input id="checkbox2" type="checkbox" checked="">
                <label for="checkbox2">
                    API Access
                </label>
            </div>
            <div class="checkbox checkbox-primary mb-2">
                <input id="checkbox3" type="checkbox">
                <label for="checkbox3">
                    Auto Updates
                </label>
            </div>
            <div class="checkbox checkbox-primary mb-2">
                <input id="checkbox4" type="checkbox" checked="">
                <label for="checkbox4">
                    Online Status
                </label>
            </div>
            <div class="checkbox checkbox-primary mb-0">
                <input id="checkbox5" type="checkbox" checked="">
                <label for="checkbox5">
                    Auto Payout
                </label>
            </div>
        </div>

        <!-- Timeline -->
        <hr class="mt-0">
        <h5 class="pl-3 pr-3">Messages <span class="float-right badge badge-pill badge-danger">25</span></h5>
        <hr class="mb-0">
        <div class="p-3">
            <div class="inbox-widget">
                <div class="inbox-item">
                    <div class="inbox-item-img"><img src="assets\images\users\avatar-1.jpg" class="rounded-circle" alt=""></div>
                    <p class="inbox-item-author"><a href="javascript: void(0);" class="text-dark">Chadengle</a></p>
                    <p class="inbox-item-text">Hey! there I'm available...</p>
                    <p class="inbox-item-date">13:40 PM</p>
                </div>
                <div class="inbox-item">
                    <div class="inbox-item-img"><img src="assets\images\users\avatar-2.jpg" class="rounded-circle" alt=""></div>
                    <p class="inbox-item-author"><a href="javascript: void(0);" class="text-dark">Tomaslau</a></p>
                    <p class="inbox-item-text">I've finished it! See you so...</p>
                    <p class="inbox-item-date">13:34 PM</p>
                </div>
                <div class="inbox-item">
                    <div class="inbox-item-img"><img src="assets\images\users\avatar-3.jpg" class="rounded-circle" alt=""></div>
                    <p class="inbox-item-author"><a href="javascript: void(0);" class="text-dark">Stillnotdavid</a></p>
                    <p class="inbox-item-text">This theme is awesome!</p>
                    <p class="inbox-item-date">13:17 PM</p>
                </div>

                <div class="inbox-item">
                    <div class="inbox-item-img"><img src="assets\images\users\avatar-4.jpg" class="rounded-circle" alt=""></div>
                    <p class="inbox-item-author"><a href="javascript: void(0);" class="text-dark">Kurafire</a></p>
                    <p class="inbox-item-text">Nice to meet you</p>
                    <p class="inbox-item-date">12:20 PM</p>

                </div>
                <div class="inbox-item">
                    <div class="inbox-item-img"><img src="assets\images\users\avatar-5.jpg" class="rounded-circle" alt=""></div>
                    <p class="inbox-item-author"><a href="javascript: void(0);" class="text-dark">Shahedk</a></p>
                    <p class="inbox-item-text">Hey! there I'm available...</p>
                    <p class="inbox-item-date">10:15 AM</p>

                </div>
            </div> <!-- end inbox-widget -->
        </div> <!-- end .p-3-->

    </div> <!-- end slimscroll-menu-->
</div>
<!-- /Right-bar -->

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<!-- Vendor js -->
<script src="assets\js\vendor.min.js"></script>

<!-- datatable js -->
<script src="assets\libs\datatables\jquery.dataTables.min.js"></script>
<script src="assets\libs\datatables\dataTables.bootstrap4.min.js"></script>
<script src="assets\libs\datatables\dataTables.responsive.min.js"></script>
<script src="assets\libs\datatables\responsive.bootstrap4.min.js"></script>

<script src="assets\libs\datatables\dataTables.buttons.min.js"></script>
<script src="assets\libs\datatables\buttons.bootstrap4.min.js"></script>
<script src="assets\libs\datatables\buttons.html5.min.js"></script>
<script src="assets\libs\datatables\buttons.flash.min.js"></script>
<script src="assets\libs\datatables\buttons.print.min.js"></script>

<script src="assets\libs\datatables\dataTables.keyTable.min.js"></script>
<script src="assets\libs\datatables\dataTables.select.min.js"></script>

<!-- Datatables init -->
<script src="assets\js\pages\datatables.init.js"></script>

<!-- App js -->
<script src="assets\js\app.min.js"></script>

</body>
</html>
