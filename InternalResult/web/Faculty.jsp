<%-- 
    Document   : Faculty
    Created on : Jul 2, 2015, 5:07:18 PM
    Author     : Aditya Kasbekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty</title>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            boolean flag = (boolean) session.getAttribute("check");
            if (!flag) {
                session.setAttribute("msg", "Your Session Expire Please Login Again");
                response.sendRedirect("AdminLogin.jsp");
            }
        %>
        <div id="container">
            <div id="cnt2">
                <table id="log2" >  
                    <tr>
                        <th>Faculty Id</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Email Id</th>
                        <th>Operations</th>
                    </tr>
                    <s:iterator value="list">
                        <tr>
                            <td><s:property value="facultyId"/></td>
                            <td><s:property value="facultyName"/></td>
                            <td><s:property value="facultyDept"/></td>
                            <td><s:property value="facultyEmail"/></td>
                            <td>
                                <s:url action="deleteFaculty" id="df">
                                    <s:param name="facid" value="facid"></s:param>
                                </s:url>
                                <s:a href="%{df}">Delete
                                </s:a> 
                            </td>
                        </tr>
                    </s:iterator>
                </table>
                <br/>
 
                    <table id="log3">
                        <tr>
                            <th><a href="addFaculty.jsp">Add Faculty</a></th>
                            <td>
                                <form action="updateFacultyDataGet">
                                    <li>
                                        <a href="#" onclick="getId()">Update Details</a>
                                        <ul> 
                                            <li >
                                                <input type="text"  name ="factId" size="15" value="" placeholder="Student Roll No"/>
                                                <button type="submit" >GO</button>
                                            </li>
                                        </ul>
                                    </li> 
                                </form> 
                            </td>
                            <td>
                                <form action="updateFacultySubject">
                                    <li>
                                        <a href="#" onclick="getId()">Update Subject Details</a>
                                        <ul> 
                                            <li>
                                                <input type="text" name ="factId" value="" placeholder="Student Roll No"/> 
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