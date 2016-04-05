<%-- 
    Document   : resultUpload
    Created on : Jun 21, 2015, 11:10:16 AM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css"/>
        <title>Result Upload</title>
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
                <form action="viewResult" method="post" target="fr">
                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="12" id="thb" style="font-weight: bolder; font-size: 2.0em">
                                    VIEW RESULT
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Roll No:</td>
                                <td><input required="required" type="text" id="rolno" name="stdRoll"></td>
                                <td>Semester:</td>
                                <td>
                                    <select name="semester">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                    </select>
                                </td>
                                <td>
                                    <button type="submit"  onclick="validate()" name="gen_result" >VIEW RESULT</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <br/><br/><br/>
                <form action="uploadResult" method="POST" enctype="multipart/form-data">
                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="12" id="thb" style="font-weight: bolder; font-size: 2.0em">
                                    UPLOAD RESULT
                                </th>
                            </tr>
                        </thead>
                        <tbody>                            
                                <td> File</td>
                                <td><input type="file" name="myExcelSheet" id="pa" /></td>
                            </tr>
                            <tr>
                                <td><button type="submit" >SUBMIT</button></td>
                                <td><button type="reset" >RESET</button></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <br/><br/><br/>
                <form action="deleteResult" method="post" >
                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="12" id="thb" style="font-weight: bolder; font-size: 2.0em">
                                    DELETE RESULT
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                             <tr>
                                <th>
                                    <select type="text" name="branch">
                                        <option>BRANCH SELECTION</option>
                                        <option>CS</option>
                                        <option>IT</option>
                                        <option>MECH</option>
                                        <option>EX</option>
                                        <option>EC</option>
                                        <option>EI</option>
                                        <option>CIVIL</option>
                                        <option>CHEM</option>
                                    </select>
                                </th>
                                <th>
                                    <select type="number" name="semester">
                                        <option>SELECT SEMESTER</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                    </select>
                                </th>
                                <th><button type="submit">GO!</button></th>
                            </tr>
                        </tbody>
                    </table>
                </form>
                 <%
                    String msg = (String) session.
                            getAttribute("remsg");
                    if (msg != null) {%>
                <h3 style="color: brown"><%=msg%></h3>
                <%session.setAttribute("msg", null);}
                %>
                <br/>
            </div>
        </div>
    </body>
</html>
