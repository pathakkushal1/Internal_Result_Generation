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
         <%
            boolean flag = (boolean) session.getAttribute("check");
            if (!flag) {
                session.setAttribute("msg", "Your Session Expire Please Login Again");
                response.sendRedirect("AdminLogin.jsp");
            }
        %>
        <div id="container">
            <div id="cnt2">
                <form action="getStudentDB" method="POST">
                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th>Branch</th>
                                <th>Semester</th>                        
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>
                                    <select type="text" name="stdBranch">
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
                                    <select type="number" name="stdSemester">
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
                </form>
            </div>
            <div id="cnt2">
                <table id="log2" border="0" cellpadding="1">
                    <tr>
                        <td><h3> <a href="addStudent.jsp">Add Student</a></h3></td>
                        <td>
                            <form action="updateStudentData">
                                <li>
                                    <h3>Update Details</h3>
                                    <ul> 
                                        <li >
                                            <input required="required" type="text"  name ="stdRollnumber" size="15" value="" placeholder="Student Roll No"/>
                                            <button type="submit" >GO</button>
                                        </li>
                                    </ul>
                                </li> 
                            </form> 
                        </td>
                        <td>
                            <form action="updateStudentEx">
                                <li>
                                    <h3>Update Ex Details</h3>
                                    <ul> 
                                        <li>
                                            <input required="required" type="text" name ="stdRollEx" value="" placeholder="Student Roll No"/> 
                                            <button type="submit" size="5" >GO</button>
                                        </li>
                                    </ul>
                                </li> 
                            </form>                            
                        </td>
                    </tr>
                </table>
                <br/><br/>
                <table id="log2" border="0" cellpadding="1">
                    <tr>
                    <th>
                    <form action="updateSem" method="POST">
                        <td><button type="submit" >UPDATE SEMESTER</button></td>
                    </form>
                    </th>
                    <th>    
                    <form action="passouts" method="POST">
                        <td><button type="submit" >PASS OUT STUDENT</button></td>
                    </form>
                    </th>
                    <th>
                    <form action="addFine.jsp" method="POST">
                        <td><button type="submit" >Add Fine</button></td>
                    </form>
                    </th>    
                    </tr>


                </table>
            </div>
        </div>
    </body>
</html>
