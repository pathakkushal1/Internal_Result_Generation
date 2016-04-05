<%-- 
    Document   : updateStudentE
    Created on : Jun 21, 2015, 3:16:41 PM
    Author     : Kushal
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <script>
            //var sub = document.getElementById("db1").value;

            function add() {
                var dbEnter = "", dbEnterF = "";
                var count = document.getElementById("number").value;
                var roll = document.getElementById("roll").value;
                var nowData = [];
                var subId = [];

                for (var x = 0; x < count; x++) {
                    nowData[x] = document.getElementById("ch" + x).checked;
                    subId[x] = document.getElementById("li" + x).value;
                }
                for (var k = 0; k < count; k++) {
                    if (nowData[k] == true) {
                        dbEnter += subId[k];
                        dbEnter += "_";
                    }
                }
                document.getElementById("enterDbString").value = dbEnter;
                document.getElementById("stdRollEx").value = roll;
                document.getElementById("submitForm").submit();
            }
        </script>
    </head>
    <body id="nwp">
        
        <div id="container">
            <div id="cnt2">
                <form action="updateStudentE">
                    <table id="log2" border="0" cellpadding="1">
                        <thead>            
                            <tr>
                                <th colspan="12" id="thb" style="font-weight: bolder; font-size: 2.0em">
                                    UPDATE STUDENT'S<br/> EX RECORD
                                </th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                String sub = (String) session.getAttribute("sub");
                                String sub2 = (String) session.getAttribute("sub2");
                            %>
                            <tr>
                                <th>Student's Roll No.</th>
                                <td><%=sub2%></td>
                            </tr>
                            <%
                                String full = "";
                                StringTokenizer sem = new StringTokenizer(sub, ",");
                                if (sem.hasMoreTokens()) {
                                    List<String> list = new ArrayList<String>();
                                    while (sem.hasMoreElements()) {
                                        StringTokenizer sem1 = new StringTokenizer(sem.nextToken(), "_");
                                        while (sem1.hasMoreElements()) {
                                            String a = sem1.nextToken();
                                            full = full + a;
                                            list.add(a);
                                        }

                                    }
                                    int n = list.size();
                                    for (int i = 0; i < n; i++) {
                            %>
                        <input style="display: none" id="roll" value="<%=sub2%>"/>
                        <input style="display: none" id="number" value="<%=n%>"/>
                        <tr>
                            <td>
                                <input id="ch<%=i%>" type="checkbox" name="subex" value="ON"  />BACK
                            </td>
                            <td>
                                <%= list.get(i)%>
                                <input style="display: none" id="li<%=i%>" value="<%= list.get(i)%>" />
                            </td>
                        </tr>
                        <%}%>
                        <tr>
                            <th colspan="2"><button type="button" onclick="add()">UPDATE</button></th>
                        </tr>
                        <%    } else {
                        %>
                        <tr>
                            <th colspan="2">NO BACKLOGS EXISTS</th>
                        </tr>   
                        <%}%>

                        </tbody>
                    </table>
                </form>  
            </div>
        </div>

        <form action="updateExDetails" id="submitForm">
            <input style="display: none" id="enterDbString" name="studentExDetailscol" />
            <input style="display: none" id="stdRollEx" name="stdRollEx"/>
        </form>

    </body>
</html>
