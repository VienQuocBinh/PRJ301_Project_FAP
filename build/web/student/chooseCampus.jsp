<%-- 
    Document   : chooseCampus
    Created on : Dec 22, 2021, 5:09:09 PM
    Author     : LucasBV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choose Campus Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <h1>FPT University</h1>
        <div class="container">
            <form action="MainController" method="POST">
                <div class="chooseCampus">
                    <label>Select Campus</label>
                    <select name="campusID" class="select">
                        <option value="8">FU-Hoa Lac</option>
                        <option value="9">FU-HCM</option>
                        <option value="10">FU-Da Nang</option>
                        <option value="11">FU-Can Tho</option>
                        <option value="12">MSE</option>
                        <option value="13">FE-Lao</option>
                    </select>
                    <div >
                        <input type="submit" name="action" value="ChooseCampus" class="btn">
                    </div>
                </div>


            </form>
        </div>


    </body>
</html>
