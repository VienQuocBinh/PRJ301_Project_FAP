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
import java.text.Normalizer;
import java.util.ArrayList;
import obj.Student;
import util.DBUtil;

/**
 *
 * @author LucasBV
 */
public class StudentDAO {

    // insert into Student table (waiting list / Register list)
    public void insertStudent(String firstName, String lastName, String dob, int gender, String address, String telephone, String email, int specializedID, int campusID) throws SQLException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Student(firstName, lastName, DOB, gender, address, telephone, email, specializedId, campusId)\n"
                        + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, dob);
                ps.setInt(4, gender);
                ps.setString(5, address);
                ps.setString(6, telephone);
                ps.setString(7, email);
                ps.setInt(8, specializedID);
                ps.setInt(9, campusID);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ps.close();
            conn.close();
        }
    }

    // Get list Student from Student table not in academic_student table
    public ArrayList<Student> getListRegisteredStudent() throws SQLException {
        ArrayList<Student> listResgisterdStudent = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT s.id, s.firstName, s.lastName, s.DOB, s.gender, s.cardNo, s.cardDate, s.cardPlace, s.address, s.telephone, s.email, s.specializedId, s.campusId\n"
                        + "FROM Student s\n"
                        + "LEFT OUTER JOIN Academic_Student aca ON s.id = aca.studentId\n"
                        + "WHERE aca.studentId IS NULL";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String firstName = rs.getString("firstName");
                    String lastName = rs.getString("lastName");
                    Date dob = rs.getDate("DOB");
                    boolean gender = rs.getBoolean("gender");
                    int cardNo = rs.getInt("cardNo");
                    Date cardDate = rs.getDate("cardDate");
                    String cardPlace = rs.getString("cardPlace");
                    String address = rs.getString("address");
                    String telephone = rs.getString("telephone");
                    String email = rs.getString("email");
                    int specializedId = rs.getInt("specializedId");
                    int campusId = rs.getInt("campusId");

                    Student s = new Student(id, firstName, lastName, dob, gender, cardNo, cardDate, cardPlace, address, telephone, email, specializedId, campusId, 0);
                    listResgisterdStudent.add(s);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return listResgisterdStudent;
    }

    // Get list of student in FPT
    public ArrayList<Student> getListAcademicStudent() throws SQLException {
        ArrayList<Student> listAcademicStudent = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT s.id, s.firstName, s.lastName, s.DOB, s.gender, s.cardNo, s.cardDate, s.cardPlace, s.address, s.telephone, s.email, s.specializedId, s.campusId, aca.studentId\n"
                        + "FROM Student s\n"
                        + "LEFT OUTER JOIN Academic_Student aca ON s.id = aca.studentId\n"
                        + "WHERE aca.studentId IS NOT NULL";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String firstName = rs.getString("firstName");
                    String lastName = rs.getString("lastName");
                    Date dob = rs.getDate("DOB");
                    boolean gender = rs.getBoolean("gender");
                    int cardNo = rs.getInt("cardNo");
                    Date cardDate = rs.getDate("cardDate");
                    String cardPlace = rs.getString("cardPlace");
                    String address = rs.getString("address");
                    String telephone = rs.getString("telephone");
                    String email = rs.getString("email");
                    int specializedId = rs.getInt("specializedId");
                    int campusId = rs.getInt("campusId");

                    Student s = new Student(id, firstName, lastName, dob, gender, cardNo, cardDate, cardPlace, address, telephone, email, specializedId, campusId, 0);
                    listAcademicStudent.add(s);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return listAcademicStudent;
    }

    // Get student info by id
    public Student getStudentByID(int id) throws SQLException {
        Student student = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT firstName, lastName, DOB, gender, cardNo, cardDate, cardPlace, address, telephone, email, specializedId, campusId\n"
                        + "FROM Student \n"
                        + "WHERE id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();

                if (rs.next()) {
                    String firstName = rs.getString("firstName");
                    String lastName = rs.getString("lastName");
                    Date dob = rs.getDate("DOB");
                    boolean gender = rs.getBoolean("gender");
                    int cardNo = rs.getInt("cardNo");
                    Date cardDate = rs.getDate("cardDate");
                    String cardPlace = rs.getString("cardPlace");
                    String address = rs.getString("address");
                    String telephone = rs.getString("telephone");
                    String email = rs.getString("email");
                    int specializedId = rs.getInt("specializedId");
                    int campusId = rs.getInt("campusId");

                    student = new Student(id, firstName, lastName, dob, gender, cardNo, cardDate, cardPlace, address, telephone, email, specializedId, campusId, 0);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return student;
    }

    // get name of student in FPT: FIRSTNAME + LASTNAME (BINHVQ)
    public String getNameFPT(int studentID) throws SQLException {
        String name = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT firstName, lastName FROM Student\n"
                        + "WHERE id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, studentID);
                rs = ps.executeQuery();

                if (rs.next()) {
                    String firstName = rs.getString("firstName");
                    String lastName = rs.getString("lastName");
                    // Change UTF-8 to ASCII in order to operate on String
                    String firstStr = Normalizer.normalize(lastName, Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "").toUpperCase();
                    String[] arrStr = firstName.split(" ");
                    // Get the first letter in First name
                    ArrayList<Character> listChar = new ArrayList<>();
                    for (String string : arrStr) {
                        listChar.add(string.charAt(0));
                    }
                    name = firstStr;
                    for (Character character : listChar) {
                        name += character;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return name;
    }

    // Accpet and Update student 
    public void acceptStudent(int studentID, String firstName, String lastName, String dob, int gender, String address, String telephone, String email, int specializedID) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "UPDATE Student\n"
                        + "SET firstName= ?, lastName= ?, DOB= ?, gender= ?, address= ?, telephone=? , email= ?, specializedId= ?\n"
                        + "WHERE id =  ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, dob);
                ps.setInt(4, gender);
                ps.setString(5, address);
                ps.setString(6, telephone);
                ps.setString(7, email);
                ps.setInt(8, specializedID);
                ps.setInt(9, studentID);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ps.close();
            conn.close();
        }
    }

    // Reject student
    public void deleteStudent(int studentID) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "DELETE Student\n"
                        + "WHERE id =  ?";
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
}
