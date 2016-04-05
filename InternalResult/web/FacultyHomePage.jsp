
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCENTRIC-Faculty Home Page</title>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <script>
            function logoutfaculty() {
                window.location = "Login_with_forget.jsp";
            }

        </script>
    </head>
    <body id="body">
        <%
            boolean flag = (boolean) session.getAttribute("check");
            if (!flag) {
                session.setAttribute("msg", "Your Session Expire Please Login Again");
                response.sendRedirect("Login_with_forget.jsp");
            }
        %>
        
        <a href="Login_with_forget.jsp" style="float:right; margin-right: 25px; margin-top: 5px; text-decoration:none;">        
            <h4>HOME</h4>        
        </a>        
        <a href="logoutfaculty" onclick="logoutfaculty()" style="float:right; margin-right: 25px; margin-top: 5px; text-decoration:none;">        
            <h4>LOGOUT</h4>        
        </a>
        
        <div id="container">

            <div id="top" align="center"> 
                ACCENTRIC
            </div>
            <div id="cnt2">
                <br>
                    <table id="log2" border="0"  cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="2" id="thb" style="font-weight: bolder; font-size: 1.4em">
                                    FACULTY DETAILS
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Name</td>
                                <td><s:property value="facultyname.facultyName"/></td>
                            </tr>
                            <tr>
                                <td>Department</td>
                                <td><s:property value="facultyname.facultyDept"/></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="SelectBranchSem.jsp">
                                        <button type="submit" >VIEW RESULT</button>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
            </div>
        </div>
    </body>
</html>
