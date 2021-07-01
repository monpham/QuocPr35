<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01/14/21
  Time: 6:06 PM
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

    <!-- App css -->
    <link href="assets\css\bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets\css\icons.min.css" rel="stylesheet" type="text/css">
    <link href="assets\css\app.min.css" rel="stylesheet" type="text/css">

</head>

<body>


<form:form modelAttribute="pagedListHolder" action="searchproducts">
    Filter: <input type="text" name="keyword" id="keyword" size="50" value="${keyword}" required />
    <input type="submit" value="Search" />

</form:form>

<table class="table table-striped table-bordered">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>Title</th>
        <th>Code</th>
    </tr>

    <!-- loop over and print our customers -->
    <c:forEach var="s" items="${pagedListHolder.pageList}">
    <tr>
        <th scope="row">${s.id}</th>
        <td>
            <img src='<c:url value="/product/images/${s.images}"/>' alt="contact-img" height="36" title="contact-img" class="rounded-circle float-left mr-2">
            <p class="mb-0 font-weight-medium"><a href="/detail/${s.id}">${s.nameproduct}</a></p>
            <span class="font-13 d-none d-sm-block">      ${s.productPortfolioEntity.portfolio}</span>
        </td>

        <td>
            $ ${s.price}
        </td>

        <td>
                ${s.descriptionimges}
        </td>
        <td>
                ${s.code}
        </td>
    </tr>
</c:forEach>
</table>
<c:url value="/searchproducts" var="pagedLink">
    <c:param name="p" value="~" />
</c:url>
<tg:paging pagedListHolder="${pagedListHolder}"	pagedLink="${pagedLink}" />
</body>
</html>

