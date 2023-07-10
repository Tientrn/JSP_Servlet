<%-- 
    Document   : login
    Created on : May 29, 2023, 9:36:00 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login page</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }
        
        .container {
            max-width: 400px;
            margin-top: 100px;
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
        
        .container input[type="text"],
        .container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        
        .container .g-recaptcha {
            margin-bottom: 15px;
        }
        
        .container #error {
            color: red;
            margin-bottom: 15px;
        }
        
        .container input[type="submit"],
        .container input[type="reset"] {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        
        .container input[type="submit"]:hover,
        .container input[type="reset"]:hover {
            background-color: #45a049;
        }
        
        .container a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #333;
            text-decoration: none;
        }
        
        .container a:hover {
            text-decoration: underline;
        }
    </style>
    <script src='https://www.google.com/recaptcha/api.js' async defer ></script>
</head>

<body>
    <div align="center">
    <div class="container">
        <h1>Input your information:</h1>

        <form action="MainController" method="POST" id="form">
            <label for="userID">User ID</label>
            <input type="text" id="userID" name="userID" required="">
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required="">
            
            <div class="g-recaptcha" data-sitekey="6Ld9bgYlAAAAAOFhorvrim6WcGanE3Q_-Kr_oeQH"></div>
            
            <div id="error"></div>
            
            <input name="action" value="Login" hidden="">
            <input class="btn btn-info" type="submit" value="Login">
            <input type="reset" value="Reset">

        </form>
        
        <a href="MainController?action=CreatePage">Create user</a><br>
        <a href="MainController?action=shoppingPage">Tien's Store</a>
        ${requestScope.ERROR}
    </div>
    
    <script>
        window.onload = function () {
            let isValid = false;
            const form = document.getElementById("form");
            const error = document.getElementById("error");

            form.addEventListener("submit", function (event) {
                event.preventDefault();
                const response = grecaptcha.getResponse();
                if (response) {
                    form.submit();
                } else {
                    error.innerHTML = "Please check";
                }
            });
        }
    </script>
</div>
    </body>
</html>
