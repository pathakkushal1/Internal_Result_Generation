<%-- 
    Doc/* global __UNKNOWN__passwood */

ument   : student
    Created on : Jun 21, 2015, 1:00:26 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="nwp">
        <div id="container">
            <div id="cnt2">
                <center>
                    <table id="log4" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th id="thb" style="font-weight: bolder; font-size: 1.0em">Student Id</th>
                                <th id="thb" style="font-weight: bolder; font-size: 1.0em">Name</th>
                                <th id="thb" style="font-weight: bolder; font-size: 1.0em">Department</th>
                                <th id="thb" style="font-weight: bolder; font-size: 1.0em">Email Id</th>
                                <th id="thb" style="font-weight: bolder; font-size: 1.0em">Batch</th>
                                <th id="thb" style="font-weight: bolder; font-size: 1.0em">Contact</th>
                                <th id="thb" style="font-weight: bolder; font-size: 1.0em">Address</th>
                                <th id="thb" style="font-weight: bolder; font-size: 1.0em">Delete</th>                            
                            </tr>
                        </thead>
                        <tbody>
                            <s:iterator value="list">
                                <tr>
                                    <td><s:property value="stdRollnumber"/></td>
                                    <td><s:property value="stdName"/></td>
                                    <td><s:property value="stdBranch"/></td>
                                    <td><s:property value="stdEmail"/></td>
                                    <td><s:property value="stdBatch"/></td>
                                    <td><s:property value="stdContact"/></td>
                                    <td><s:property value="stdAddress"/></td>
                                    <td>
                                        <s:url action="deleteFaculty" id="df">
                                            <s:param name="facid" value="facid"></s:param>
                                        </s:url>
                                        <s:a href="%{df}">Delete</s:a>
                                        </td>
                                    </tr>
                            </s:iterator>
                        </tbody>
                    </table>
                </center>
            </div>
            <div id="cnt2">
                <table id="log2" border="0" cellpadding="1">
                    <tr>
                        <td> <a href="addStudent.jsp">Add Student</a></td>
                        <td>
                            <form action="updateStudentData">
                                <li>
                                    <a href="#" onclick="getId()">Update Details Update</a>
                                    <ul> 
                                        <li >
                                            <input type="text"  name ="stdRollnumber" size="15" value="" placeholder="Student Roll No"/>
                                            <button type="submit" >GO</button>
                                        </li>
                                    </ul>
                                </li> 
                            </form> 
                        </td>
                        <td>
                            <form action="updateStudentE.jsp">
                                <li>
                                    <a href="updateStudentE" onclick="getId()">Update Ex Update</a>
                                    <ul> 
                                        <li>
                                            <input type="text" name ="stdid" value="" placeholder="Student Roll No"/> 
                                            <button type="submit" size="5" >GO</button>
                                        </li>
                                    </ul>
                                </li> 
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
