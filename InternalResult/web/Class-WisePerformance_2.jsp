
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCENTRIC-Class wise Performance</title>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <%int i=0;%>
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
            #tota{
                background: aqua;
            }
        </style>
        <script>
            function load() {
            var i=0;
            while(i<<%<i%>)
                var total = document.getElementById("tota"+i).value;
                var per = (total / 5);

                document.getElementById("per").value = per;
            }
        </script>
    </head>
    <body id="body" onload="load()">

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
                                    <input type="text" value="<s:property value="total"/>" id="tota<%=i++%>"/>
                                </td>

                                <td>500</td>

                                <td>
                                    <input type="text" disabled="true" style="border: 0px" id="per" value=""/>%
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