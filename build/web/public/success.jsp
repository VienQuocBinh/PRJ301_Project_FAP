<%-- 
    Document   : success
    Created on : Dec 22, 2021, 4:43:42 PM
    Author     : LucasBV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>

        <div class="container">
            <h1>Status: ${requestScope.REGISTER_SUCCESS}</h1>
            <form action="MainController">
                <input type="submit" name="action" value="ReturnLogin" class="btn">
            </form>
        </div>
    </body>
</html>
