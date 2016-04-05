<%-- 
    Document   : removeFine
    Created on : Jul 11, 2015, 8:02:49 PM
    Author     : Kushal
--%>

<%@page import="dto.Stdfine"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 

        <script>
            function sub() {
                document.getElementById("fo").submit();
            }
            document.getElementById("fo").submit();
        </script>
    </head>
    <body>
        <script>  document.getElementById("fo").submit();
        </script>

        <%
            Stdfine stdF = (Stdfine) session.getAttribute("fine");
            stdF.setAmount((long) 0);
        %>

        <h3>If you are not redirected in next 10sec </h3><button type="button" onclick="sub()" value="click Here">Click Here</button>
        <form action="removeFineF" id="fo">
            <input type="hidden" name="stdRollN" value="<%=stdF.getStdRollN()%>">
            <input type="hidden" name="amount" value="<%=0%>">
        </form> 
    </body>
</html>
