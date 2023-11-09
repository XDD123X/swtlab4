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

        <title>PRJ301 Assignment</title>


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

    <body>

        <div class="hero_area">

            <!--header section-->
            <jsp:include page="include/header.jsp"/>
            <!--end header section-->


            <!-- slider section -->
            <section class="slider_section ">
                <div id="customCarousel1" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">


                        <div class="carousel-item active">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="detail-box">
                                            <h1>
                                                first
                                            </h1>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste quam velit saepe dolorem deserunt quo quidem ad optio.
                                            </p>
                                            <a href="">
                                                Read More
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="img-box">
                                            <img src="images/slider-img.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="carousel-item">
                            <div class="container ">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="detail-box">
                                            <h1>
                                                second
                                            </h1>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste quam velit saepe dolorem deserunt quo quidem ad optio.
                                            </p>
                                            <a href="">
                                                Read More
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="img-box">
                                            <img src="images/slider-img.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="carousel_btn_box">
                        <a class="carousel-control-prev" href="#customCarousel1" role="button" data-slide="prev">
                            <i class="fa fa-angle-left" aria-hidden="true"></i>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#customCarousel1" role="button" data-slide="next">
                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </section>
            <!-- end slider section -->
        </div>







        <!-- product section -->

        <jsp:include page="include/product_include.jsp"/>

        <!-- end product section -->






        <!-- why us section -->

        <section class="why_us_section layout_padding">
            <div class="container">
                <div class="heading_container heading_center">
                    <h2>
                        Why Choose Us
                    </h2>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="box ">
                            <div class="img-box">
                                <img src="images/w1.png" alt="">
                            </div>
                            <div class="detail-box">
                                <h5>
                                    Fast Delivery
                                </h5>
                                <p>
                                    variations of passages of Lorem Ipsum available
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="box ">
                            <div class="img-box">
                                <img src="images/w2.png" alt="">
                            </div>
                            <div class="detail-box">
                                <h5>
                                    Free Shiping
                                </h5>
                                <p>
                                    variations of passages of Lorem Ipsum available
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="box ">
                            <div class="img-box">
                                <img src="images/w3.png" alt="">
                            </div>
                            <div class="detail-box">
                                <h5>
                                    Best Quality
                                </h5>
                                <p>
                                    variations of passages of Lorem Ipsum available
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- end why us section -->

        <!--notibox-->
        <c:if test="${NOTIBOX}">
            <jsp:include page="include/noti-box.jsp" />
        </c:if>
        <!--notibox end-->

        <!-- footer section -->
        <jsp:include page="include/footer.jsp"/>
        <!-- footer section -->

        <!-- jQery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>


    </body>

</html>
