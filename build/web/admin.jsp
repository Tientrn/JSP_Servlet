<%-- 
    Document   : admin
    Created on : May 29, 2023, 9:30:34 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Page</title>
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
        
        .container form {
            margin-bottom: 20px;
            text-align: center;
        }
        
        .container form input[type="text"],
        .container form input[type="submit"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        
        .container table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        .container table th,
        .container table td {
            padding: 10px;
            border: 1px solid #ccc;
        }
        
        .container table th {
            background-color: #f5f5f5;
            text-align: left;
        }
        
        .container table td input[type="text"],
        .container table td input[type="submit"] {
            width: 100%;
        }
        
        .container table td a {
            color: #333;
            text-decoration: none;
        }
        
        .container table td a:hover {
            text-decoration: underline;
        }
        
        /* Added Colors */
        .container p {
            color: #555;
        }
        
        .container form input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
        
        .container table th {
            background-color: #f8f9fa;
        }
        
        .container table td {
            background-color: #fff;
        }
        
        .container table td a {
            color: #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin World</h1>
        
        <c:if test="${sessionScope.LOGIN_USER==null ||sessionScope.LOGIN_USER.roleID ne'AD'}">
            <c:redirect url="login.html">
            </c:redirect>
        </c:if>
        
        <p>Welcome: ${sessionScope.LOGIN_USER.userID}</p>
        
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout">
        </form>
        
        <form action="MainController">
            <input type="text" name="search" value="${param.search}" placeholder="Search">
            <input type="submit" name="action" value="Search">
        </form>
        
        <c:if test="${sessionScope.LIST_USER!= null}">
            <c:if test="${not empty sessionScope.LIST_USER}">
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Role ID</th>
                            <th>Password</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${sessionScope.LIST_USER}" varStatus="counter">
                            <form action="MainController" method="POST">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>
                                        <input type="text" name="userID" value="${user.userID}" readonly>
                                    </td>
                                    <td>
                                        <input type="text" name="fullName" value="${user.fullName}" required>
                                    </td>
                                    <td>
                                        <input type="text" name="roleID" value="${user.roleID}" required>
                                    </td>
                                    <td>${user.password}</td>
                                    <td>
                                        <input type="submit" name="action" value="Update">
                                        <input type="hidden" name="search" value="${param.search}">
                                    </td>
                                    <td>
                                        <c:url var="deleteLink" value="MainController">
                                            <c:param name="action" value="Delete"></c:param>
                                            <c:param name="userID" value="${user.userID}"></c:param>
                                            <c:param name="search" value="${param.search}"></c:param>
                                        </c:url>
                                        <a href="${deleteLink}">Delete</a>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </c:if>
        
        ${requestScope.ERROR}
    </div>
</body>
</html>
