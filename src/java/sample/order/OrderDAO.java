/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import sample.shopping.Cart;
import sample.shopping.Clothes;
import sample.user.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author HP
 */
public class OrderDAO {

    private static final String INSERTBILL = "INSERT INTO tbl_Order(order_date, userID, totalmoney) values(?,?,?)";
    private static final String INSERTDETAILBILL = "INSERT INTO tbl_OrderDetail(price, quantity, product_id, oder_id) VALUES(?,?,?,?)";
    private static final String SELECTBILLcurrent = "select top 1 order_id from tbl_Order order by order_id desc";

    public static int insertBill(String userID, Cart cart) throws SQLException {
        int kq = 0;
        Connection cn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                cn.setAutoCommit(false);
                ptm = cn.prepareStatement(INSERTBILL);
                Date d = new Date(System.currentTimeMillis());
                double totalmoney = 0;
                for (Clothes clothes : cart.getCart().values()) {
                    totalmoney += clothes.getQuantity() * clothes.getPrice();
                }
                    ptm.setDate(1, d);
                    ptm.setString(2, userID);
                    ptm.setDouble(3, totalmoney);

                    kq = ptm.executeUpdate();
                    if (kq > 0) {
                        ptm = cn.prepareStatement(SELECTBILLcurrent);
                        rs = ptm.executeQuery();

                        if (rs != null && rs.next()) {
                            int order_id = rs.getInt("order_id");
                            if (cart != null && cart.getCart().size() > 0) {
                                for (Clothes obj : cart.getCart().values()) {
                                    String ClothesID = obj.getId();
                                    int quantity = obj.getQuantity();
                                    double price = (double) obj.getPrice();
                                    ptm = cn.prepareStatement(INSERTDETAILBILL);
                                    ptm.setDouble(1, price);
                                    ptm.setInt(2, quantity);
                                    ptm.setString(3, ClothesID);
                                    ptm.setInt(4, order_id);
                                    kq = ptm.executeUpdate();
                                }
                            }
                        }

                    }
                }
            }catch (Exception e) {
            e.printStackTrace();
        }finally {
            cn.commit();
            cn.setAutoCommit(true);

            if (ptm != null) {
                ptm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
            return kq;
        }

    }
