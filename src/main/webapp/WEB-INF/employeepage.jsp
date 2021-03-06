<%-- 
    Document   : employeepage.jsp
    Created on : Aug 24, 2017, 6:31:57 AM
    Author     : kasper
--%>

<%@page import="java.util.List"%>
<%@page import="FunctionLayer.Order"%>
<%@page import="FunctionLayer.LogicFacade"%>
<%@page import="FunctionLayer.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page='/WEB-INF/siteheader.jsp'></jsp:include>
    <!DOCTYPE html>
    <html>
        <body>
        <%
            User user = (User) session.getAttribute("user");
            LogicFacade lf = new LogicFacade();
        %>
        <div class="jumbotron text-center">
            <h1>Hello <%=user.getEmail()%></h1>
            <p>You are now logged in as an employee of our wonderful site.</p> 
        </div>
        <form method="POST" action="FrontController">
            <input type="hidden" name="command" value="login">
            <input type="hidden" name="origin" value="logout">
            <input type="submit" value="Log Out"/>
        </form>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <%
                        List<User> users = lf.getUsers();
                        for (User u : users) {
                            String username = u.getEmail();
                            //out.println("<br>");
                            out.println("<h5> Orders for: " + username + "</h5>");
                    %>
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
                                List<Order> orders = lf.getOrders(u.getId());
                                for (Order order : orders) {
                                    out.println("<tr>");
                                    out.println("<td>" + order.getHeight() + "</td>");
                                    out.println("<td>" + order.getLength() + "</td>");
                                    out.println("<td>" + order.getWidth() + "</td>");
                                    out.println("</tr>");
                               
                                    if (!order.isShipped()) {
                            %>
                        <form action="FrontController" method="POST">
                            <input type="hidden" name="command" value="order">
                            <input type="hidden" name="origin" value="ship">
                            <input type="hidden" name="id" value="<%= order.getId() %>">
                            <input type="hidden" name="idUser" value="<%= user.getId() %>">
                            <input type="submit" value="Ship Order" >
                        </form>
                                    
                        <%
                                    }
                            }
                        %>
                        </tbody>
                    </table>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
