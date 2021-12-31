<%-- 
    Document   : Error
    Created on : Dec 22, 2021, 4:43:52 PM
    Author     : LucasBV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>

        <div class="container">
            <h1>Error ${sessionScope.ERROR_MESSAGE}</h1>
            <c:if test="${requestScope.REGISTER_ERROR != null}">
                ${requestScope.REGISTER_ERROR}
            </c:if>
            <c:if test="${requestScope.ACCEPT_ERROR != null}">
                ${requestScope.ACCEPT_ERROR}
            </c:if>
        </div>
    </body>
</html>
