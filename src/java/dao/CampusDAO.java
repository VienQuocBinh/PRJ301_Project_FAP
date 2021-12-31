/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBUtil;

/**
 *
 * @author LucasBV
 */
public class CampusDAO {

    public String getCampusName(int campusID) throws SQLException {
        String name = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT name FROM Campus\n"
                        + "WHERE id=?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, campusID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    name = rs.getString(1);
                }
            }
        } catch (Exception e) {
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return name;
    }
}
