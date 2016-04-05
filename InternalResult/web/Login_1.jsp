<%-- 
    Document   : Login
    Created on : 2 Jul, 2015, 10:51:35 PM
    Author     : gaganmittal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCENTRIC-Login</title>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
    </head>
    <body id="body">
        <div id="container">

            <div id="top"> 
                ACCENTRIC
            </div>
            <div id="cnt2">
                <br>
                <form>
                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="2" id="thb" style="font-weight: bolder; font-size: 1.4em">
                                    LOGIN
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>User Type</td>
                                <td><select name="FAULTY TYPE">
                                        <option>FACULTY</option>
                                        <option>OTHERS</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Username</td>
                                <td><input placeholder="username" type="text" name="Name" value="" /></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input placeholder="***********" type="password" name="Password" value="" /></td>
                            </tr>
                            <tr>
                                <td><button type="reset" >RESET</button></td>
                                <td><button type="submit">LOGIN</button></td>
                            </tr>
                            <tr >
                                <th colspan="2" ><button type="button" >FORGOT PASSWORD</button></th>
                            </tr>
                            <tr colspan="2" >
                                <th colspan="2" ><button type="button" >VIEW RESULT</button></th>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>