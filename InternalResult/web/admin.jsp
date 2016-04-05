<%-- 
    Document   : admin
    Created on : Jun 23, 2015, 11:12:53 AM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
    </head>
    <body>
       <%
            boolean flag = (boolean)session.getAttribute("check");
            if(!flag){
                session.setAttribute("msg", "Your Session Expire Please Login Again");
                response.sendRedirect("AdminLogin.jsp");
            }
        %>
    </body>
</html>
