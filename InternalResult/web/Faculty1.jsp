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
                <table id="log2" border="0" cellpadding="1">
                    <thead>            
                        <tr>
                            <th colspan="2" id="thb" style="font-weight: bolder; font-size: 1.4em">
                                VIEW FACULTY
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <form action="facAll">
                                    <table id="log2" >  
                                        <button type="submit">ALL FACULTY</button>
                                    </table>
                                </form>
                            </td>
                            <td>
                                <form action="facBW">
                                    <table id="log2" > 
                                        <select style="background: transparent; color: darksalmon;" type="text" name="facultyDept">
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
                                        <button type="submit">BRANCH-WISE</button>
                                    </table>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>
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
                                            <input required="required" type="text"  name ="factId" size="15" value="" placeholder="Enter Faculty ID"/>
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
                                            <input required="required" type="text" name ="factId" value="" placeholder="Enter Faculty ID"/> 
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