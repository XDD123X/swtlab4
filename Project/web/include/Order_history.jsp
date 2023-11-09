<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>Order history - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                background:#eee;
            }
            .panel-order .row {
                border-bottom: 1px solid #ccc;
            }
            .panel-order .row:last-child {
                border: 0px;
            }
            .panel-order .row .col-md-1  {
                text-align: center;
                padding-top: 15px;
            }
            .panel-order .row .col-md-1 img {
                width: 50px;
                max-height: 50px;
            }
            .panel-order .row .row {
                border-bottom: 0;
            }
            .panel-order .row .col-md-11 {
                border-left: 1px solid #ccc;
            }
            .panel-order .row .row .col-md-12 {
                padding-top: 7px;
                padding-bottom: 7px;
            }
            .panel-order .row .row .col-md-12:last-child {
                font-size: 11px;
                color: #555;
                background: #efefef;
            }
            .panel-order .btn-group {
                margin: 0px;
                padding: 0px;
            }
            .panel-order .panel-body {
                padding-top: 0px;
                padding-bottom: 0px;
            }
            .panel-order .panel-deading {
                margin-bottom: 0;
            }
        </style>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
        <div class="container bootdey">
            <div class="panel panel-default panel-order">
                <div class="panel-heading">
                    <strong>Order history</strong>
                    <div class="btn-group pull-right">
                        <div class="btn-group">
                        </div>
                    </div>
                </div>
                <div class="panel-body">



                    <c:forEach var="order" items="${order_list}">
                        <c:if test="${order.status != 4}">
                            <form action="Order-detail" method="POST">
                                <div class="row">
                                    <div class="col-md-1"><img src="images/task-list.png" alt width="35" class="img-fluid" /></div>
                                    <div class="col-md-11">
                                        <div class="row">
                                            <div class="col-md-12">

                                                <c:choose>
                                                    <c:when test="${order.status == 0}">
                                                        <div class="pull-right"><label class="label label-danger">Canceled</label></div>
                                                    </c:when>
                                                    <c:when test="${order.status == 1}">
                                                        <div class="pull-right"><label class="label label-primary">Shipping</label></div>
                                                    </c:when>
                                                    <c:when test="${order.status == 2}">
                                                        <div class="pull-right"><label class="label label-warning">Pending</label></div>
                                                    </c:when>
                                                    <c:when test="${order.status == 3}">
                                                        <div class="pull-right"><label class="label label-success">Finish</label></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="pull-right"><label class="label label-default">updating...</label></div>
                                                    </c:otherwise>
                                                </c:choose>

                                                <span><strong> #Order ID ${order.orderId}</strong></span> <br/> <br/>
                                                Total: <strong> $${order.total} </strong><br/>

                                                <!-- Input hidden chứa order_id -->
                                                <input type="hidden" name="txtOrderID" value="${order.orderId}">

                                                <!-- Các nút submit -->
                                                <button type="submit" name="action" value="view" data-placement="top" class="btn btn-success btn-xs glyphicon glyphicon-ok" title="View">Detail</button>
                                               <c:if test="${order.status == 2}">
                                                    <button type="submit" name="action" value="cancel" data-placement="top" class="btn btn-danger btn-xs glyphicon" title="Cancel">Cancel</button>
                                                </c:if>
                                                <c:if test="${order.status == 3 || order.status == 0 }">
                                                    <button type="submit" name="action" value="delete" data-placement="top" class="btn btn-danger btn-xs glyphicon" title="Delete">Delete</button>
                                                </c:if>
                                                    <c:if test="${order.status == 1 }">
                                                    <button type="submit" name="action" value="recieved" data-placement="top" class="btn btn-info btn-xs glyphicon " title="Recieved">Recieved</button>
                                                </c:if>
                                            </div>
                                            <div class="col-md-12">order made on: ${order.create} by ID <a href="Account"> ACC_0${order.accountId} </a></div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </c:if>
                    </c:forEach>




                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script type="text/javascript">


        </script>
    </body>
</html>