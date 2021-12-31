/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import obj.Parent;
import obj.Student;
import util.DBUtil;

/**
 *
 * @author LucasBV
 */
public class ParentDAO {

    public Parent getParent(int studentID) throws SQLException {
        Parent parent = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT p.id, p.name, p.phoneNumber, p.address, p.email, p.job, p.placeWork, p.gender \n"
                        + "FROM Parent p\n"
                        + "JOIN Student s ON p.id = s.parentId\n"
                        + "WHERE s.id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String phoneNumber = rs.getString("phoneNumber");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    String job = rs.getString("job");
                    String placeWork = rs.getString("placeWork");
                    boolean gender = rs.getBoolean("gender");
                    parent = new Parent(id, name, phoneNumber, address, email, job, placeWork, gender);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return parent;
    }
}
