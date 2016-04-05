<%-- 
    Document   : makePayment
    Created on : Jul 11, 2015, 7:17:42 PM
    Author     : Kushal
--%>

<%@page import="dto.Stdfine"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make Payment</title>
        <link href="imcss.css" rel="stylesheet" type="text/css">
    </head>
    <body id="body">
    <center>
        <h4>You have some Fine due click Buy Now and</h4><br/>
        <h4>At next Page enter the amount in Dollars</h4>
        <%
            Stdfine fine = (Stdfine) session.getAttribute("fine");
        %>
        <input type="text" id="setter" value="<%=fine.getAmount()%>">
        <div class="product">            

            <div class="name">

            </div>

            <div class="btn">
                <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" name="frmPayPal1">
                    <input type="hidden" name="business" value="emailID@gmail.com">
                    <input type="hidden" name="cmd" value="_xclick">
                    <input type="hidden" name="item_name" value="Fine">
                    <input type="hidden" name="item_number" value="1">
                    <input type="hidden" name="credits" value="510">
                    <input type="hidden" name="userid" value="<%=request.getParameter("qua")%>">
                    <input type="hidden" name="amount" value="<%=fine.getAmount()%>"/>">

                    <input type="hidden" name="no_shipping" value="1">
                    <input type="hidden" name="currency_code" value="USD">
                    <input type="hidden" name="handling" value="0">
                    <input type="hidden" name="cancel_return" value="http://localhost:8084/finalproject/error.jsp">
                    <input type="hidden" name="return" value="http://localhost:8084/finalproject/removeFine.jsp">
                    <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                    <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
                </form> 
            </div>
        </div>
    </center>
</body>
</html>
