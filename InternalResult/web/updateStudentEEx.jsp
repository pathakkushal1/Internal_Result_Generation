<%-- 
    Document   : updateStudentE
    Created on : Jun 21, 2015, 3:16:41 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
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
                            String rn = (String) session.getAttribute("sub3");
                        %>
                        <tr>
                            <th>Student's Roll No.</th>
                            <td><%=rn%></td>
                        </tr>
                        <tr>
                            <th colspan="2">NO BACKLOG EXISTS</th>
                        </tr>   
                    </tbody>
                </table>
            </form>  
        </div>
    </div>
</body>
</html>
