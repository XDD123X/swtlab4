/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;

/**
 *
 * @author duchi
 */
public class Comment {

    private int product_id;
    private int account_id;
    private int comment_id;
    private String comment;
    private int rate;
    private boolean status;
    private Date create;

    //constructor
    public Comment() {
    }

    public Comment(int product_id, int account_id, int comment_id, String comment, int rate, boolean status, Date create) {
        this.product_id = product_id;
        this.account_id = account_id;
        this.comment_id = comment_id;
        this.comment = comment;
        this.rate = rate;
        this.status = status;
        this.create = create;
    }

    //getter and setter
    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }

}
