<%-- 
    Document   : customerpage
    Created on : Aug 22, 2017, 2:33:37 PM
    Author     : kasper
--%>

<%@page import="java.util.List"%>
<%@page import="FunctionLayer.Order"%>
<%@page import="FunctionLayer.LogicFacade"%>
<%@page import="FunctionLayer.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Customer home page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            LogicFacade lf = new LogicFacade();
        %>

        <div class="jumbotron text-center">
            <h1>Hello <%=user.getEmail()%></h1>
            <p>You are now logged in as a customer of our wonderful site.</p> 
        </div>

        <div class="text-center">
            <div class="col-sm-4">
            <h2>Byg Legohus</h2>
            <form name="createOrder" action="FrontController" method="POST">
                <input type="hidden" name="command" value="order">
                Længde:<br>
                <input type="number" name="length">
                <br>
                Bredde:<br>
                <input type="number" name="width">
                <br>
                Højde:<br>
                <input type="number" name="height">
                <br>
                <input type="submit" value="Bestil">
            </form>
        </div>
        <div class="row">
            <div class="col">
                <%
                   List<Order> orders = lf.getOrders(user.getId());
                   for (Order order : orders) {
                       out.println(order.getHeight() + " " + order.getLength() + " " + order.getWidth());
                       out.println("\n");
                   }
                %>
            </div>
        </div>
    </body>
</html>