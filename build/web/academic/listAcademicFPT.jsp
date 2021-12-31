<%-- 
    Document   : listAcademicFPT
    Created on : Dec 30, 2021, 8:59:26 PM
    Author     : LucasBV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Academic List Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <h1>List FPT Student</h1>

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
                <c:forEach var="student" items="${requestScope.LIST_ACADEMIC_STUDENT}">
                    <form action="MainController" method="POST">
                        <li>${student.firstName} ${student.lastName}
                            <input type="hidden" name="studentID" value="${student.id}">
                            <input type="submit" name="action" value="CheckInformation" class="btn">
                        </li>
                    </form>
                </c:forEach>
            </ul>
        </div>
    </body>
</html>
