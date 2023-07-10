<%-- 
    Document   : user
    Created on : May 29, 2023, 9:41:08 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <style>
            body {
                background-color: #f0f0f0;
                font-family: Arial, sans-serif;
            }
            
            .container {
                max-width: 800px;
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
            
            .container p {
                font-size: 18px;
                color: #333;
                text-align: center;
            }
            
            /* Added Colors */
            .container {
                background-color: #f8f9fa;
            }
            
            .container h1 {
                color: #333;
            }
            
            .container p {
                color: #333;
            }
            
            .container {
                transition: background-color 0.3s ease;
            }
            
            .container:hover {
                background-color: #f0f0f0;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>User's Information:</h1>
            <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
                <c:redirect url="login.html"/>
            </c:if>
            <p>
                User ID: ${sessionScope.LOGIN_USER.userID}<br/>
                Full Name: ${sessionScope.LOGIN_USER.fullName}<br/>
                Role ID: ${sessionScope.LOGIN_USER.roleID}<br/>
                Password: ${sessionScope.LOGIN_USER.password}<br/>
            </p>
        </div>
    </body>
</html>
