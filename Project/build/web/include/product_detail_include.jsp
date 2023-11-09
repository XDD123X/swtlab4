
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>product full detail - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">




        <style type="text/css">
            body{
                background:#eee;
            }


            .product-content {
                border: 1px solid #dfe5e9;
                margin-bottom: 20px;
                margin-top: 12px;
                background: #fff
            }

            .product-content .carousel-control.left {
                margin-left: 0
            }

            .product-content .product-image {
                background-color: #fff;
                display: block;
                min-height: 238px;
                overflow: hidden;
                position: relative
            }

            .product-content .product-deatil {
                border-bottom: 1px solid #dfe5e9;
                padding-bottom: 17px;
                padding-left: 16px;
                padding-top: 16px;
                position: relative;
                background: #fff
            }

            .product-content .product-deatil h5 a {
                color: #2f383d;
                font-size: 15px;
                line-height: 19px;
                text-decoration: none;
                padding-left: 0;
                margin-left: 0
            }

            .product-content .product-deatil h5 a span {
                color: #9aa7af;
                display: block;
                font-size: 13px
            }

            .product-content .product-deatil span.tag1 {
                border-radius: 50%;
                color: #fff;
                font-size: 15px;
                height: 50px;
                padding: 13px 0;
                position: absolute;
                right: 10px;
                text-align: center;
                top: 10px;
                width: 50px
            }

            .product-content .product-deatil span.sale {
                background-color: #21c2f8
            }

            .product-content .product-deatil span.discount {
                background-color: #71e134
            }

            .product-content .product-deatil span.hot {
                background-color: #fa9442
            }

            .product-content .description {
                font-size: 12.5px;
                line-height: 20px;
                padding: 10px 14px 16px 19px;
                background: #fff
            }

            .product-content .product-info {
                padding: 11px 19px 10px 20px
            }

            .product-content .product-info a.add-to-cart {
                color: #2f383d;
                font-size: 13px;
                padding-left: 16px
            }

            .product-content name.a {
                padding: 5px 10px;
                margin-left: 16px
            }

            .product-info.smart-form .btn {
                padding: 6px 12px;
                margin-left: 12px;
                margin-top: -10px
            }

            .product-entry .product-deatil {
                border-bottom: 1px solid #dfe5e9;
                padding-bottom: 17px;
                padding-left: 16px;
                padding-top: 16px;
                position: relative
            }

            .product-entry .product-deatil h5 a {
                color: #2f383d;
                font-size: 15px;
                line-height: 19px;
                text-decoration: none
            }

            .product-entry .product-deatil h5 a span {
                color: #9aa7af;
                display: block;
                font-size: 13px
            }

            .load-more-btn {
                background-color: #21c2f8;
                border-bottom: 2px solid #037ca5;
                border-radius: 2px;
                border-top: 2px solid #0cf;
                margin-top: 20px;
                padding: 9px 0;
                width: 100%
            }

            .product-block .product-deatil p.price-container span,
            .product-content .product-deatil p.price-container span,
            .product-entry .product-deatil p.price-container span,
            .shipping table tbody tr td p.price-container span,
            .shopping-items table tbody tr td p.price-container span {
                color: #21c2f8;
                font-family: Lato, sans-serif;
                font-size: 24px;
                line-height: 20px
            }

            .product-info.smart-form .rating label {
                margin-top: 0
            }

            .product-wrap .product-image span.tag2 {
                position: absolute;
                top: 10px;
                right: 10px;
                width: 36px;
                height: 36px;
                border-radius: 50%;
                padding: 10px 0;
                color: #fff;
                font-size: 11px;
                text-align: center
            }

            .product-wrap .product-image span.sale {
                background-color: #57889c
            }

            .product-wrap .product-image span.hot {
                background-color: #a90329
            }

            .shop-btn {
                position: relative
            }

            .shop-btn>span {
                background: #a90329;
                display: inline-block;
                font-size: 10px;
                box-shadow: inset 1px 1px 0 rgba(0, 0, 0, .1), inset 0 -1px 0 rgba(0, 0, 0, .07);
                font-weight: 700;
                border-radius: 50%;
                padding: 2px 4px 3px!important;
                text-align: center;
                line-height: normal;
                width: 19px;
                top: -7px;
                left: -7px
            }

            .description-tabs {
                padding: 30px 0 5px!important
            }

            .description-tabs .tab-content {
                padding: 10px 0
            }

            .product-deatil {
                padding: 30px 30px 50px
            }

            .product-deatil hr+.description-tabs {
                padding: 0 0 5px!important
            }

            .product-deatil .carousel-control.left,
            .product-deatil .carousel-control.right {
                background: none!important
            }

            .product-deatil .glyphicon {
                color: #3276b1
            }

            .product-deatil .product-image {
                border-right: none!important
            }

            .product-deatil .name {
                margin-top: 0;
                margin-bottom: 0
            }

            .product-deatil .name small {
                display: block
            }

            .product-deatil .name a {
                margin-left: 0
            }

            .product-deatil .price-container {
                font-size: 24px;
                margin: 0;
                font-weight: 300
            }

            .product-deatil .price-container small {
                font-size: 12px
            }

            .product-deatil .fa-2x {
                font-size: 16px!important
            }

            .product-deatil .fa-2x>h5 {
                font-size: 12px;
                margin: 0
            }

            .product-deatil .fa-2x+a,
            .product-deatil .fa-2x+a+a {
                font-size: 13px
            }

            .profile-message ul {
                list-style: none ;
            }

            .product-deatil .certified {
                margin-top: 10px
            }

            .product-deatil .certified ul {
                padding-left: 0
            }

            .product-deatil .certified ul li:not(first-child) {
                margin-left: -3px
            }

            .product-deatil .certified ul li {
                display: inline-block;
                background-color: #f9f9f9;
                border: 1px solid #ccc;
                padding: 13px 19px
            }

            .product-deatil .certified ul li:first-child {
                border-right: none
            }

            .product-deatil .certified ul li a {
                text-align: left;
                font-size: 12px;
                color: #6d7a83;
                line-height: 16px;
                text-decoration: none
            }

            .product-deatil .certified ul li a span {
                display: block;
                color: #21c2f8;
                font-size: 13px;
                font-weight: 700;
                text-align: center
            }

            .product-deatil .message-text {
                width: calc(100% - 70px)
            }

            @media only screen and (min-width:1024px) {
                .product-content div[class*=col-md-4] {
                    padding-right: 0
                }
                .product-content div[class*=col-md-8] {
                    padding: 0 13px 0 0
                }
                .product-wrap div[class*=col-md-5] {
                    padding-right: 0
                }
                .product-wrap div[class*=col-md-7] {
                    padding: 0 13px 0 0
                }
                .product-content .product-image {
                    border-right: 1px solid #dfe5e9
                }
                .product-content .product-info {
                    position: relative
                }
            }

            .message img.online {
                width:40px;
                height:40px;
            }
        </style>
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
        <div class="container">

            <div class="product-content product-wrap clearfix product-deatil">
                <div class="row">
                    <div class="col-md-5 col-sm-12 col-xs-12">
                        <div class="product-image">
                            <div id="myCarousel-2" class="carousel slide">
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel-2" data-slide-to="0" class></li>
                                    <li data-target="#myCarousel-2" data-slide-to="1" class="active"></li>
                                    <li data-target="#myCarousel-2" data-slide-to="2" class></li>
                                </ol>
                                <div class="carousel-inner">

                                    <div class="item active" >
                                        <img src="images/${PRODUCT.image}" alt style="display: block; margin: auto; background-color: rgba(248,248,248,255); padding: 50px; border: 1px solid rgba(0, 0, 0, 0.2);"/>
                                    </div>

                                    <div class="item">
                                        <img src="images/${PRODUCT.image}" alt style="display: block; margin: auto; background-color: rgba(248,248,248,255); padding: 50px; border: 1px solid rgba(0, 0, 0, 0.2);"/>
                                    </div>

                                    <div class="item">
                                        <img src="images/${PRODUCT.image}"  alt style="display: block; margin: auto; background-color: rgba(248,248,248,255); padding: 50px; border: 1px solid rgba(0, 0, 0, 0.2);"/>
                                    </div>

                                </div>
                                <a class="left carousel-control" href="#myCarousel-2" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a>
                                <a class="right carousel-control" href="#myCarousel-2" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-md-offset-1 col-sm-12 col-xs-12">
                        <h2 class="name">
                            ${PRODUCT.name}
                            <small style="margin-top: 20px; font-size: 15px;"> Type:
                                <a href="javascript:void(0);">
                                    <a href="javascript:void(0);">${PRODUCT.categoryName}</a>
                                </a>
                            </small>
                            <small style="margin-top: 20px; font-size: 15px;"> Product by 
                                <a href="javascript:void(0);">
                                    <c:forEach var="seller" items="${SELLER_LIST}">
                                        <c:if test="${seller.accountId eq PRODUCT.uploadBy}">
                                            <a href="javascript:void(0);">${seller.name}</a>
                                        </c:if>
                                    </c:forEach>
                                </a>
                            </small>
                            <small style="margin-top: 20px; margin-bottom: 80px; font-size: 15px;"> Remaining Quantity:
                                    <strong style="color: black;">${PRODUCT.quantity} Product(s)</strong> 
                            </small>
                            <c:forEach var="i" begin="1" end="${PRODUCT.rate}">
                                <i class="fa fa-star fa-2x text-primary"></i>
                            </c:forEach>
                            <c:forEach var="i" begin="1" end="${5 - PRODUCT.rate}">
                                <i class="fa fa-star fa-2x text-muted"></i>
                            </c:forEach>

                            <span class="fa fa-2x"><h5>(${COMMENT_NUMBER}) Votes</h5></span>
                            <a href="javascript:void(0);" onclick="redirectToReviews()">${COMMENT_NUMBER} customer reviews</a>
                        </h2>
                        <hr/>
                        <h3 class="price-container">
                            $${PRODUCT.price}
                            <small>*includes tax</small>
                        </h3>
                        <div class="certified">
                            <ul>
                                <li>
                                    <a href="javascript:void(0);">Delivery time<span>3-5 Working Days</span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">Certified
                                        <c:choose>
                                            <c:when test="${PRODUCT.status == 0}">
                                                <span style="color: red;">Denied</span>
                                            </c:when>
                                            <c:when test="${PRODUCT.status == 1}">
                                                <span style="color: green;">Approved by Manager</span>
                                            </c:when>
                                            <c:when test="${PRODUCT.status == 2}">
                                                <span style="color: darkorange;">Wait For Approval</span>
                                            </c:when>
                                        </c:choose>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <hr/>
                        <div class="description description-tabs">
                            <ul id="myTab" class="nav nav-pills">
                                <li class="active"><a href="#more-information" data-toggle="tab" class="no-margin">Product Description </a></li>
                                <li class><a href="#specifications" data-toggle="tab">Specifications</a></li>
                                <li class><a href="#reviews" data-toggle="tab">Reviews</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane fade active in" id="more-information">
                                    <br/>
                                    <strong>Product Description</strong>
                                    <p>
                                        ${PRODUCT.detail}
                                    </p>
                                </div>
                                <div class="tab-pane fade" id="specifications">
                                    <br/>
                                    <dl class>
                                        <dt>Product By </dt>
                                        <c:forEach var="seller" items="${SELLER_LIST}">
                                            <c:if test="${seller.accountId eq PRODUCT.uploadBy}">
                                                <dd>Seller ID: ${seller.accountId}</dd>
                                                <dd>Seller Name: ${seller.name}</dd>
                                            </c:if>
                                        </c:forEach>

                                        <br/>
                                        <dt>Product Type</dt>
                                        <dd>Type ID: ${PRODUCT.categoryId}</dd>
                                        <dd>Type Name: ${PRODUCT.categoryName}</dd>
                                        <br/>

                                    </dl>
                                </div>
                                <div class="tab-pane fade" id="reviews">
                                    <br/>


                                    <form method="post" action="Comment" class="well padding-bottom-10" >
                                        <textarea rows="4" name="txtComment" class="form-control" placeholder="Write a review"></textarea>
                                        <div class="margin-top-10">
                                            <button type="submit" class="btn btn-sm btn-primary pull-right">
                                                Submit Review
                                            </button>
                                            <a href="javascript:void(0);" class="btn btn-link profile-link-btn" rel="tooltip" data-placement="bottom" title data-original-title="Add File"></a>
                                            <strong class="pull-left">Rate:</strong>
                                            <select name="txtRate" class="btn btn-sm btn-primary pull-left" required>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                            <input type="hidden" name="txtProductID" value="${PRODUCT.productId}">
                                            
                                        </div>
                                    </form>


                                    <div class="chat-body no-padding profile-message">
                                        <ul>


                                            <c:forEach var="comment" items="${COMMENT_LIST}">
                                                <li class="message">
                                                    <img src="./images/user.png" class="online" style="margin-right: 20px;"/>
                                                    <span class="message-text">
                                                        <a href="javascript:void(0);" class="username" >

                                                            <c:forEach var="account" items="${ACCOUNT_LIST}">
                                                                <c:if test="${comment.account_id eq account.accountId}">
                                                                    ${account.name}
                                                                </c:if>
                                                            </c:forEach>

                                                            <span class="badge" style="background-color: green; margin-left: 10px;">Purchase Verified</span>
                                                            <span class="pull-right">
                                                                <c:forEach var="i" begin="1" end="${comment.rate}">
                                                                    <i class="fa fa-star fa-2x text-primary"></i>
                                                                </c:forEach>
                                                                <c:forEach var="i" begin="1" end="${5 - comment.rate}">
                                                                    <i class="fa fa-star fa-2x text-muted"></i>
                                                                </c:forEach>
                                                            </span>
                                                        </a>
                                                        <br/>  <label style="margin-left: 63px; font-weight: lighter; margin-top: 10px;">${comment.comment}</label>
                                                    </span>
                                                    <ul class="list-inline font-xs">
                                                        <li style="margin-bottom: 20px;">

                                                        </li>
                                                        <li class="pull-right">
                                                            <small class="text-muted pull-right ultra-light"> Posted: ${comment.create}</small>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </c:forEach>


                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr/>
                        <div class="row">
                            <div class="col-sm-12 col-md-6 col-lg-6">

                                <form action="add-to-cart" method="POST">
                                    <input style="box-sizing: border-box; display: block; width: 63%;border-width: 1px;border-style: solid;padding: 10px;outline: 0;font-family: inherit;font-size: 0.95em;" 
                                           type="number" name="p_quantity" placeholder="Enter Quantity" value="1" min="1" max="${PRODUCT.quantity}" step="1" required>

                                    <input type="hidden" name="currentURL" value="product-detail" />
                                    <input type="hidden" name="product_id" value="${PRODUCT.productId}">

                                    <input type="submit" class="btn btn-success btn-lg" value="ADD TO CART" >
                                </form>

                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <div class="btn-group pull-right">
                                    <!--<button class="btn btn-white btn-default"><i class="fa fa-star"></i> Add to wishlist</button>-->
                                    <!--<button class="btn btn-white btn-default"><i class="fa fa-envelope"></i> Contact Seller</button>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script type="text/javascript">
        </script>

        <script>
            function redirectToReviews() {
                var targetTab = document.querySelector('a[href="#reviews"]');
                if (targetTab) {
                    targetTab.click(); // Kích hoạt sự kiện click để hiển thị tab Reviews
                }
            }
        </script>


    </body>
</html>
