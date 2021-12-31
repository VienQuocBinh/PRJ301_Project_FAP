/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package obj;

import java.sql.Date;

/**
 *
 * @author LucasBV
 */
public class AcademicStudent {
    private int id;
    private int studentID;
    private String rollNumber;
    private String oldRollNumber;
    private String memberCode;
    private Date enrollDate;
    private String mode;

    public AcademicStudent() {
    }

    public AcademicStudent(int id, int studentID, String rollNumber, String oldRollNumber, String memberCode, Date enrollDate, String mode) {
        this.id = id;
        this.studentID = studentID;
        this.rollNumber = rollNumber;
        this.oldRollNumber = oldRollNumber;
        this.memberCode = memberCode;
        this.enrollDate = enrollDate;
        this.mode = mode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getOldRollNumber() {
        return oldRollNumber;
    }

    public void setOldRollNumber(String oldRollNumber) {
        this.oldRollNumber = oldRollNumber;
    }

    public String getMemberCode() {
        return memberCode;
    }

    public void setMemberCode(String memberCode) {
        this.memberCode = memberCode;
    }

    public Date getEnrollDate() {
        return enrollDate;
    }

    public void setEnrollDate(Date enrollDate) {
        this.enrollDate = enrollDate;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }
    
    
}
