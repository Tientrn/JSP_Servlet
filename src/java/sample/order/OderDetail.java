/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

/**
 *
 * @author HP
 */
public class OderDetail {
    private int orderDetail_id;
    private int price;
    private int quantity;
    private int product_id;
    private int oder_id;

    public OderDetail() {
    }

    public OderDetail(int orderDetail_id, int price, int quantity, int product_id, int oder_id) {
        this.orderDetail_id = orderDetail_id;
        this.price = price;
        this.quantity = quantity;
        this.product_id = product_id;
        this.oder_id = oder_id;
    }

    public int getOrderDetail_id() {
        return orderDetail_id;
    }

    public void setOrderDetail_id(int orderDetail_id) {
        this.orderDetail_id = orderDetail_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getOder_id() {
        return oder_id;
    }

    public void setOder_id(int oder_id) {
        this.oder_id = oder_id;
    }
}
