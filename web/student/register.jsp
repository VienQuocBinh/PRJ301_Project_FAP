<%-- 
    Document   : register
    Created on : Dec 22, 2021, 4:44:58 PM
    Author     : LucasBV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <h1>Student Information</h1>
        <div class="container">
            <form action="MainController" method="POST">
                <div class="register">
                    <label>First Name</label>
                    <input type="text" name="firstName" placeholder="Enter first name">
                </div>
                <div class="register">
                    <label>Last Name</label>
                    <input type="text" name="lastName" placeholder="Enter last name">
                </div>
                <div class="register">
                    <label>Date of Birth</label>
                    <input type="date" name="dob">
                </div>

                <div class="register">
                    <label>Gender</label>
                    <label><input type="radio" name="gender" value="1"> Male</label>
                    <label><input type="radio" name="gender" value="0"> Female</label>
                </div>

                <div class="register">
                    <label>Address</label>
                    <input type="text" name="address" placeholder="Enter address">
                </div>

                <div class="register">
                    <label>Telephone</label>
                    <input type="text" name="telephone" placeholder="Enter telephone">
                </div>

                <div class="register">
                    <label>Email</label>
                    <input type="email" name="email" placeholder="Enter email">
                </div>

                <div class="register">
                    <label>Specialized</label>
                    <select name="specialized" class="select">
                        <option value="1">Software Engineering</option>
                        <option value="2">Information Assurance</option>
                        <option value="3">Business Administration</option>
                    </select>
                </div>

                <input type="submit" name="action" value="Register" class="btn">
                <br>
                <input type="submit" value="Login"  class="btn"> (When you are admin of staff)
                <input type="hidden" name="action" value="ReturnLogin">
            </form>
        </div>

        <c:if test="${requestScope.REGISTER_ERROR != null}">
            ${requestScope.REGISTER_ERROR}
        </c:if>
    </body>
</html>
