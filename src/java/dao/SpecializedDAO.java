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
public class SpecializedDAO {

    public String getSpecializedCode(int specializedID) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String code = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT code FROM Specialized\n"
                        + "WHERE id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, specializedID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    code = rs.getString(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return code;
    }
}
