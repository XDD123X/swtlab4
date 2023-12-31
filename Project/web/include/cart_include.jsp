<%-- 
    Document   : cart_include
    Created on : Jul 17, 2023, 3:32:36 AM
    Author     : duchi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>bs4 cart - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                background:#eee;
            }
            .ui-w-40 {
                width: 40px !important;
                height: auto;
            }

            .card{
                box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
            }

            .ui-product-color {
                display: inline-block;
                overflow: hidden;
                margin: .144em;
                width: .875rem;
                height: .875rem;
                border-radius: 10rem;
                -webkit-box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
                box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <div class="container px-3 my-5 clearfix">

            <form action="Checkout" method="POST">
                <div class="card">
                    <div class="card-header">
                        <h2>Shopping Cart</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered m-0">
                                <thead>
                                    <tr>

                                        <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name &amp; Details</th>
                                        <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                                        <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                                        <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                                        <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title data-original-title="Clear cart"><i class="ino ion-md-trash"></i></a></th>
                                    </tr>
                                </thead>
                                <tbody>


                                    <c:forEach var="product" items="${CART_LIST}">
                                        <tr>
                                            <td class="p-4">
                                                <div class="media align-items-center">
                                                    <img src="images/${product.image}" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                                                    <div class="media-body">
                                                        <a href="Product-detail?productID=${product.productId}" target="_blank" class="d-block text-dark"> ${product.name} </a>
                                                        <small>
                                                            <span class="text-muted">Type:</span> ${product.categoryName} &nbsp;
                                                        </small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-right font-weight-semibold align-middle p-4">$${product.price}</td>
                                            <td class="align-middle p-4"><input type="text" class="form-control text-center" value="${product.quantity}" readonly=""></td>
                                            <td class="text-right font-weight-semibold align-middle p-4">$${product.price * product.quantity}</td>
                                            <td class="text-center align-middle px-0"><a href="Remove-cart-item?productId=${product.productId}" class="shop-tooltip close float-none text-danger" title data-original-title="Remove">×</a></td>
                                        </tr>
                                </c:forEach>


                                </tbody>
                            </table>
                        </div>

                        <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                            <div class="mt-4">
                                <label class="text-muted font-weight-normal">Promocode</label>
                                <input type="text" placeholder="Unavailable" class="form-control" readonly>
                            </div>
                            <div class="d-flex">
                                <div class="text-right mt-4 mr-5">
                                    <label class="text-muted font-weight-normal m-0">Discount</label>
                                    <div class="text-large"><strong>$0  </strong></div>
                                </div>
                                <div class="text-right mt-4">
                                    <label class="text-muted font-weight-normal m-0">Total price</label>
                                    <div class="text-large"><strong>
                                            <c:set var="total" value="0" />
                                            <c:forEach var="product" items="${CART_LIST}">
                                                <c:set var="total" value="${total + product.quantity * product.price}" />
                                            </c:forEach>
                                            <c:out value="${total}" />
                                        </strong></div>
                                </div>
                            </div>
                        </div>
                        <div class="float-right">

                            <input type="hidden" name="txtAccountID" value="${Account.account_id}">
                            <input type="hidden" name="txtTotal" value="${total}">


                            <a href="Home" type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">Back to shopping</a>
                            <input type="submit" name="action" class="btn btn-lg btn-primary mt-2" value="Checkout" >
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>
