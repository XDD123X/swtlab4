<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>Sign In and Sign Up Page - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                background:#F0F8FF;
            }
            .card {
                margin-bottom: 1.5rem;
                box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
            }
            .card {
                position: relative;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-direction: column;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid #e5e9f2;
                border-radius: .2rem;
            }
            .card-header:first-child {
                border-radius: calc(.2rem - 1px) calc(.2rem - 1px) 0 0;
            }
            .card-header {
                border-bottom-width: 1px;
            }
            .card-header {
                padding: .75rem 1.25rem;
                margin-bottom: 0;
                color: inherit;
                background-color: #fff;
                border-bottom: 1px solid #e5e9f2;
            }

        </style>
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

        <div class="container p-0">
            <h1 class="h3 mb-3" style="margin: 20px 0px; text-align: center;">Administrator</h1>
            <div class="row">
                <div class="col-md-5 col-xl-4">

                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Manager</h5>
                        </div>

                        <div class="list-group list-group-flush" role="tablist">
                            <a class="list-group-item list-group-item-action active" data-toggle="list" href="#account" role="tab">
                                Account Manager
                            </a>
                            <a class="list-group-item list-group-item-action" data-toggle="list" href="#product" role="tab">
                                Product Manager
                            </a>
                            <a class="list-group-item list-group-item-action" data-toggle="list" href="#comment" role="tab">
                                Comment Manager
                            </a>

                            <a class="list-group-item list-group-item-action" style="font-weight: bold; color: red; " href="Logout" role="tab">
                                Logout
                            </a>
                        </div>
                    </div>
                </div>





                <div class="col-md-7 col-xl-8">
                    <div class="tab-content">

                        <!--contetn sonze-->
                        <div class="tab-pane fade show active" id="account" role="tabpanel">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Account Information</h5>
                                </div>
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Users</span><small class="px-1">Be a wise leader</small></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10px;">
                                                            Status
                                                        </th>
                                                        <th>ID</th>
                                                        <th class="max-width">Name</th>
                                                        <th class="sortable">Date</th>
                                                        <th>Role</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:forEach var="account" items="${ACCOUNT_LIST}">
                                                        <tr>
                                                            <td class="align-middle">
                                                                <div class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0 align-top" >

                                                                    <c:if test="${account.status eq 1}">
                                                                        <i class="fa fa-fw text-secondary cursor-pointer fa-toggle-on" ></i>
                                                                    </c:if>
                                                                    <c:if test="${account.status eq 0}">
                                                                        <i class="fa fa-fw text-secondary cursor-pointer fa-toggle-off"></i>
                                                                    </c:if>
                                                                    <c:if test="${account.status eq 3}">
                                                                        <i class="fa fa-fw text-secondary cursor-pointer fa-toggle-off"></i>
                                                                    </c:if>

                                                                </div>
                                                            </td>
                                                            <td class="align-middle text-center">
                                                                ACC_0${account.accountId}
                                                            </td>
                                                            <td class="text-nowrap align-middle">${account.name}</td>
                                                            <td class="text-nowrap align-middle"><span>${account.createdAt}</span></td>
                                                            <td class="text-center align-middle">
                                                                <c:if test="${account.role eq 1}">
                                                                    <label style="color: green;">Customer</label>
                                                                </c:if>
                                                                <c:if test="${account.role eq 2}">
                                                                    <label style="color: darkgreengreen;">VIP</label>
                                                                </c:if>
                                                                <c:if test="${account.role eq 3}">
                                                                    <label style="color: darkblueblue;">SELLER</label>
                                                                </c:if>
                                                                <c:if test="${account.role eq 4}">
                                                                    <label style="color: darkorange;">Manager</label>
                                                                </c:if>
                                                                <c:if test="${account.role eq 5}">
                                                                    <label style="color: red;">Customer</label>
                                                                </c:if>

                                                            </td>
                                                            <td class="text-center align-middle">
                                                                <div class="btn-group align-top">
                                                                    <button class="btn btn-sm btn-outline-secondary badge edit-button" type="button" data-value="${ACCOUNT.accountId}" data-toggle="modal" data-target="#user-form-modal">Edit</button>
                                                                    <button class="btn btn-sm btn-outline-secondary badge" type="button"><i class="fa fa-trash"></i></button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>                                                             

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-3 mb-3" style="padding: 0px;">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="text-center px-xl-3">
                                            <button class="btn btn-success btn-block" type="button" data-toggle="modal" data-target="#user-form-modal">New User</button>
                                        </div>
                                        <hr class="my-3">
                                        <div class="e-navlist e-navlist--active-bold">
                                            <ul class="nav">
                                                <c:set var="ACCOUNT_LIST_SIZE" value="${fn:length(ACCOUNT_LIST)}" />
                                                <li class="nav-item active"><span>Total account: ${ACCOUNT_LIST_SIZE}</span></li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>





                        <div class="tab-pane fade" id="product" role="tabpanel">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Product Information</h5>
                                </div>
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Product</span><small class="px-1">Be a wise leader</small></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10px;">
                                                            Status
                                                        </th>
                                                        <th>Product ID</th>
                                                        <th class="max-width">Category ID</th>
                                                        <th class="sortable">Date</th>
                                                        <th>Updaload by</th>
                                                        <th>Rate</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:forEach var="product" items="${PRODUCT_LIST}">
                                                        <tr>
                                                            <td class="align-middle">
                                                                <div class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0 align-top" >

                                                                    <c:if test="${product.status eq 1}">
                                                                        <i class="fa fa-fw text-secondary cursor-pointer fa-toggle-on" ></i>
                                                                    </c:if>
                                                                    <c:if test="${product.status eq 0}">
                                                                        <i class="fa fa-fw text-secondary cursor-pointer fa-toggle-off"></i>
                                                                    </c:if>
                                                                    <c:if test="${product.status eq 3}">
                                                                        <i class="fa fa-fw text-secondary cursor-pointer fa-toggle-off"></i>
                                                                    </c:if>

                                                                </div>
                                                            </td>
                                                            <td class="align-middle text-center">
                                                                PRD_0${product.productId}
                                                            </td>
                                                            <td class="text-nowrap align-middle">${product.categoryId}</td>
                                                            <td class="text-nowrap align-middle"><span>${product.createdAt}</span></td>
                                                            <td class="text-center align-middle">
                                                                ${product.rate}

                                                            </td>
                                                            <td class="text-center align-middle">
                                                                <div class="btn-group align-top">
                                                                    <button class="btn btn-sm btn-outline-secondary badge" type="button" data-toggle="modal" data-target="#user-form-modal">Edit</button>
                                                                    <button class="btn btn-sm btn-outline-secondary badge" type="button"><i class="fa fa-trash"></i></button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>                                                             

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>




                        <!--comment-->
                        <div class="tab-pane fade" id="comment" role="tabpanel">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Comment Information</h5>
                                </div>
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Product</span><small class="px-1">Be a wise leader</small></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10px;">
                                                            Status
                                                        </th>
                                                        <th>Comment ID</th>
                                                        <th class="max-width">Account ID</th>
                                                        <th class="sortable">Product ID</th>
                                                        <th>Comment</th>
                                                        <th>Rate</th>
                                                        <th>Date</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:forEach var="comment" items="${COMMENT_LIST}">
                                                        <tr>
                                                            <td class="align-middle">
                                                                <div class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0 align-top" >

                                                                    <c:if test="${comment.status eq true}">
                                                                        <i class="fa fa-fw text-secondary cursor-pointer fa-toggle-on" ></i>
                                                                    </c:if>
                                                                    <c:if test="${comment.status eq false}">
                                                                        <i class="fa fa-fw text-secondary cursor-pointer fa-toggle-off"></i>
                                                                    </c:if>

                                                                </div>
                                                            </td>
                                                            <td class="align-middle text-center">
                                                                PRD_0${comment.comment_id}
                                                            </td>
                                                            <td class="text-nowrap align-middle">${comment.account_id}</td>
                                                            <td class="text-nowrap align-middle">${comment.product_id}</td>
                                                            <td class="text-nowrap align-middle"><span>${comment.comment}</span></td>
                                                            <td class="text-center align-middle">
                                                                ${comment.rate}

                                                            </td>
                                                            <td class="text-center align-middle">
                                                                ${comment.create}

                                                            </td>
                                                            <td class="text-center align-middle">
                                                                <div class="btn-group align-top">
                                                                    <button class="btn btn-sm btn-outline-secondary badge edit-button" type="button" data-value="${ACCOUNT.accountId}" data-toggle="modal" data-target="#user-form-modal">Edit</button>
                                                                    <button class="btn btn-sm btn-outline-secondary badge" type="button"><i class="fa fa-trash"></i></button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>                                                             

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!--shop manager-->
                        <div class="tab-pane fade" id="yourproduct" role="tabpanel">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Shop Product List Manager</h5>

                                    <table border="1" style="text-align: center;">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Type</th>
                                                <th>Name</th>
                                                <th>Detail</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Rate</th>
                                                <th>Image</th>
                                                <th>Created</th>
                                                <th>Updated</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${SELLER_PRODUCT_LIST}">
                                                <tr>
                                                    <td> ${product.productId}  </td>
                                                    <td> ${product.categoryId}  </td>
                                                    <td> ${product.name}  </td>
                                                    <td> ${product.detail}  </td>
                                                    <td> ${product.quantity}  </td>
                                                    <td> $${product.price}  </td>
                                                    <td> ${product.rate}  </td>
                                                    <td> <img src="images/${product.image}" alt="" style="width: 100px; height: 100px;">  </td>
                                                    <td> ${product.createdAt}  </td>
                                                    <td> ${product.updatedAt}  </td>
                                                    <td> 
                                                        <c:if test="${product.status eq 1}">
                                                            <label style="color: green">actived</label>
                                                        </c:if>
                                                        <c:if test="${product.status eq 0}">
                                                            <label style="color: red">deactived</label>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>


                                </div>
                            </div>
                        </div>

                    </div>


                </div>
            </div>
        </div>

    </div>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">

    </script>

</body>
</html>