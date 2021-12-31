<%-- 
    Document   : registerInfo
    Created on : Dec 29, 2021, 2:40:51 PM
    Author     : LucasBV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Info Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <h1>Info of student: ${sessionScope.STUDENT.firstName} ${sessionScope.STUDENT.lastName}</h1>
        <div class="container">
            <form action="MainController" method="POST">
                <div class="register">
                    <label>First Name</label>
                    <input type="text" name="firstName" value="${sessionScope.STUDENT.firstName}" >
                </div>

                <div class="register">
                    <label>Last Name</label>
                    <input type="text" name="lastName" value="${sessionScope.STUDENT.lastName}">
                </div>

                <div class="register"> 
                    <label>Date of birth</label>
                    <input type="date" name="dob" value="${sessionScope.STUDENT.dob}">
                </div>

                <div class="register">
                    <label>Gender</label>
                    <div>
                        <label><input type="radio" name="gender" value="1" <c:if test="${sessionScope.STUDENT.gender == true}">checked=""</c:if>>Male</label>
                        <label><input type="radio" name="gender" value="0" <c:if test="${sessionScope.STUDENT.gender == false}">checked=""</c:if>>Female</label>

                        </div>
                    </div>

                    <div class="register">
                        <label>Address</label>
                        <input type="text" name="address" value="${sessionScope.STUDENT.address}">
                </div>

                <div class="register">
                    <label>Telephone</label>
                    <input type="text" name="telephone" value="${sessionScope.STUDENT.telephone}">
                </div class="register"> 

                <div class="register">
                    <label>Email</label>
                    <input type="text" name="email" value="${sessionScope.STUDENT.email}">
                </div>

                <div class="register">
                    <label>Specialized</label>
                    <select name="specialized" class="selection">
                        <option value="1" <c:if test="${sessionScope.STUDENT.specializedID == 1}">selected=""</c:if>>Software Engineering</option>
                        <option value="2" <c:if test="${sessionScope.STUDENT.specializedID == 2}">selected=""</c:if>>Information Assurance</option>
                        <option value="3" <c:if test="${sessionScope.STUDENT.specializedID == 3}">selected=""</c:if>>Business Administration</option>
                        </select>

                    </div>

                    <h3>Parent</h3>

                <c:if test="${sessionScope.PARENT != null}">
                    <ul class="unorderList">
                        <li>Name: ${sessionScope.PARENT.name}</li>
                        <li>Phone number: ${sessionScope.PARENT.phoneNumber}</li>
                        <li>Gender: 
                            <c:if test="${sessionScope.PARENT.gender == true}">
                                Male
                            </c:if> 
                            <c:if test="${sessionScope.PARENT.gender == false}">
                                Female
                            </c:if> 
                        </li>
                        <li>ID Card: ${sessionScope.PARENT.id}</li>
                        <li>Address: ${sessionScope.PARENT.address}</li>
                        <li>Email: ${sessionScope.PARENT.email}</li>
                        <li>Job: ${sessionScope.PARENT.job}</li>
                        <li>Place of work: ${sessionScope.PARENT.placeWork}</li>
                    </ul>

                </c:if>

                <c:if test="${sessionScope.PARENT == null}">
                    <ul>
                        <li>Name: </li>
                        <li>Phone number: </li>
                        <li>Gender: </li>
                        <li>ID Card: </li>
                        <li>Address: </li>
                        <li>Email </li>
                        <li>Job: </li>
                        <li>Place of work: </li>
                    </ul>
                </c:if>

                <h3>For Academic Staff</h3>

                <div class="register">
                    <label>Roll number</label>
                    <input type="text" name="rollNumber" value="${sessionScope.CAMPUS_NAME}${sessionScope.STUDENT.id}" disabled="">
                </div> 

                <div class="register">
                    <label>Old roll number</label>
                    <input type="text" name="oldRollNumber">
                </div>

                <div class="register">
                    <label>Member Code</label>
                    <input type="text" name="memberCode" value="${sessionScope.NAME_FPT}${sessionScope.SPECIALIZED_CODE}${sessionScope.STUDENT.id}" disabled="">
                </div>

                <div class="register">
                    <label>Enroll date</label>
                    <input type="date" name="enrollDate" placeholder="dd/mm/yyy">
                </div>

                <div class="register">
                    <label>Mode</label>
                    <input type="text" name="mode" placeholder="College / University">
                </div>

                <input type="hidden" name="studentID" value="${sessionScope.STUDENT.id}">
                <input type="submit" name="action" value="Accept" class="btn">
                <input type="submit" name="action" value="Reject"class="btn">
            </form>
        </div>
    </body>
</html>
