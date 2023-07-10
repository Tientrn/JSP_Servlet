/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

public class ProductDAO {

    private static final String CHECK = "SELECT name, price, quantity FROM tbl_Product WHERE product_id = ?";
    private static final String UPDATE_CHECKOUT = "UPDATE tbl_Product SET quantity = ? where product_id =?";

    public Clothes checkClothesDB(String id) throws SQLException {
        Clothes pro = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(CHECK);
            ptm.setString(1, id);

            //    ptm = conn.prepareStatement(LOGIN);
            rs = ptm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                pro = new Clothes(id, name, price, quantity);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }

        return pro;
    }

    public boolean CheckOutQuantity(Cart cart) throws SQLException {
       boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();

            for (Clothes pro : cart.getCart().values()) {
                String clothesID = pro.getId();
                int quantity = pro.getQuantity();
                Clothes proDB = checkClothesDB(clothesID);
                int CheckOutQuantity = proDB.getQuantity() - quantity;
                
                if (conn != null) {
                    ptm = conn.prepareStatement(UPDATE_CHECKOUT);
                    ptm.setInt(1, CheckOutQuantity);
                    ptm.setString(2, clothesID);
                    check = ptm.executeUpdate() > 0 ? true : false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }

        return check;
    }
    

}
