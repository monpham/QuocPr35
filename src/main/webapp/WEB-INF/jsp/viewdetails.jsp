<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01/13/21
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="xlink" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;700&display=swap" rel="stylesheet" />

    <link rel="shortcut icon" href="/product/images/favicon.ico" type="image/x-icon" />

    <!-- Carousel -->
    <link rel="stylesheet" href="node_modules/@glidejs/glide/dist/css/glide.core.min.css" />
    <link rel="stylesheet" href="node_modules/@glidejs/glide/dist/css/glide.theme.min.css" />

    <!-- Animate On Scroll -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />


    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="/product/styles/styles.css" />

    <title>Phone Shop</title>
</head>

<body>
<header id="header" class="header">
    <div class="navigation">
        <div class="container">
            <nav class="nav">
                <div class="nav__hamburger">
                    <svg>
                        <use xlink:href="/product/images/sprite.svg#icon-menu"></use>
                    </svg>
                </div>

                <div class="nav__logo">
                    <a href="/" class="scroll-link">
                        PHONE
                    </a>
                </div>

                <div class="nav__menu">
                    <div class="menu__top">
                        <span class="nav__category">PHONE</span>
                        <a href="#" class="close__toggle">
                            <svg>
                                <use xlink:href="/product/images/sprite.svg#icon-cross"></use>
                            </svg>
                        </a>
                    </div>
                    <ul class="nav__list">
                        <li class="nav__item">
                            <a href="/" class="nav__link">Home</a>
                        </li>
                        <li class="nav__item">
                            <a href="#" class="nav__link">Products</a>
                        </li>
                        <li class="nav__item">
                            <a href="#" class="nav__link">Blog</a>
                        </li>
                        <li class="nav__item">
                            <a href="#" class="nav__link">Contact</a>
                        </li>
                    </ul>
                </div>

                <div class="nav__icons">
                    <a href="/login" class="icon__item">
                        <svg class="icon__user">
                            <use xlink:href="/product/images/sprite.svg#icon-user"></use>
                        </svg>
                    </a>

                    <a href="/search" class="icon__item">
                        <svg class="icon__search">
                            <use xlink:href="/product/images/sprite.svg#icon-search"></use>
                        </svg>
                    </a>

                    <a href="/cart" class="icon__item">
                        <svg class="icon__cart">
                            <use xlink:href="/product/images/sprite.svg#icon-shopping-basket"></use>
                        </svg>
                        <span id="cart__total">${sessionScope.total == null ? "0" : sessionScope.total} </span>
                    </a>
                </div>
            </nav>
        </div>
    </div>

    <div class="page__title-area">
        <div class="container">
            <div class="page__title-container">
                <ul class="page__titles">
                    <li>
                        <a href="/">
                            <svg>
                                <use xlink:href="/product/images/sprite.svg#icon-home"></use>
                            </svg>
                        </a>
                    </li>
                    <li class="page__title">Cart</li>
                </ul>
            </div>
        </div>
    </div>
</header>

<main id="main">
    <section class="section cart__area">
        <div class="container">
            <div class="responsive__cart-area">
                <form class="cart__form">
                    <div class="cart__table table-responsive">
                        <table width="100%" class="table">
                            <thead>
                            <tr>
                                <th>PRODUCT</th>
                                <th>NAME</th>
                                <th>UNIT PRICE</th>
                                <th>QUANTITY</th>
                                <th>TOTAL</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="map" items="${ordersEntities}">
                                <tr>
                                    <td class="product__thumbnail">
                                        <a href="/detail/${map.productsEntity.id}">
                                            <img src='<c:url value="/product/images/${map.productsEntity.images}"/>' alt="">
                                        </a>
                                    </td>
                                    <td class="product__name">
                                        <a href="#">${map.productsEntity.nameproduct}</a>
                                        <br><c:out value="${map.productsEntity.productPortfolioEntity.portfolio}"/><br>
                                        <small>${map.productsEntity.nameproduct}</small>
                                    </td>
                                    <td class="product__price">
                                        <div class="price">
                                            <span class="new__price">${map.productsEntity.price}</span>
                                        </div>
                                    </td>
                                    <td class="product__quantity">
                                        <div class="input-counter">
                                            <div>
                                                 <%--   <span class="minus-btn">
                                                        <svg>
                                                            <use xlink:href="/product/images/sprite.svg#icon-minus"></use>
                                                        </svg>
                                                    </span>--%>
                                                <input type="text" min="1" value="${map.quantity}" max="10" class="counter-btn">
                                            <%--    <span class="plus-btn">
                                                        <svg>
                                                            <use xlink:href="/product/images/sprite.svg#icon-plus"></use>
                                                        </svg>
                                                    </span>--%>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="product__subtotal">
                                        <div class="price">
                                            <span class="new__price">$${map.quantity * map.productsEntity.price}</span>
                                        </div>
                                    <%--    <a href="/cart/remove/${map.productsEntity.id}" class="remove__cart-item">
                                            <svg>
                                                <use xlink:href="/product/images/sprite.svg#icon-trash"></use>
                                            </svg>
                                        </a>--%>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="cart-btns">
                        <div class="continue__shopping">
                            <a href="/orders">Continue Admin</a>
                        </div>

                    </div>
