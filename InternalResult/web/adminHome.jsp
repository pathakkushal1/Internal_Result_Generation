<%-- 
    Document   : adminHome
    Created on : Jun 21, 2015, 9:48:31 AM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link href="imcss.css" rel="stylesheet" type="text/css"/>
        <style>
            h3:hover{
                  color: greenyellow;
            }
        </style>
        <script>
            function logout() {
                window.location = "AdminLogin.jsp";
            }

        </script>
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
            <div id="header">
                <div id="top"> 
                    ACCENTRIC
                </div>

                <a href="adminHome.jsp" style="float:right; margin-right: 25px; margin-top: -35px; text-decoration:none;">
                    <h4>HOME</h4>
                </a>
                <a href="logout" onclick="logout()" style="float:right; margin-right: 25px; margin-top: -35px; text-decoration:none;">
                    <h4>LOGOUT</h4>
                </a>


            </div>
            <div id="center" style="width:100%; height: 100%;">
                <div style="float:left; width:15%;" id="left">
                    <center>
                        <div id="nav">
                            <div ><a id="men" href="Faculty1.jsp" target="ifa"><h3>Faculty</h3></a> <br></div>
                            <div ><a id="men" href="student_1.jsp" target="ifa"><h3>Student</h3></a> <br></div>
                            <div ><a id="men" href="resultUpload.jsp" target="ifa"><h3>Result</h3></a> <br></div>
                            <div ><a id="men" href="update.jsp" target="ifa"><h3>Update</h3></a> <br></div>
                            <div ><a id="men" href="Aboutus.html" target="ifa"><h3>About us</h3></a> <br></div>
                            <div ><a id="men" href="ContactUs.jsp" target="ifa"><h3>Contact Us</h3></a> <br></div>
                        </div>
                    </center>
                </div>
                <div style="float:right; width:85%; height: 800px;" id="right">
                    <iframe name="ifa" frameBorder style="width: 100%; height: 100%" src="myProfile.jsp">
                    </iframe>
                </div>
            </div>
            <div id="footer"></div>
        </div>
    </body>
</html>
