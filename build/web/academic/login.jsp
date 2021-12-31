<%-- 
    Document   : login
    Created on : Dec 22, 2021, 11:20:09 PM
    Author     : LucasBV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>



        <h1>Login</h1>
        <div class="container">
            <h2>You must login first</h2>

            <form action="MainController" method="POST">
                <div class="login">
                    <p>Username</p>
                    <input type="text" name="username" placeholder="Enter username">
                </div>
                <div class="login">
                    <p>Password</p>
                    <input type="password" name="password" placeholder="Password">
                    <br>
                </div>
                <input type="submit" name="action" value="Submit" class="btn">
            </form>
            <c:if test="${sessionScope.LOGIN_MESSAGE != null}">
                ${sessionScope.LOGIN_MESSAGE}
            </c:if>
        </div>

    </body>
</html>
