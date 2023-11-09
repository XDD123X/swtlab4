<%-- 
    Document   : test
    Created on : Jul 15, 2023, 2:44:55 PM
    Author     : duchi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        test page <br/>
        ${a} <br/>
        ${b} <br/>
        ${c} <br/>
        ${d} <br/>
        ${e} <br/>

        ${f} <br/>
        ${g} <br/>
        ${h} <br/>
        ${j} <br/>
        ${k} <br/>

        ${a1} <br/>
        ${b1} <br/>
        ${c1} <br/>
        ${d1} <br/>
        ${e1} <br/>





        <br/> order table:
        <c:forEach var="order" items="${order_list}">
            <table border="1">
                <thead>
                    <tr>
                        <th>order id</th>
                        <th>account id</th>
                        <th>total</th>
                        <th>status</th>
                        <th>created date</th>
                        <th>update date</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.accountId}</td>
                        <td>${order.total}</td>
                        <td>${order.status}</td>
                        <td>${order.create}</td>
                        <td>${order.update}</td>
                    </tr>
                </tbody>
            </table>
        </c:forEach>

        <br/> order_detail_table:
        <c:forEach var="product" items="${order_detail_list}">
            <table border="1">
                <thead>
                    <tr>
                        <th>order detail id</th>
                        <th>order id</th>
                        <th>product id</th>
                        <th>quantity</th>
                        <th>amout</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${product.orderDetailId}</td>
                        <td>${product.orderId}</td>
                        <td>${product.productId}</td>
                        <td>${product.quantity}</td>
                        <td>${product.amount}</td>
                    </tr>
                </tbody>
            </table>
        </c:forEach>

        <br/> cart_list:
        <c:forEach var="product" items="${CART_LIST}">
            <table border="1">
                <thead>
                    <tr>
                        <th>product id</th>
                        <th>name</th>
                        <th>quantity</th>
                        <th>price</th>
                        <th>total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${product.productId}</td>
                        <td>${product.name}</td>
                        <td>${product.quantity}</td>
                        <td>${product.price}</td>
                        <td>${product.price * product.quantity}</td>
                    </tr>
                </tbody>
            </table>

        </c:forEach>

        <br/> product_list:
        <c:forEach var="product" items="${PRODUCT_LIST}">
            <table border="1">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>type id</th>
                        <th>name</th>
                        <th>status</th>
                        <th>create</th>
                        <th>upload</th>
                        <th>rate</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${product.productId}</td>
                        <td>${product.name}</td>
                        <td>${product.categoryId}</td>
                        <td>${product.status}</td>
                        <td>${product.createdAt}</td>
                        <td>${product.uploadBy}</td>
                        <td>${product.rate}</td>
                    </tr>
                </tbody>
            </table>
        </c:forEach>



        <br/>
        <a href="Home">home</a> <br/>


        <!--notibox-->
        <c:if test="${NOTIBOX}">
            <jsp:include page="include/noti-box.jsp" />
        </c:if>
        <!--notibox end-->

    </body>
</html>
