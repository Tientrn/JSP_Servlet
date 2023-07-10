/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Date;

public class Order {

    private int order_id;
    private Date order_date;
    private String userID;
    private double totalmoney;

    public Order() {
    }

    public Order(int order_id, Date order_date, String userID, double totalmoney) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.userID = userID;
        this.totalmoney=totalmoney;

    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }

}
