<%-- 
    Document   : employeepage.jsp
    Created on : Aug 24, 2017, 6:31:57 AM
    Author     : kasper
--%>

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
    </body>
</html>
