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
import java.util.List;

public class Order {

    private int orderId;
    private int accountId;
    private double total;
    private int status;
    private Date create;
    private Date update;

    //constructor
    public Order(int orderId, int accountId, double total, int status, Date create, Date update) {
        this.orderId = orderId;
        this.accountId = accountId;
        this.total = total;
        this.status = status;
        this.create = create;
        this.update = update;
    }

    public Order() {
    }
    // Các getter và setter

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }

    public Date getUpdate() {
        return update;
    }

    public void setUpdate(Date update) {
        this.update = update;
    }

}
