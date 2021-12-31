<%-- 
    Document   : listRegister
    Created on : Dec 29, 2021, 1:54:49 PM
    Author     : LucasBV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Register Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <h1>List registered student</h1>
        <hr>
        <div class="nav-bar">
            <ul>
                <li><a href="ShowListStudentRegisterController">List register</a></li>
            </ul>
            <ul>
                <li><a href="ShowListStudentAcademicController">List academic</a></li>
            </ul>

        </div>
        <div class="container">
            <ul class="unorderList">
                <c:forEach var="student" items="${requestScope.LIST_REGISTER}">
                    <form action="MainController" method="POST">
                        <li>
                            ${student.firstName} ${student.lastName}
                            <input type="hidden" name="studentID" value="${student.id}">
                            <input type="submit" name="action" value="CheckRegisterInfo" class="btn">
                        </li>
                    </form>
                </c:forEach>
            </ul>
        </div>

    </body>
</html>
