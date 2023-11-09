<%-- 
    Document   : header
    Created on : Jul 15, 2023, 1:06:24 PM
    Author     : duchi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- header section strats -->
        <header class="header_section">
            <div class="header_top">
                <div class="container-fluid">
                    <div class="top_nav_container">
                        <div class="contact_nav">
                            <a href="#">
                                <i class="fa fa-phone" aria-hidden="true"></i>
                                <span>
                                    Call : +84 0123456789
                                </span>
                            </a>
                            <a href="#">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                                <span>
                                    Email : PRJ301-Assignment@gmail.com
                                </span>
                            </a>
                        </div>

                        <form class="search_form" method="GET" action="Search">
                            <input type="text" name="keyword" class="form-control" placeholder="Search here...">
                            <button class="" type="submit">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </form>

                        <div class="user_option_box">
                            <a href="Account" class="account-link">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <span>
                                    Account
                                </span>
                            </a>
                            <c:set var="CART_LIST_SIZE" value="${fn:length(sessionScope.CART_LIST)}" />
                            <a href="Cart" class="cart-link">
                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                <span>
                                    Cart:<span style="padding: 1px 7px; background-color: red; color: white; border-radius: 10px;">${CART_LIST_SIZE}</span>
                                </span>
                            </a>
                        </div>
                    </div>

                </div>
            </div>
            <div class="header_bottom">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="Home">
                            <span>
                                PRJ301
                            </span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ">
                                <li class="nav-item active">
                                    <a class="nav-link" href="Home">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Product">Products</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Order">Orders</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Checkout">Checkout</a>
                                </li>
<!--                                <li class="nav-item">
                                    <a class="nav-link" href="Test">Test Button</a>
                                </li>-->

                                <c:if test="${ACCOUNT.role >= 3}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="ShopManager" style="color: green;">Shop Manager</a>
                                    </li>
                                </c:if>
                                <c:if test="${ACCOUNT.role >= 4}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="Manager" style="color: darkgoldenrod;">Manager</a>
                                    </li>
                                </c:if>
                                <c:if test="${ACCOUNT.role >= 5}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="Admin" style="color: red;">Administrator</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </header>
        <!-- end header section -->
    </body>
</html>
