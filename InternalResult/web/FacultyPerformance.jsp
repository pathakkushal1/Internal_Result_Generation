<%-- 
    Document   : FacPerformance
    Created on : Jul 4, 2015, 4:23:30 PM
    Author     : Aditya Kasbekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCENTRIC-Faculty Performance</title>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
    </head>
    <body id="body">
        <div id="container">

            <div id="top"> 
                ACCENTRIC
            </div>
            <div id="cnt2">
                <table id="log2" border="0" cellpadding="1">
                    <thead>            
                        <tr>
                            <th colspan="2" id="thb" style="font-weight: bolder; font-size: 1.4em">
                                FACULTY PERFORMANCE
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Department</td>
                            <td>
                                <select>
                                    <option value="SELECT">SELECT</option>
                                    <option value="CS">CS</option>
                                    <option value="IT">IT</option>
                                    <option value="EC">EC </option>
                                    <option value="ME">ME </option>
                                    <option value="CE">CE</option>
                                    <option value="EX">EX </option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <a href="FacultyName.jsp" target="_blank">
                                    <button type="submit">OK</button>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
