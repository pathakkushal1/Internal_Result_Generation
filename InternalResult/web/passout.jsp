<%-- 
    Document   : passout
    Created on : Jul 15, 2015, 6:36:15 PM
    Author     : Aditya Kasbekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Passouts</title>
        <link href="imcss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="nwp">
        <%
            boolean flag = (boolean) session.getAttribute("check");
            if (!flag) {
                session.setAttribute("msg", "Your Session Expire Please Login Again");
                response.sendRedirect("AdminLogin.jsp");
            }
        %>
        <div id="container">
            <div id="cnt2">
                <form>
                    <table id="log4" >  
                        <thead>
                            <tr>
                                <th colspan="6" id="thb" style="font-weight: bolder; font-size: 2.0em">
                                    PASS OUT STUDENTS
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Roll No.</th>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Name</th>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Batch</th>                            
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Address</th>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Pass Out Year</th>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Contact No.</th>
                        </tr>
                        <s:iterator value="list">
                            <tr>
                                <td><s:property value="stdroll"/></td>
                                <td><s:property value="stdName"/></td>
                                <td><s:property value="batch"/></td>
                                <td><s:property value="stdAddress"/></td>
                                <td><s:property value="passoutYear"/></td>
                                <td><s:property value="stdNumber"/></td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
