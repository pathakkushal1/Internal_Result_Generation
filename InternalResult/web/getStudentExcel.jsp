<%-- 
    Document   : getStudentExcel
    Created on : Jun 21, 2015, 3:12:57 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="container">
            <div id="cnt2">
                <br>
                <form action="addStudentExcel" method="POST" enctype="multipart/form-data">
                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="12" id="thb" style="font-weight: bolder; font-size: 2.0em">
                                    ADD STUDENTS
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> Branch</td>
                                <td><input type="text" name="branch" value="" size="15" required=""/></td>
                            </tr>
                            <tr>
                                <td> Semester</td>
                                <td><input type="text" name="semester" value="" size="15" required/></td>
                            </tr>
                            <tr>
                                <td> Year</td>
                                <td><input type="text" name="year" value="" size="15" required/></td>
                            </tr>
                            <tr>
                                <td> Excel Sheet</td>
                                <!--<td><input type="text" name="path" value="No File Chosen" size="15" readonly="readonly" required/></td>-->
                                <td><s:file name="myExcelSheet" /></td>
                            </tr>
                            <tr>
                                <td><button type="submit" >SUBMIT</button></</td>
                                <td><button type="reset" >RESET</button></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
