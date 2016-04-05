
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCENTRIC-Class wise Performance</title>
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
                <form action="checkbranchsem" method="post">
                    <table id="log2" border="0" >
                        <thead>            
                            <tr>
                                <th colspan="2" id="thb" style="font-weight: bolder; font-size: 1.4em">
                                    TO GET <br/>CLASS PERFORMANCE
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Branch</td>
                                <td><select name="branch">
                                        <option value="SELECT">SELECT</option>
                                        <option value="CS">CS</option>
                                        <option value="IT">IT</option>
                                        <option value="EC">EC</option>
                                        <option value="ME">ME</option>
                                        <option value="CE">CE</option>
                                        <option value="EX">EX
                                        </option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Semester</td>
                                <td><select name="semester">
                                        <option value="0">SELECT</option>
                                        <option value="1">I</option>
                                        <option value="2">II</option>
                                        <option value="3">III</option>
                                        <option value="4">IV</option>
                                        <option value="5">V</option>
                                        <option value="6">VI</option>
                                        <option value="7">VII</option>
                                        <option value="8">VIII</option> 
                                    </select>
                                </td> 
                            </tr>
                            <tr >
                                <td colspan="2" >
                                        <button type="submit">SUBMIT</button>
                                    </td>
                                </tr>
                        </tbody>
                    </table>
                </form>
            </div>
    </body>
</html>
