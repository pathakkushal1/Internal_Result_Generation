<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCENTRIC-Login</title>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <script>
            var number=0;
            function count(){
                number++;
                if(number==3){
                     window.location="AdminLogin.jsp";
                }
            }
            
            function check() {
                var userid = prompt("Enter Your username : ","");
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
            <div id="cnt2">
                <br>
                <form method="post">
                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="2" id="thb" style="font-weight: bolder; font-size: 1.4em">
                                    LOGIN
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Username</td>
                                <td><input id="username" placeholder="username" type="text" name="name" value="" /></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input placeholder="***********" type="password" name="password" value="" /></td>
                            </tr>
                            <tr><td><input type="submit" value="FACULTY LOGIN" formaction="checkfacultylogin"></td>
                                <td><input type="submit" value="OTHER LOGIN" formaction="checkotherlogin"></td>
                            </tr>
                            <tr>
                                <td><button onclick="count()" type="reset" >RESET</button></td>
                                <td><button type="button" onclick="check()" title="If you've forgotten your current password, we'll send you the new password at your registered email id.">FORGOT PASSWORD?</button></td>
                            </tr>
                            <tr colspan="2" >
                                <td colspan="2" ><a href="StudentResultView.jsp">VIEW RESULT</td>
                            </tr>                            
                            <tr  colspan="2" >
                                <td colspan="2"><font style="color: red">Please Enter Correct Username and Password</td>
                            </tr>
                        </body>
                    </table>
                </form>
            </div>
        </div>
        <s:form action="forgetfaculty" id="form">
                    <input name="name" id="useridF" value="" style="display: none"/>
                </s:form>
    </body>
</html>
