<%-- 
    Document   : myProfile
    Created on : Jul 14, 2015, 5:50:49 AM
    Author     : Aditya Kasbekar
--%>

<%@page import="dto.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            Admin adm = (Admin) session.getAttribute("Stdobject");
        %>
        <style>
            td{
                text-align: center;
            }
        </style>
    </head>
    <body id="nwp" style="margin-top: 50px">
        <table id="log2" border="0" >
            <thead>
                <tr>
                    <th id="thb" colspan="2" style="font-weight: bolder; font-size: 2.0em">YOUR PROFILE</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>User ID:</th>
                    <td><%=adm.getUserid()%></td>                
                </tr>
                <tr>
                    <th>Password:</th>
                    <td>*********</td>                
                </tr>
                <tr>
                    <th>Email ID:</th>
                    <td><%=adm.getEmail()%></td>                
                </tr>
            </tbody>
        </table>
    </body>
</html>
