<%-- 
    Document   : create
    Created on : Jun 9, 2023, 4:08:27 PM
    Author     : HP
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
        <style>
            body {
                background-color: #f0f0f0;
                font-family: Arial, sans-serif;
            }
            
            .container {
                max-width: 400px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            
            .container h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
                text-align: center;
            }
            
            .container form {
                text-align: center;
            }
            
            .container label {
                display: block;
                margin-bottom: 10px;
                color: #333;
                font-weight: bold;
            }
            
            .container input[type="text"],
            .container input[type="password"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }
            
            .container input[type="submit"],
            .container input[type="reset"] {
                margin-top: 10px;
                padding: 10px 20px;
                background-color: #333;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }
            
            .container input[type="submit"]:hover,
            .container input[type="reset"]:hover {
                background-color: #555;
            }
            
            .container p {
                color: #ff0000;
                margin-top: 10px;
                text-align: center;
            }
            
            /* Added Colors */
            .container {
                background-color: #f8f9fa;
            }
            
            .container h1 {
                color: #333;
            }
            
            .container label {
                color: #333;
            }
            
            .container input[type="text"],
            .container input[type="password"] {
                border-color: #ccc;
            }
            
            .container input[type="submit"],
            .container input[type="reset"] {
                background-color: #333;
                color: #fff;
            }
            
            .container input[type="submit"]:hover,
            .container input[type="reset"]:hover {
                background-color: #555;
            }
            
            .container p {
                color: #ff0000;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Create New User</h1>
            <form action="MainController" method="POST">
                <label for="userID">User ID</label>
                <input type="text" id="userID" name="userID" required=""/>
                <p>${requestScope.USER_ERROR.userIDError}</p>
                
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" required=""/>
                <p>${requestScope.USER_ERROR.fullNameError}</p>
                
                <label for="roleID">Role ID</label>
                <input type="text" id="roleID" name="roleID" value="US" readonly=""/>
                
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required=""/>
                
                <label for="confirm">Confirm</label>
                <input type="password" id="confirm" name="confirm" required=""/>
                <p>${requestScope.USER_ERROR.confirm}</p>
                
                <input type="submit" name="action" value="Create"/>
                <input type="reset" value="Reset"/>
                
                <p>${requestScope.USER_ERROR.error}</p>
            </form>
        </div>
    </body>
</html>
