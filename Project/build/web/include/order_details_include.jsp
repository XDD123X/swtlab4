<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>Order Detail ID ${order.orderId}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                background:#eee;
            }
            .card {
                box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: 1rem;
            }
            .text-reset {
                --bs-text-opacity: 1;
                color: inherit!important;
            }
            a {
                color: #5465ff;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="container">

                <div class="d-flex justify-content-between align-items-center py-3">
                    <h2 class="h5 mb-0"><a href="#" class="text-muted"></a> Order #${order.orderId}</h2>
                </div>

                <div class="row">
                    <div class="col-lg-8">

                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="mb-3 d-flex justify-content-between">
                                    <div>
                                        <span class="me-3">${order.create}</span>
                                        <c:choose>
                                            <c:when test="${order.status == 0}">
                                                <span class="badge rounded-pill bg-info">CANCELED</span>
                                            </c:when>
                                            <c:when test="${order.status == 1}">
                                                <span class="badge rounded-pill bg-info">SHIPPING</span>
                                            </c:when>
                                            <c:when test="${order.status == 2}">
                                                <span class="badge rounded-pill bg-info">PENDING</span>
                                            </c:when>
                                            <c:when test="${order.status == 3}">
                                                <span class="badge rounded-pill bg-info">FINISHED</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge rounded-pill bg-info">UPDATING...</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                </div>
                                <table class="table table-borderless">


                                    <c:forEach var="product" items="${order_detail_list}">
                                        <tbody>

                                            <tr>
                                                <td>
                                                    <div class="d-flex mb-2">
                                                        <c:set var="id" value="${product.productId}" />
                                                        <c:forEach var="p" items="${PRODUCT}">
                                                            <c:if test="${p.productId eq id}">
                                                                <div class="flex-shrink-0">
                                                            <img src="images/${p.image}" alt width="35" class="img-fluid">
                                                        </div>
                                                            </c:if>
                                                        </c:forEach>
                                                        
                                                        <div class="flex-lg-grow-1 ms-3">

                                                            <c:forEach var="p" items="${PRODUCT}">
                                                                <c:if test="${p.productId eq id}">
                                                                    <h6 class="small mb-0"><a href="Product-detail?productID=${p.productId}" > ${p.name} </a></h6>
                                                                    <span class="small">${p.categoryName}</span>
                                                                </c:if>
                                                            </c:forEach>


                                                        </div>
                                                    </div>
                                                </td>
                                                <td>${product.quantity}</td>
                                                <td class="text-end">$${product.amount}</td>
                                            </tr>

                                        </tbody>
                                    </c:forEach>

                                    <tfoot>
                                        <tr>
                                            <td colspan="2">Subtotal</td>
                                            <td class="text-end">$${order.total}</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Shipping</td>
                                            <td class="text-end">$0.00</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Discount (Code: UNAVAILABLE)</td>
                                            <td class="text-danger text-end">-$0.00</td>
                                        </tr>
                                        <tr class="fw-bold">
                                            <td colspan="2">TOTAL</td>
                                            <td class="text-end">$${order.total}</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <h3 class="h6">Payment Method</h3>
                                        <p>Visa -1234 <br>
                                            Total: $${order.total} <span class="badge bg-success rounded-pill">PAID</span></p>
                                    </div>
                                    <div class="col-lg-6">
                                        <h3 class="h6">Billing address</h3>
                                        <address>
                                            <strong>${ACCOUNT.name}</strong><br>
                                            ${ACCOUNT.address}<br>
                                            Phone: ${ACCOUNT.phone} <br/>
                                            Email: ${ACCOUNT.email}
                                        </address>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">

                        <div class="card mb-4">
                            <div class="card-body">
                                <h3 class="h6">Customer Notes</h3>
                                <p>Sed enim, faucibus litora velit vestibulum habitasse. Cras lobortis cum sem aliquet mauris rutrum. Sollicitudin. Morbi, sem tellus vestibulum porttitor.</p>
                            </div>
                        </div>
                        <div class="card mb-4">

                            <div class="card-body">
                                <h3 class="h6">Shipping Information</h3>
                                <strong>Giao Hang Tiet Kiem</strong> <br/>
                                <span><a href="https://i.ghtk.vn/143470588"  class="text-decoration-underline" target="_blank" >143470588</a> <i class="bi bi-box-arrow-up-right"></i> </span>
                                <hr>
                                <h3 class="h6">Address</h3>
                                <address>
                                    <strong>${ACCOUNT.name}</strong><br>
                                    ${ACCOUNT.address}<br>
                                    Phone: ${ACCOUNT.phone} <br/>
                                    Email: ${ACCOUNT.email}
                                </address>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>