<%--

                    <div class="cart__totals">
                        <h3>Cart Totals</h3>
                        <ul>
                         &lt;%&ndash;   <li>
                                Subtotal
                                <span class="new__price">$${map.quantity }</span>
                            </li>&ndash;%&gt;
                            <li>
                                VAT (10%)
                                <span>$${orderDetailsEntity.sale}</span>
                            </li>
                            <li>
                                Total
                                <span class="new__price">$${orderDetailsEntity.ordersEntity.payment + (orderDetailsEntity.ordersEntity.payment * 0.1) - (orderDetailsEntity.sale)}</span>
                            </li>
                        </ul>
                        <a href="/cart/checkoutform">PROCEED TO CHECKOUT</a>
                    </div>
--%>

            </div>
        </div>
    </section>

    <!-- Facility Section -->
    <section class="facility__section section" id="facility">
        <div class="container">
            <div class="facility__contianer">
                <div class="facility__box">
                    <div class="facility-img__container">
                        <svg>
                            <use xlink:href="/product/images/sprite.svg#icon-airplane"></use>
                        </svg>
                    </div>
                    <p>FREE SHIPPING WORLD WIDE</p>
                </div>

                <div class="facility__box">
                    <div class="facility-img__container">
                        <svg>
                            <use xlink:href="/product/images/sprite.svg#icon-credit-card-alt"></use>
                        </svg>
                    </div>
                    <p>100% MONEY BACK GUARANTEE</p>
                </div>

                <div class="facility__box">
                    <div class="facility-img__container">
                        <svg>
                            <use xlink:href="/product/images/sprite.svg#icon-credit-card"></use>
                        </svg>
                    </div>
                    <p>MANY PAYMENT GATWAYS</p>
                </div>

                <div class="facility__box">
                    <div class="facility-img__container">
                        <svg>
                            <use xlink:href="/product/images/sprite.svg#icon-headphones"></use>
                        </svg>
                    </div>
                    <p>24/7 ONLINE SUPPORT</p>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- Footer -->
<footer id="footer" class="section footer">
    <div class="container">
        <div class="footer__top">
            <div class="footer-top__box">
                <h3>EXTRAS</h3>
                <a href="#">Brands</a>
                <a href="#">Gift Certificates</a>
                <a href="#">Affiliate</a>
                <a href="#">Specials</a>
                <a href="#">Site Map</a>
            </div>
            <div class="footer-top__box">
                <h3>INFORMATION</h3>
                <a href="#">About Us</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms & Conditions</a>
                <a href="#">Contact Us</a>
                <a href="#">Site Map</a>
            </div>
            <div class="footer-top__box">
                <h3>MY ACCOUNT</h3>
                <a href="#">My Account</a>
                <a href="#">Order History</a>
                <a href="#">Wish List</a>
                <a href="#">Newsletter</a>
                <a href="#">Returns</a>
            </div>
            <div class="footer-top__box">
                <h3>CONTACT US</h3>
                <div>
                        <span>
                            <svg>
                                <use xlink:href="/product/images/sprite.svg#icon-location"></use>
                            </svg>
                        </span>
                    42 Dream House, Dreammy street, 7131 Dreamville, USA
                </div>
                <div>
                        <span>
                            <svg>
                                <use xlink:href="/product/images/sprite.svg#icon-envelop"></use>
                            </svg>
                        </span>
                    company@gmail.com
                </div>
                <div>
                        <span>
                            <svg>
                                <use xlink:href="/product/images/sprite.svg#icon-phone"></use>
                            </svg>
                        </span>
                    456-456-4512
                </div>
                <div>
                        <span>
                            <svg>
                                <use xlink:href="/product/images/sprite.svg#icon-paperplane"></use>
                            </svg>
                        </span>
                    Dream City, USA
                </div>
            </div>
        </div>
    </div>
    <div class="footer__bottom">
        <div class="footer-bottom__box">

        </div>
        <div class="footer-bottom__box">

        </div>
    </div>
    </div>
</footer>

<!-- End Footer -->

<!-- Go To -->

<a href="#header" class="goto-top scroll-link">
    <svg>
        <use xlink:href="/product/images/sprite.svg#icon-arrow-up"></use>
    </svg>
</a>

<!-- Glide Carousel Script -->
<script src="node_modules/@glidejs/glide/dist/glide.min.js"></script>

<!-- Animate On Scroll -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<!-- Custom JavaScript -->
<script src="/product/js/products.js"></script>
<script src="/product/js/index.js"></script>
<script src="/product/js/slider.js"></script>
</body>

</html>
