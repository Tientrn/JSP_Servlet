<%-- 
    Document   : viewcart
    Created on : Jun 16, 2023, 4:16:58 PM
    Author     : HP
--%>

<%@page import="sample.shopping.Clothes"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Selected Clothes</title>
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
            
            .container table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            
            .container table th,
            .container table td {
                padding: 10px;
                border: 1px solid #ccc;
            }
            
            .container table th {
                background-color: #f8f9fa;
                font-weight: bold;
                text-align: center;
            }
            
            .container table td {
                text-align: center;
            }
            
            .container table td input[type="text"],
            .container table td input[type="number"],
            .container table td input[type="submit"] {
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 14px;
            }
            
            .container table td input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
            }
            
            /* Added Colors */
            .container {
                background-color: #f8f9fa;
            }
            
            .container h1 {
                color: #333;
            }
            
            .container table {
                border-color: #ccc;
            }
            
            .container table th {
                background-color: #f0f0f0;
                color: #333;
            }
            
            .container table td input[type="submit"] {
                background-color: #007bff;
                color: #fff;
            }
            
            .container h1,
            .container table th,
            .container table td {
                transition: background-color 0.3s ease;
            }
            
            .container table td:hover {
                background-color: #f8f9fa;
            }
            
            .container table td input[type="submit"]:hover {
                background-color: #0056b3;
            }
            
            .container h1,
            .container table th,
            .container table td {
                padding: 8px;
            }
            
            .container h1 {
                margin-top: 0;
                margin-bottom: 20px;
            }
            
            .container p {
                font-size: 18px;
                font-weight: bold;
                text-align: center;
                margin-top: 20px;
            }
            
            .container form {
                text-align: center;
                margin-top: 20px;
            }
            
            .container form input[type="submit"] {
                background-color: #28a745;
                color: #fff;
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }
            
            .container a {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #007bff;
                text-decoration: none;
            }
            
            .container a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Your Selected Clothes</h1>
            <% 
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null && cart.getCart().size() > 0) {
                    int count = 1;
                    double total = 0;
                    for (Clothes clothes : cart.getCart().values()) {
                        total += clothes.getQuantity() * clothes.getPrice();
            %>
            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Edit</th>
                        <th>Remove</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <form action="MainController" method="POST">
                        <tr>
                            <td><%= count++ %></td>
                            <td>
                                <input type="text" name="id" value="<%= clothes.getId() %>" readonly/>
                            </td>
                            <td><%= clothes.getName() %></td>
                            <td><%= clothes.getPrice() %> $</td>
                            <td>
                                <input type="number" name="quantity" value="<%= clothes.getQuantity() %>" min="1" required/>
                            </td>
                            <td>
                                <input type="submit" name="action" value="Edit"/>
                            </td>
                            <td>
                                <input type="submit" name="action" value="Remove"/>
                            </td>
                            <td><%= clothes.getQuantity() * clothes.getPrice() %> $</td>
                        </tr>
                    </form>
                    <% } %>
                </tbody>
            </table>
            <h1>Total: <%= total %> $</h1>
            <% } else { %>
            <p>No items in the cart</p>
            <% } %>
            <form action="MainController" method="post">
                <input type="submit" name="action" value="Checkout"/>
            </form>
            <a href="shopping.html">Add more items</a>
        </div>
    </body>
</html>
