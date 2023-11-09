/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author duchi
 */
import java.util.Date;

import java.util.Date;

public class Product {

    private int productId;
    private int categoryId;
    private int status;
    private Date createdAt;
    private int uploadBy;
    private int rate;

    // Thêm thuộc tính từ bảng product_detail
    private String name;
    private String detail;
    private int quantity;
    private double price;
    private String image;
    private Date updatedAt;

    //them thuoc tinh cua category
    private String categoryName;

    //constructor
    public Product() {
    }

    public Product(int productId, int categoryId, int status, Date createdAt, int uploadBy, int rate, String name, String detail, int quantity, double price, String image, Date updatedAt, String categoryName) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.status = status;
        this.createdAt = createdAt;
        this.uploadBy = uploadBy;
        this.rate = rate;
        this.name = name;
        this.detail = detail;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.updatedAt = updatedAt;
        this.categoryName = categoryName;
    }

    //getter and setter
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getUploadBy() {
        return uploadBy;
    }

    public void setUploadBy(int uploadBy) {
        this.uploadBy = uploadBy;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

}
