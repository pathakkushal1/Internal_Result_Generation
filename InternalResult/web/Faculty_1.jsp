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
                <form>
                    <table id="log4" >  
                        <tr>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Faculty Id</th>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Name</th>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Department</th>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Email Id</th>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Address</th>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Password</th>
                            <th id="thb" style="font-weight: bolder; font-size: 1.0em">Operations</th>
                        </tr>
                        <s:iterator value="list">
                            <tr>
                                <td><s:property value="factId"/></td>
                                <td><s:property value="facultyName"/></td>
                                <td><s:property value="facultyDept"/></td>
                                <td><s:property value="facultyEmail"/></td>
                                <td><s:property value="facultyAddress"/></td>
                                <td><s:property value="facultyPass"/></td>
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
                </form>
                <br/>
                <table id="log2" border="0" cellpadding="1">
                    <tr>
                        <th><h3><a href="addFaculty.jsp">Add Faculty</a></h3></th>
                        <td>
                            <form action="updateFacultyDataGet">
                                <li>
                                    <h3>Update Faculty<br/> Details</h3>
                                    <ul> 
                                        <li >
                                            <input required="required" type="text"  name ="factId" size="15" value="" placeholder="Student Roll No"/>
                                            <button type="submit" >GO</button>
                                        </li>
                                    </ul>
                                </li> 
                            </form> 
                        </td>
                        <td>
                            <form action="updateFacultySubject">
                                <li>
                                    <h3>Update Subject<br/> Details</h3>
                                    <ul> 
                                        <li>
                                            <input required="required" type="text" name ="factId" value="" placeholder="Student Roll No"/> 
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