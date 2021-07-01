<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01/14/21
  Time: 3:40 PM
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



        </ul>

        <ul class="list-unstyled menu-left mb-0">

            <li class="float-left">
                <button class="button-menu-mobile open-left disable-btn">
                    <i class="fe-menu"></i>
                </button>
            </li>

        </ul>
    </div>
    <!-- end Topbar -->

    <!-- ========== Left Sidebar Start ========== -->
    <div class="left-side-menu">

        <div class="slimscroll-menu">

            <!-- LOGO -->
            <a href="index.html" class="logo text-center mb-4">
                    <%--    <span class="logo-lg">
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
                <form:form modelAttribute="pagedListHolder" action="tables">
                    Filter: <input type="text" name="keyword" id="keyword" size="50" value="${keyword}" required />
                    <input type="submit" value="Search" />

                </form:form>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">

                                <h4 class="header-title">Buttons example</h4>
                                <p class="sub-header">
                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page
                                    that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                </p>


                                <table id="datatable-buttons" class="table table-striped dt-responsive nowrap">
                                    <thead>

                                    <tr>
                                        <th>ID</th>
                                        <th>NAME</th>
                                        <th>PHONE</th>
                                        <th>EMAIL</th>
                                        <th>Start date</th>
                                        <th>PassWord</th>


                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="s"  items="${pagedListHolder.pageList}">
                                    <tr>
<td>${s.id}</td>
                                        <td>${s.userEntity.username}</td>
                                          <td>${s.phonenumber}</td>
                                        <td>${s.email}</td>
                                        <td>${s.date}</td>
                                        <td>${s.userEntity.password}</td>


                                    </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <c:url value="/tables" var="pagedLink">
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
