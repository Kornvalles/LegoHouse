<%-- 
    Document   : index
    Created on : Aug 22, 2017, 2:01:06 PM
    Author     : kasper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page='/WEB-INF/siteheader.jsp'></jsp:include>
<!DOCTYPE html>
<html lang="da">
    <body>

        <div class="jumbotron text-center">
            <h1>Lego House Shop</h1>
            <p>Welcome to the shop</p> 
        </div>

        <div class="container">
            <div class="row">
                <div class="col">
                    <h3>Login</h3>
                    <form name="login" action="FrontController" method="POST">
                        <input type="hidden" name="command" value="login">
                        <input type="hidden" name="origin" value="login">
                        Email:<br>
                        <input type="text" name="email" value="someone@nowhere.com">
                        <br>
                        Password:<br>
                        <input type="password" name="password" value="sesam">
                        <br>
                        <input type="submit" value="Submit">
                    </form>
                    <% String error = (String) request.getAttribute("error");
                        if (error != null) {
                            out.println("<H2>Error!!</h2>");
                            out.println(error);
                        }
                    %>
                </div>
                <div class="col">
                    <h3>Or Register</h3>
                    <form name="register" action="FrontController" method="POST">
                        <input type="hidden" name="command" value="register">
                        Email:<br>
                        <input type="text" name="email" value="someone@nowhere.com">
                        <br>
                        Password:<br>
                        <input type="password" name="password1" value="sesam">
                        <br>
                        Retype Password:<br>
                        <input type="password" name="password2" value="sesam">
                        <br>
                        <input type="submit" value="Submit">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>