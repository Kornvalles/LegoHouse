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
<jsp:include page='/WEB-INF/siteheader.jsp'></jsp:include>
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
        <div class="container">
            <div class="row">
                <div class="col">
                    <form method="POST" action="FrontController">
                        <input type="hidden" name="command" value="login">
                        <input type="hidden" name="origin" value="logout">
                        <input type="submit" value="Log Out"/>
                    </form>
                </div>
                <div class="col-sm-8" style="background-color:lavender;">
                    <h2>Byg Legohus</h2><br>
                    <form name="createOrder" action="FrontController" method="POST">
                        <input type="hidden" name="command" value="order">
                        Længde:
                        <input type="number" name="length">
                        Bredde:
                        <input type="number" name="width">
                        Højde:
                        <input type="number" name="height"><br><br>
                        <input type="submit" value="Bestil">
                    </form>
                </div>
                <div class="col">
                    <table border="3" width="2" cellspacing="2" cellpadding="2" id="invoice" class="table table-dark">
                        <thead>
                            <tr>
                                <th>Højde</th>
                                <th>Længde</th>
                                <th>Bredde</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Order> orders = lf.getOrders(user.getId());
                                for (Order order : orders) {
                                    out.println("<tr>");
                                    out.println("<td>" + order.getHeight() + "</td>");
                                    out.println("<td>" + order.getLength() + "</td>");
                                    out.println("<td>" + order.getWidth() + "</td>");
                                    out.println("</tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>