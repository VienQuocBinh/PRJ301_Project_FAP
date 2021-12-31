/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import obj.AcademicStudent;
import util.DBUtil;

/**
 *
 * @author LucasBV
 */
public class AcademicStudentDAO {

    public void insertStudent(String rollnumber, String memberCode, String mode, Date enrollDate, int studentID) throws SQLException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Academic_Student (rollNumber, memberCode, enrollDate, mode, studentID)\n"
                        + "VALUES (?, ?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, rollnumber);
                ps.setString(2, memberCode);
                ps.setDate(3, enrollDate);
                ps.setString(4, mode);
                ps.setInt(5, studentID);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ps.close();
            conn.close();
        }
    }

    public void deleteStudent(int studentID) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "DELETE Academic_Student\n"
                        + "WHERE id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentID);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ps.close();
            conn.close();
        }
    }

    public AcademicStudent getAcademicStudentByID(int studentID) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        AcademicStudent acaStu = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT id, rollNumber, memberCode, enrollDate, mode FROM Academic_Student\n"
                        + "WHERE studentId = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String rollNumber = rs.getString("rollNumber");
                    String memberCode = rs.getString("memberCode");
                    Date enrollDate = rs.getDate("enrollDate");
                    String mode = rs.getString("mode");

                    acaStu = new AcademicStudent(id, studentID, rollNumber, null, memberCode, enrollDate, mode);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return acaStu;
    }

}
