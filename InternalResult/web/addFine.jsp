<%-- 
    Document   : addFine
    Created on : Jul 12, 2015, 2:31:56 AM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body style="background: transparent">
        <div id="cnt2">
            <br>
            <form action="addStudentFine">
                <table id="log2" border="0" cellpadding="1">
                    <thead>            
                        <tr>
                            <th colspan="12" id="thb" style="font-weight: bolder; font-size: 2.0em">
                                ADD Fine on STUDENT 
                            </th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td>Roll Number</td>
                            <td><input type="text" name="stdRollN" value="" /></td>
                        </tr>
                        <tr>
                            <td>Fine</td>
                            <td><input type="text" name="amount" value="" /></td>
                        </tr><tr>
                            <td><button type="submit" />ADD</td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
