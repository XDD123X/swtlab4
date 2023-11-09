<%-- 
    Document   : checkout-include
    Created on : Jul 17, 2023, 2:09:27 PM
    Author     : BlackZ36
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="payment.css">

        <style>
            .payment-form{
                padding-bottom: 50px;
                font-family: 'Montserrat', sans-serif;
            }

            .payment-form.dark{
                background-color: #f6f6f6;
            }

            .payment-form .content{
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
                background-color: white;
            }

            .payment-form .block-heading{
                padding-top: 50px;
                margin-bottom: 40px;
                text-align: center;
            }

            .payment-form .block-heading p{
                text-align: center;
                max-width: 420px;
                margin: auto;
                opacity:0.7;
            }

            .payment-form.dark .block-heading p{
                opacity:0.8;
            }

            .payment-form .block-heading h1,
            .payment-form .block-heading h2,
            .payment-form .block-heading h3 {
                margin-bottom:1.2rem;
                color: #3b99e0;
            }

            .payment-form form{
                border-top: 2px solid #5ea4f3;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
                background-color: #ffffff;
                padding: 0;
                max-width: 600px;
                margin: auto;
            }

            .payment-form .title{
                font-size: 1em;
                border-bottom: 1px solid rgba(0,0,0,0.1);
                margin-bottom: 0.8em;
                font-weight: 600;
                padding-bottom: 8px;
            }

            .payment-form .products{
                background-color: #f7fbff;
                padding: 25px;
            }

            .payment-form .products .item{
                margin-bottom:1em;
            }

            .payment-form .products .item-name{
                font-weight:600;
                font-size: 0.9em;
            }

            .payment-form .products .item-description{
                font-size:0.8em;
                opacity:0.6;
            }

            .payment-form .products .item p{
                margin-bottom:0.2em;
            }

            .payment-form .products .price{
                float: right;
                font-weight: 600;
                font-size: 0.9em;
            }

            .payment-form .products .total{
                border-top: 1px solid rgba(0, 0, 0, 0.1);
                margin-top: 10px;
                padding-top: 19px;
                font-weight: 600;
                line-height: 1;
            }

            .payment-form .card-details{
                padding: 25px 25px 15px;
            }

            .payment-form .card-details label{
                font-size: 12px;
                font-weight: 600;
                margin-bottom: 15px;
                color: #79818a;
                text-transform: uppercase;
            }

            .payment-form .card-details button{
                margin-top: 0.6em;
                padding:12px 0;
                font-weight: 600;
            }

            .payment-form .date-separator{
                margin-left: 10px;
                margin-right: 10px;
                margin-top: 5px;
            }

            @media (min-width: 576px) {
                .payment-form .title {
                    font-size: 1.2em;
                }

                .payment-form .products {
                    padding: 40px;
                }

                .payment-form .products .item-name {
                    font-size: 1em;
                }

                .payment-form .products .price {
                    font-size: 1em;
                }

                .payment-form .card-details {
                    padding: 40px 40px 30px;
                }

                .payment-form .card-details button {
                    margin-top: 2em;
                }
            }
        </style>

    </head>
    <body>
        <main class="page payment-page">
            <section class="payment-form dark">
                <div class="container">
                    <div class="block-heading">
                        <h2>Payment</h2>
                        <p>Please check again all the informations below</p>
                    </div>
                    <form action="Checkout" method="POST">
                        <div class="products">
                            <h3 class="title">Checkout</h3>

                            <c:forEach var="product" items="${CART_LIST}">
                                <div class="item" >
                                    <span class="price" >$${product.price * product.quantity}</span>
                                    <p class="item-name">${product.name}</p>
                                    <p class="item-description">Type: <strong>${product.categoryName}</strong></p>
                                    <p class="item-description">Number of product: <strong>${product.quantity}</strong></p>
                                    <p class="item-description">Price: <strong>$${product.price}</strong></p>
                                    <c:set var="sellerID" value="${product.uploadBy}"/>
                                    <c:forEach var="seller" items="${SELLER_LIST}">
                                        <c:if test="${sellerID == seller.accountId}">
                                            <p class="item-description">Seller: <strong>${seller.name}</strong></p>
                                        </c:if>
                                    </c:forEach>
                                    <img src="images/${product.image}" width="200" alt="" style="border: 1px solid rgba(0, 0, 0, 0.2); margin: 0 auto; display: block; padding: 10px; background-color: rgba(248,248,248,255); margin-right: 0;">
                                    <div style="border-bottom: 1px solid rgba(0,0,0,1); margin: 25px auto; width: 450px;" ></div>
                                </div>
                            </c:forEach>



                            <div class="total">Total<span class="price">$${TOTAL}</span></div>
                        </div>
                        <div class="card-details">
                            <h3 class="title">Shipping Information</h3>
                            <div class="row">
                                <div class="form-group col-sm-7">
                                    <label for="card-holder">Name</label>
                                    <input id="card-holder" type="text" class="form-control" placeholder="${ACCOUNT.name}" aria-label="Card Holder" aria-describedby="basic-addon1" readonly>
                                </div>
                                <div class="form-group col-sm-5">
                                    <label for="">Email Address</label>
                                    <div class="input-group expiration-date">
                                        <input type="text" class="form-control" placeholder="${ACCOUNT.email}" aria-describedby="basic-addon1" readonly>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label for="card-number">Address</label>
                                    <input id="card-number" type="text" class="form-control" placeholder="${ACCOUNT.address}" aria-label="Card Holder" aria-describedby="basic-addon1" readonly>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label for="cvc">Phone Number</label>
                                    <input id="cvc" type="text" class="form-control" placeholder="${ACCOUNT.phone}" aria-label="Card Holder" aria-describedby="basic-addon1" readonly>
                                </div>
                                <div class="form-group col-sm-12">
                                    <button type="submit" name="action" value="proceed" class="btn btn-primary btn-block">Proceed</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
