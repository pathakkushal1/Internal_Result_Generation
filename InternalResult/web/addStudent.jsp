<%-- 
    Document   : addStudent
    Created on : Jun 21, 2015, 2:54:46 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
                <br>
                <form action="addStudentDB">
                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="12" id="thb" style="font-weight: bolder; font-size: 2.0em">
                                    ADD NEW STUDENT
                                </th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td>Roll Number</td>
                                <td><input type="text" name="stdRollnumber" value="" /></td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td><input type="text" name="stdName" value="" /></td>
                            </tr>
                            <tr>
                                <td>Email ID</td>
                                <td><input type="text" name="stdEmail" value="" /></td>
                            </tr>
                            <tr>
                                <td>Department</td>
                                <td><input type="text" name="stdBranch" value="" /></td>
                            </tr>
                            <tr>
                                <td>Semester</td>
                                <td><input type="text" name="stdSemester" value="" /></td>
                            </tr>
                            <tr>
                                <td>Batch</td>
                                <td><input type="text" name="stdBatch" value="" /></td>
                            </tr>
                            <tr>
                                <td>Contact</td>
                                <td><input type="text" name="stdContact" value="" /></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td><input type="text" name="stdAddress" value="" /></td>
                            </tr>
                            <tr>
                                <td><button type="submit" />ADD</td>
                                <td><button type="reset" />RESET</td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div id="cnt2">
                <form action="addStudentExcel" method="POST" enctype="multipart/form-data">
                    <table id="log2" border="0" >
                        <thead>            
                            <tr>
                                <th colspan="2" id="thb" style="font-weight: bolder; font-size: 1.4em">
                                    OR, ADD MULTIPLE ENTRIES <br/>FROM AN EXCEL SHEET
                                </th>
                            </tr>
                        </thead>
                        <tbody> 
                            <tr>
                                <th><input type="file" name="myExcelSheet" value=""></th>
                                <th><button type="submit">Add Faculty</button></th>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
