<%-- 
    Document   : addFaculty
    Created on : Jul 2, 2015, 8:46:47 PM
    Author     : Aditya Kasbekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Faculty</title>
    </head>
    <body id="nwp">
        <%
            boolean flag = (boolean)session.getAttribute("check");
            if(!flag){
                session.setAttribute("msg", "Your Session Expire Please Login Again");
                response.sendRedirect("AdminLogin.jsp");
            }
        %>
        <div id="cnt2">  
            <form action="addFaculty">
                <table id="log2" border="0" >
                    <thead>            
                        <tr>
                            <th colspan="2" id="thb" style="font-weight: bolder; font-size: 1.4em">
                                FOR ADDING SINGLE FACULTY
                            </th>
                        </tr>
                    </thead>
                    <tbody>   
                        <tr>
                            <th>Faculty Id</th>
                            <td><input type="text" name="facultyId" value="" ></td>
                        </tr>
                        <tr>
                            <th>Faculty Name</th>
                            <td><input type="text" name="facultyName" value="" ></td>
                        </tr>
                        <tr>
                            <th>Faculty Department</th>
                            <td><input type="text" name="facultyDept" value="" ></td>
                        </tr>
                        <tr>
                            <th>Faculty Email</th>
                            <td><input type="email" name="facultyEmail" value="" ></td>
                        </tr>
                        <tr>
                            <th>Faculty Password</th>
                            <td><p>Password will be send<br> to Faculty Email Address</p></td>
                        </tr>
                         <tr>
                            <th>Faculty Id</th>
                            <td><input type="text" name="facultyAddress" value="" ></td>
                        </tr>
                        <tr>
                            <th><button type="submit">Submit</button></th>
                            <th><button type="reset">Reset</button></th>
                        </tr>
                    </tbody>
                </table>
            </form>
            <br/>
            <form action="addFacultyExcel" method="POST" enctype="multipart/form-data">
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
    </body>
</html>
