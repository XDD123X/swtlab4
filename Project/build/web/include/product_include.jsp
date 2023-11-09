<%-- 
    Document   : index
    Created on : Jul 15, 2023, 12:49:46 PM
    Author     : duchi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>Product</title>


        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!-- fonts style -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet"> <!-- range slider -->

        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />

    </head>

    <body class="sub_page">



        <!-- product section -->

        <section class="product_section layout_padding">
            <div class="container">
                <div class="heading_container heading_center">
                    <h2>
                        Our Products
                    </h2>
                </div>
                <div class="row">
                    <c:if test="${PRODUCT_LIST eq null}">
                        <h2>
                            Our Products
                        </h2>
                    </c:if>


                    <c:forEach var="product" items="${PRODUCT_LIST}" >
                        <div class="col-sm-6 col-lg-4">
                            <div class="box">
                                <div class="img-box">
                                    <img src="images/${product.image}" alt="">
                                    <a href="add-to-cart?product_id=${product.productId}&quantity=1" class="add_cart_btn">
                                        <span>
                                            Add To Cart
                                        </span>
                                    </a>
                                </div>
                                <div class="detail-box">
                                    <a href="Product-detail?productID=${product.productId}">
                                        <h5>
                                            ${product.name}
                                        </h5>
                                    </a>

                                    <div class="product_info">
                                        <h5>
                                            <span>$</span> ${product.price}
                                        </h5>
                                        <div class="star_container">
                                            <c:forEach begin="1" end="${product.rate}" varStatus="loop">
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- end product section -->


        <!-- jQery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>


    </body>

</html>
