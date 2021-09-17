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
import java.util.List;
import vanvlb.dtos.UserDTO;
import vanvlb.utils.DBUtil;

/**
 *
 * @author Mon
 */
public class UserDAO {

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT roleID, fullName "
                        + " FROM tblUsers "
                        + " WHERE userID = ? AND password = ?";
                pre = conn.prepareStatement(sql);
                pre.setString(1, userID);
                pre.setString(2, password);
                rs = pre.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    user = new UserDTO(userID, fullName, "", "", roleID, password);
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
        return user;
    }

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT userID, fullName, phone, address, roleID "
                        + " FROM tblUsers "
                        + " WHERE fullName LIKE ?";
                pre = conn.prepareStatement(sql);
                pre.setString(1, "%" + search + "%");
                rs = pre.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String roleID = rs.getString("roleID");
                    String password = "*****";
                    list.add(new UserDTO(userID, fullName, phone, address, roleID, password));
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

    public boolean delete(String userID) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pre = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "DELETE tblUsers WHERE userID ='" + userID + "'";
                pre = conn.prepareStatement(sql);
                check = pre.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pre != null) {
                pre.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean Update(UserDTO user) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pre = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblUsers "
                        + "SET fullName = ?, phone = ?, address = ?, roleID = ? "
                        + " WHERE userID = ?";
                pre = conn.prepareStatement(sql);
                pre.setString(1, user.getFullName());
                pre.setString(2, user.getPhone());
                pre.setString(3, user.getAddress());
                pre.setString(4, user.getRoleID());
                pre.setString(5, user.getUserID());
                check = pre.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pre != null) {
                pre.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String userID) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT userID FROM tblUsers WHERE userID = ?";
                pre = conn.prepareStatement(sql);
                pre.setString(1, userID);
                rs = pre.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
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
        return check;
    }

    public boolean insert(UserDTO user) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pre = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblUsers (userID, fullName, phone, address, roleID, password) VALUES (?,?,?,?,?,?)";
                pre = conn.prepareStatement(sql);
                pre.setString(1, user.getUserID());
                pre.setString(2, user.getFullName());
                pre.setString(3, user.getPhone());
                pre.setString(4, user.getAddress());
                pre.setString(5, user.getRoleID());
                pre.setString(6, user.getPassword());
                check = pre.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pre != null) {
                pre.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
