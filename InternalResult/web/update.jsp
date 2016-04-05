<%-- 
    Document   : update
    Created on : Jun 21, 2015, 11:57:02 AM
    Author     : Kushal
--%>

<%@page import="dto.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Admin adm = (Admin) session.getAttribute("Stdobject");


        %>
        <link href="imcss.css" rel="stylesheet" type="text/css"/><style>
            #ph {
                background-repeat: no-repeat;
                background-position: 50%;
                border-radius: 50%;
                width: 300px;
                height: 300px;
            }
            #ph input{
                margin-top: 250px;
                margin-left: 75px;
                display: none;
            }
            #ph:hover input{
                display: block;
            }
        </style>
        <script>
            function valid() {
                var password = prompt("Please enter your Current Password", "Password");
                if (password == "<%=adm.getPassword()%>") {
                    document.getElementById("sub").disabled = false;
                    document.getElementById("cha").disabled = true;
                    document.getElementById("userid").disabled = false;
                    document.getElementById("emailid").disabled = false;
                    document.getElementById("password").disabled = false;

                } else {
                    alert("Password is incorrect");
                }

            }
            function upload() {
                document.getElementById("formPhoto").submit();
            }
        </script>
    </head>
    <body id="nwp"> 
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.4";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            <%
                boolean flag = (boolean) session.getAttribute("check");
                if (!flag) {
                    session.setAttribute("msg", "Your Session Expire Please Login Again");
                    response.sendRedirect("AdminLogin.jsp");
                }
            %>

        <div id="container">    
            <div id="cnt2">
                <form id="formPhoto" action="uploadAdminPhoto"method="post" enctype="multipart/form-data">
                    <center>

                        <%  if (adm.getPicName() == null) {
                                adm.setPicName("pro1.png");
                            }
                        %>
                        <div id="ph" style="background: url(<%=adm.getPicName()%>)">
                            <input type="hidden" name="userid" value="<%=adm.getUserid()%>" />
                            <a> <input onchange="upload()" type="file" name="myE"/></a>
                        </div>

                    </center>
                </form>
                <form action="UpdateAdminData">

                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="12" id="thb" style="font-weight: bolder; font-size: 2.0em">
                                    CHANGE DETAILS
                                </th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td>Name</td>
                                <td><input type="text" name="userid" value="<%=adm.getUserid()%>" size="25" disabled="true" id="userid"/></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="password" name="password" value="*********" size="25" disabled="true" id="emailid"/></td>
                            </tr>
                            <tr>
                                <td>Email Id</td>
                                <td><input type="text" name="email" value="<%=adm.getEmail()%>" size="25" disabled="true" id="password"/></td>
                            </tr>
                            <tr>
                                <th><button type="button" id="cha" onclick="valid()">CHANGE</button></td>
                                <th><button type="submit" disabled="true" id="sub">SUBMIT</button></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <div class="fb-like" data-href="https://www.facebook.com/kushal.pathak.167" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>
            </div>
        </div>

    </body>
</html>
