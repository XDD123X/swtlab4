<%-- 
    Document   : index
    Created on : Jul 15, 2023, 12:49:46 PM
    Author     : duchi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>update my profile - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                color: #9b9ca1;
            }
            .bg-secondary-soft {
                background-color: rgba(208, 212, 217, 0.1) !important;
            }
            .rounded {
                border-radius: 5px !important;
            }
            .py-5 {
                padding-top: 3rem !important;
                padding-bottom: 3rem !important;
            }
            .px-4 {
                padding-right: 1.5rem !important;
                padding-left: 1.5rem !important;
            }
            .file-upload .square {
                height: 250px;
                width: 250px;
                margin: auto;
                vertical-align: middle;
                border: 1px solid #e5dfe4;
                background-color: #fff;
                border-radius: 5px;
            }
            .text-secondary {
                --bs-text-opacity: 1;
                color: rgba(208, 212, 217, 0.5) !important;
            }
            .btn-success-soft {
                color: #28a745;
                background-color: rgba(40, 167, 69, 0.1);
            }
            .btn-danger-soft {
                color: #dc3545;
                background-color: rgba(220, 53, 69, 0.1);
            }
            .form-control {
                display: block;
                width: 100%;
                padding: 0.5rem 1rem;
                font-size: 0.9375rem;
                font-weight: 400;
                line-height: 1.6;
                color: #29292e;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #e5dfe4;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 5px;
                -webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
                transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
            }
        </style>
    </head>
    <body>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
        <div class="container">
            <div class="row">
                <div class="col-12">

                    <div class="my-5">
                        <h3>Product Information Update</h3>
                        <hr>
                    </div>

                    <form class="file-upload" method="POST" action="Update-product">
                        <div class="row mb-5 gx-5">

                            <div class="col-xxl-8 mb-5 mb-xxl-0">
                                <div class="bg-secondary-soft px-4 py-5 rounded">
                                    <div class="row g-3">
                                        <h4 class="mb-4 mt-0">Product detail</h4>

                                        <div class="col-md-5">
                                            <label class="form-label">Product ID</label>
                                            <input type="text" class="form-control" placeholder aria-label="First name" name="txt_product_id" value="${PRODUCT.productId}" readonly>
                                        </div>
                                        <br/>
                                        <div class="col-md-5">
                                            <label class="form-label">Category ID</label>
                                            <input type="text" class="form-control" placeholder aria-label="First name" value="${PRODUCT.categoryId}" readonly>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="col-md-5">
                                            <label class="form-label">Status</label>
                                            <input type="text" class="form-control" placeholder aria-label="First name" value="${PRODUCT.status}" readonly>
                                        </div>
                                        <br/>
                                        <div class="col-md-5">
                                            <label class="form-label">Created At</label>
                                            <input type="text" class="form-control" placeholder aria-label="First name" value="${PRODUCT.createdAt}" readonly>
                                        </div>
                                        <br/>
                                        <div class="col-md-5">
                                            <label class="form-label">Upload ID</label>
                                            <input type="text" class="form-control" placeholder aria-label="First name" value="${PRODUCT.uploadBy}" readonly>
                                        </div>
                                        <br/>
                                        <div class="col-md-5">
                                            <label class="form-label">Product Name</label>
                                            <input type="text" class="form-control" placeholder aria-label="First name" name="txt_product_name" value="${PRODUCT.name}">
                                        </div>
                                        <br/>
                                        <div class="col-md-5">
                                            <label class="form-label">Detail</label>
                                            <input type="text" class="form-control" placeholder aria-label="First name" name="txt_product_detail" value="${PRODUCT.detail}">
                                        </div>
                                        <br/>
                                        <div class="col-md-5">
                                            <label class="form-label">Quantity</label>
                                            <input type="number" class="form-control" min="0" placeholder aria-label="First name" name="txt_product_quantity" value="${PRODUCT.quantity}">
                                        </div>
                                        <br/>
                                        <div class="col-md-5">
                                            <label class="form-label">Price</label>
                                            <input type="text" class="form-control" placeholder aria-label="First name" name="txt_product_price" value="${PRODUCT.price}">
                                        </div>
                                        <br/>
                                        <div class="col-md-5">
                                            <label class="form-label">Last Update</label>
                                            <input type="text" class="form-control" placeholder aria-label="First name" value="${PRODUCT.updatedAt}" readonly>
                                        </div>
                                        <br/>



                                    </div> 
                                </div>
                            </div>

                            <div class="col-xxl-4">
                                <div class="bg-secondary-soft px-4 py-5 rounded">
                                    <div class="row g-3">
                                        <h4 class="mb-4 mt-0">Product</h4>
                                        <div class="text-center">

                                            <div class="square position-relative display-2 mb-3">
                                                <img style="padding-top: 30px;" src="./images/${PRODUCT.image}" width="200" height="200" alt="alt"/>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 


                        <div class="gap-3 d-md-flex justify-content-md-end text-center">
                            <button type="submit" class="btn btn-primary btn-lg">Update profile</button>
                        </div>
                    </form> 
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>