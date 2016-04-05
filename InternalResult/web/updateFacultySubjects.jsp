<%-- 
    Document   : updateFacultySubject
    Created on : Jul 2, 2015, 9:23:50 PM
    Author     : Aditya Kasbekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Faculty</title>
        <script>
            function sub() {
                var fid = document.getElementById("fid").value;
                var fsub = document.getElementById("fsub").value;
                document.getElementById("factId").value = fid;
                document.getElementById("factSubDetail").value = fsub;
                document.getElementById("submitForm").submit();
            }
        </script>
    </head>
    <body id="nwp">
        <%
            boolean flag = (boolean) session.getAttribute("check");
            if (!flag) {
                session.setAttribute("msg", "Your Session Expire Please Login Again");
                response.sendRedirect("AdminLogin.jsp");
            }
        %>
        <%
            String fid = (String) session.getAttribute("f1");
            String fsub = (String) session.getAttribute("f2");
        %>
        <div id="cnt2">        
            <form>
                <table id="log2" border="0" >
                    <thead>            
                        <tr>
                            <th colspan="2" id="thb" style="font-weight: bolder; font-size: 1.4em">
                                INSERT THE<br/> SUBJECT CODES <br/>SEPARATED BY<br/> UNDERSCORE  
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>
                                Faculty ID: <%=fid%>
                                <input style="display: none" type="text" value="<%=fid%>" id="fid">
                            </th>
                        </tr>
                        <tr>
                            <td ><input type="text" value="<%=fsub%>" id="fsub"></td>
                        </tr>                        
                        <tr>
                            <th>
                                <button type="button" onclick="sub()">SUBMIT</button>
                                <button type="reset">RESET</button>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <form action="updateSubjectDetails" id="submitForm">
            <input style="display: none" id="factId" name="factId" />
            <input style="display: none" id="factSubDetail" name="factSubDetail"/>
        </form>
    </body>
</html>
