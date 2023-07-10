<%-- 
    Document   : shopping
    Created on : Jun 16, 2023, 4:11:44 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Ban Quan Ao</title>
        <style>
            body {
                background-color: #f0f0f0;
                font-family: Arial, sans-serif;
            }
            
            .container {
                max-width: 600px;
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
                margin-bottom: 20px;
                text-align: center;
            }
            
            .container select,
            .container input[type="submit"] {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 16px;
            }
            
            .container input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
            }
            
            /* Added Colors */
            .container {
                background-color: #f8f9fa;
            }
            
            .container select,
            .container input[type="submit"] {
                background-color: #fff;
                color: #333;
            }
            
            .container select {
                width: 200px;
                margin-right: 10px;
            }
            
            .container input[type="submit"]:hover {
                background-color: #0056b3;
            }
            
            .container p {
                color: #007bff;
                font-size: 18px;
                font-weight: bold;
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Welcome to Shop Quan Ao</h1>
            <form action="MainController" method="POST">
                <select name="cmbClothes">
                    <option value="C01-T Shirt-150">T Shirt - $150</option>
                    <option value="C02-Pant-300">Pant - $300</option>
                    <option value="C03-Bubble Dress-400">Bubble Dress - $400</option>
                    <option value="C04-Fashion Hat-200">Fashion Hat - $200</option>
                </select>
                <select name="cmbQuantity">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="10">10</option>      
                </select>
                <input type="submit" name="action" value="Add"/>
                <input type="submit" name="action" value="View"/>
            </form>
            <p>${requestScope.MESSAGE}</p>
        </div>
    </body>
</html>
