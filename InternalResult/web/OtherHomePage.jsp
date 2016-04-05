
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags"  prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCENTRIC-Others</title>
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
            <div id="top"> 
                ACCENTRIC
            </div>
            <br>
            <div id="cnt2">
                <br>
                <form>
                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="2" id="thb" style="font-weight: bolder; font-size: 1.4em">
                                    OTHERS
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> Name</td>
                                <td><s:property value="othersname"/></td>
                            </tr>
                            <tr><td>Post</td>
                                <td><s:property value="otherspost"/></td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="SelectBranchSem.jsp">
                                        <button type="button" >CLASS-WISE</button>
                                    </a>
                                </td>
                                <th colspan="2"  >
                                    <a href="StudentResultView.jsp">
                                        <button type="button" >STUDENT</button>
                                    </a>
                                </th>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
    </body>
</html>
