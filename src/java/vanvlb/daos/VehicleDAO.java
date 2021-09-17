/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanvlb.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import javax.naming.NamingException;
import vanvlb.dtos.VehicleDTO;
import vanvlb.utils.DBUtil;

/**
 *
 * @author Mon
 */
public class VehicleDAO {

    private List<VehicleDTO> listOfVehicle;

    public List<VehicleDTO> getListOfVehicle() {
        return listOfVehicle;
    }

    public List<VehicleDTO> getListVehicle(String name, boolean statusDefault) throws SQLException {
        List<VehicleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT productID, productName, price, quantity, categoryID, status "
                        + "FROM tblProducts "
                        + "WHERE productName LIKE ? AND status = ?";
                pre = conn.prepareStatement(sql);
                pre.setString(1, "%" + name + "%");
                pre.setBoolean(2, statusDefault);
                rs = pre.executeQuery();
                while (rs.next()) {
                    String proID = rs.getString("productID");
                    String proName = rs.getString("productName");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    int cateID = rs.getInt("categoryID");
                    boolean status = rs.getBoolean("status");
                    if (listOfVehicle == null) {
                        listOfVehicle = new ArrayList<VehicleDTO>();
                    }
                    list.add(new VehicleDTO(proID, proName, price, quantity, cateID, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    VehicleDTO cartItem;

    public VehicleDTO getCartItem() {
        return cartItem;
    }

    public void searchProduct(String id) throws SQLException, NamingException, ClassNotFoundException {
        Connection c = null;
        PreparedStatement p = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            if (c != null) {
                String sql = "SELECT productID, productName, price, quantity, categoryID FROM tblProducts where productID = ?";
                p = c.prepareStatement(sql);
                p.setString(1, id);
                rs = p.executeQuery();
                if (rs.next()) {
                    String proID = rs.getString("productID");
                    String proName = rs.getString("productName");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    int cateID = rs.getInt("categoryID");
                    cartItem = new VehicleDTO(proID, proName, price, quantity, cateID);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (p != null) {
                p.close();
            }
            if (c != null) {

            }
        }
    }

    public int getQuantity(String id) throws NamingException, SQLException, ClassNotFoundException {
        Connection c = null;
        PreparedStatement p = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            if (c != null) {

                String sql = "SELECT quantity FROM tblProducts where productID = ?";
                p = c.prepareStatement(sql);
                p.setString(1, id);
                rs = p.executeQuery();
                if (rs.next()) {
                    return rs.getInt("quantity");
                }
            }
        } finally {
            if (p != null) {
                p.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return -1;
    }

    public boolean insertOrderDetail(int orderID, String productID, float price, int quantity) throws NamingException, SQLException, ClassNotFoundException {
        Connection c = null;
        PreparedStatement p = null;
        try {
            c = DBUtil.getConnection();
            if (c != null) {
                String sql = "INSERT INTO tblOrderDetails (orderID, productID, price, quantity) "
                        + "VALUES (?,?,?,?)";
                p = c.prepareStatement(sql);
                p.setInt(1, orderID);
                p.setString(2, productID);
                p.setFloat(3, price);
                p.setInt(4, quantity);
                int rs = p.executeUpdate();
                c.commit();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (p != null) {
                p.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return false;
    }

    public boolean insertOrder(String userID, String date, float total) throws NamingException, SQLException, ClassNotFoundException {
        Connection c = null;
        PreparedStatement p = null;
        try {
            c = DBUtil.getConnection();
            if (c != null) {
                String sql = "INSERT INTO tblOrders (userID, date, total) "
                        + "VALUES (?,?,?) ";
                p = c.prepareStatement(sql);
                p.setString(1, userID);
                p.setString(2, date);
                p.setFloat(3, total);
                int rs = p.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (p != null) {
                p.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return false;
    }

    public int getOrderID() throws SQLException, NamingException, ClassNotFoundException {
        Connection c = null;
        PreparedStatement p = null;
        ResultSet rs = null;
        try {
            c = DBUtil.getConnection();
            if (c != null) {
                // c.setAutoCommit(false);
                String sql = "SELECT MAX(orderID) as orderID from tblOrders";
                p = c.prepareStatement(sql);
                rs = p.executeQuery();
                if (rs.next()) {
                    return rs.getInt("orderID");
                }
            }
        } finally {

            if (p != null) {
                p.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return -1;
    }
}
