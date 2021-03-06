
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCENTRIC-Class wise Performance</title>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <style>
            #log5 {

                margin-left: auto;
                margin-right: auto;
                border-collapse: separate;
                //border-spacing: 20px;
                border-color: black;
                color: wheat;
                background-color: rgba(0,80,80,0.5);
                border-radius: 10px;
                font-size: 1.1em;
            }
        </style>
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
                session.setAttribute("msg", "Your Session Expired Please Login Again");
                response.sendRedirect("Login_with_forget.jsp");
            }
        %>
        
        <a href="SelectBranchSem.jsp" style="float:right; margin-right: 25px; margin-top: 5px; text-decoration:none;">        
            <h4>Back</h4>        
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
                <table id="log5" border="1" cellpadding="9px" cellspacing="5px">
                    <thead>            
                        <tr>
                            <th colspan="14" id="thb" style="font-weight: bolder; font-size: 2.0em">
                                CLASS PERFORMANCE
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Semester</td>
                            <td>Roll No.</td>
                            <td><s:property value="sub.sub1" /></td>
                            <td><s:property value="sub.sub2" /></td>
                            <td><s:property value="sub.sub3" /></td>
                            <td><s:property value="sub.sub4" /></td>
                            <td><s:property value="sub.sub5" /></td>
                            <td><s:property value="sub.pra1" /></td>
                            <td><s:property value="sub.pra2" /></td>
                            <td><s:property value="sub.pra3" /></td>
                            <td><s:property value="sub.pra4" /></td>
                            <td>TotalObtained</td>
                            <td>Total</td>
                            <td>Percentage</td>
                        </tr>

                        <s:iterator value="list">
                            <tr>
                                <td>
                                    <s:property value="semester" />
                                </td>

                                <td>
                                    <s:property value="stdRoll" />
                                </td>

                                <td>
                                    <s:property value="sub1" />
                                </td>

                                <td>
                                    <s:property value="sub2" />
                                </td>

                                <td>
                                    <s:property value="sub3" />
                                </td>

                                <td>
                                    <s:property value="sub4" />
                                </td>

                                <td>
                                    <s:property value="sub5" />    
                                </td>

                                <td>
                                    <s:property value="pra1" />    
                                </td>

                                <td>
                                    <s:property value="pra2" />        
                                </td>

                                <td>
                                    <s:property value="pra3" />    
                                </td>

                                <td>
                                    <s:property value="pra4" />    
                                </td>

                                <td>
                                    <s:property value="total" />
                                </td>

                                <td>500</td>

                                <td>
                                    <s:property value="percentage"/>%
                                </td>

                            </tr>
                        </s:iterator>


                        <tr>

                            <td colspan="2" align="right">Class Performance</td>
                            <td><s:property value="persub1"/>%</td>
                            <td><s:property value="persub2"/>%</td>
                            <td><s:property value="persub3"/>%</td>
                            <td><s:property value="persub4"/>%</td>
                            <td><s:property value="persub5"/>%</td>
                        </tr>

                </table>
            </div>
        </div>
    </body>
</html>