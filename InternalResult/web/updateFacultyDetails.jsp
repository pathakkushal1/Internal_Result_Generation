<%-- 
    Document   : updateFaculty
    Created on : Jul 2, 2015, 8:57:24 PM
    Author     : Aditya Kasbekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Faculty</title>
    </head>
    <body id="nwp">
        <%
            boolean flag = (boolean) session.getAttribute("check");
            if (!flag) {
                session.setAttribute("msg", "Your Session Expire Please Login Again");
                response.sendRedirect("AdminLogin.jsp");
            }
        %>
        <div id="cnt2">        
            <form action="updateFacultyData">
                <table id="log2" border="0" >
                    <tbody>   
                        <tr>
                            <th>Faculty Id</th>
                            <td><input type="text" name="factId" value="<s:property value="fact.factId"/>" ></td>
                        </tr>
                        <tr>
                            <th>Faculty Name</th>
                            <td><input type="text" name="facultyName" value="<s:property value="fact.facultyName"/>" ></td>
                        </tr>
                        <tr>
                            <th>Faculty Department</th>
                            <td><input type="text" name="facultyDept" value="<s:property value="fact.facultyDept"/>" ></td>
                        </tr>
                        <tr>
                            <th>Faculty Email</th>
                            <td><input type="email" name="facultyEmail" value="<s:property value="fact.facultyEmail"/>" ></td>
                        </tr>
                        <tr>
                            <th>Faculty Password</th>
                            <td><input type="text" name="facultyPass" value="<s:property value="fact.facultyPass"/>" ></td>
                        </tr>
                        <tr>
                            <th>Faculty Address</th>
                            <td><input type="text" name="facultyAddress" value="<s:property value="fact.facultyAddress"/>" ></td>
                        </tr>
                        <tr>
                            <th><button type="submit">Submit</button></th>
                            <th><button type="reset">Reset</button></th>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>  
    </body>
</html>
