<%-- 
    Document   : AdminLogin
    Created on : Jun 21, 2015, 9:21:34 AM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Login</title>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <script>
            function check() {
                var userid = prompt("Enter Your userid : ","");
                document.getElementById("useridF").value = userid;
                document.getElementById("form").submit();
            }
        </script>

    </head>
    <body id="body">
        <div id="container">
            <div id="top"> 
                ACCENTRIC
            </div>
            <br>
            <div id="cnt2">
                <br>
                <form action="admin" method="POST" >
                    <table id="log2" border="0" >
                        <thead>            
                            <tr>
                                <th colspan="2" id="thb" style="font-weight: bolder; font-size: 1.4em">
                                    ADMIN LOGIN
                                </th>
                            </tr>
                        </thead>
                        <tbody>                                    
                            <tr>
                                <td>Username</td>                          
                                <td><input required="required" placeholder="username" type="text" name="userid" value="" id="userid"/></td>                                        
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input required="required" placeholder="**********" type="password" name="password" value="" id="pass"/></td>
                            </tr>
                            <tr>
                                <th><button type="submit">SUBMIT</button></th>  
                                <th><button type="reset" >RESET</button></th>  
                            </tr>
                        </tbody>
                    </table>
                </form>
                <%
                    String msg = (String) session.
                            getAttribute("msg");
                    if (msg != null) {%>
                <h3 style="color: brown"><%=msg%></h3>
                <%session.setAttribute("msg", null);}
                %>
                <br/>
                <button type="button" onclick="check()" title="If you've forgotten your current password, we'll send you the new password at your registered email id.">FORGOT PASSWORD?</button>
            </div>    
        </div>
                <s:form action="forget" id="form">
                    <input name="userid" id="useridF" value="" style="display: none"/>
                </s:form>
    </body>
</html>
