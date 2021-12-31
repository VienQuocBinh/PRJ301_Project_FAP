<%-- 
    Document   : academicInfo
    Created on : Dec 30, 2021, 10:12:01 PM
    Author     : LucasBV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Academic Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <h1>Student Information</h1>
        <hr>
        <div class="container">
            <h3>Profile</h3>
            <ul class="unorderList">
                <li>Fullname : ${sessionScope.STUDENT.firstName} ${sessionScope.STUDENT.lastName}</li>
                <li>Date of birth: ${sessionScope.STUDENT.dob}</li>
                <li>Gender: 
                    <c:if test="${sessionScope.STUDENT.gender == true}">Male</c:if>
                    <c:if test="${sessionScope.STUDENT.gender == false}">Female</c:if>
                    </li>
                    <li>Address: ${sessionScope.STUDENT.address}</li>
                <li>Email: ${sessionScope.STUDENT.email}</li>

            </ul>

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
        </div>

    </body>
</html>
