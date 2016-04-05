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
          
        </script>>
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
                            <tr>
                                <td><button onclick="count()" type="reset" >RESET</button></td>
                                 <td colspan="2" ><button type="button" >FORGOT PASSWORD</button></td>
                            </tr>
                            <tr colspan="2" >
                                <td colspan="2" ><a href=""VIEW RESULT</td>
                            </tr>
                        </body>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>