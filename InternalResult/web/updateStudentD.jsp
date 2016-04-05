<%-- 
    Document   : updateStudentD
    Created on : Jun 21, 2015, 4:44:20 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body id="nwp">
        <%
            boolean flag = (boolean)session.getAttribute("check");
            if(!flag){
                session.setAttribute("msg", "Your Session Expire Please Login Again");
                response.sendRedirect("AdminLogin.jsp");
            }
        %>
        <div id="container">
            <div id="cnt2">
                <form action="updateStudentDetails">
                    
                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="12" id="thb" style="font-weight: bolder; font-size: 2.0em">
                                    UPDATE STUDENT DETAILS
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>Student Roll Number</th>
                                <td><input type="text" name="stdRollnumber" value="<s:property value="stdRollnumber"/>" /></td>
                            </tr>
                            <tr>
                                <th>Student Name</th>
                                <td><input type="text" name="stdName" value="<s:property value="stdDetails.stdName"/>" /></td>
                            </tr>
                            <tr>
                                <th>Student Department</th>
                                <td><input type="text" name="stdBranch" value="<s:property value="stdDetails.stdBranch"/>" /></td>
                            </tr>
                            <tr>
                                <th>Student Email</th>
                                <td><input type="text" name="stdEmail" value="<s:property value="stdDetails.stdEmail"/>" /></td>
                            </tr>
                             <tr>
                                <th>Student Semester</th>
                                <td><input type="text" name="stdSemester" value="<s:property value="stdDetails.stdSemester"/>" /></td>
                               </tr>
                            <tr>
                                <th>Student Batch</th>
                                <td><input type="text" name="stdBatch" value="<s:property value="stdDetails.stdBatch"/>" /></td>
                            </tr>
                            <tr>
                                <th>Student Contact</th>
                                <td><input type="text" name="stdContact" value="<s:property value="stdDetails.stdContact"/>" /></td>
                            </tr>

                            <tr>
                                <th>Student Address</th>
                                <td><input type="text" name="stdAddress" value="<s:property value="stdDetails.stdAddress"/>" /></td>
                            </tr>
                            <tr>
                                <th><button type="submit">UPDATE</button></th>
                                <th><button type="reset">RESET</button></th>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
