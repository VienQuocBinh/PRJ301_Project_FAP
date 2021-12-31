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
public class Student {
    private int id;
    private String firstName;
    private String lastName;
    private Date dob;
    private boolean gender;
    private int cardNo;
    private Date cardDate;
    private String cardPlace;
    private String address;
    private String telephone;
    private String email;
    private int specializedID;
    private int campusID;
    private int parentID;

    public Student() {
    }

    public Student(int id, String firstName, String lastName, Date dob, boolean gender, int cardNo, Date cardDate, String cardPlace, String address, String telephone, String email, int specializedID, int campusID, int parentID) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dob = dob;
        this.gender = gender;
        this.cardNo = cardNo;
        this.cardDate = cardDate;
        this.cardPlace = cardPlace;
        this.address = address;
        this.telephone = telephone;
        this.email = email;
        this.specializedID = specializedID;
        this.campusID = campusID;
        this.parentID = parentID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getCardNo() {
        return cardNo;
    }

    public void setCardNo(int cardNo) {
        this.cardNo = cardNo;
    }

    public Date getCardDate() {
        return cardDate;
    }

    public void setCardDate(Date cardDate) {
        this.cardDate = cardDate;
    }

    public String getCardPlace() {
        return cardPlace;
    }

    public void setCardPlace(String cardPlace) {
        this.cardPlace = cardPlace;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getSpecializedID() {
        return specializedID;
    }

    public void setSpecializedID(int specializedID) {
        this.specializedID = specializedID;
    }

    public int getCampusID() {
        return campusID;
    }

    public void setCampusID(int campusID) {
        this.campusID = campusID;
    }

    public int getParentID() {
        return parentID;
    }

    public void setParentID(int parentID) {
        this.parentID = parentID;
    }
    
    
}
