<%-- 
    Document   : ContactUs
    Created on : Jul 12, 2015, 3:52:36 AM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <style>
            body{
                background: transparent;
            }
            input{
                background-color: cornsilk;
            }
            
            input.im{
                margin-bottom: 30px;
                margin-right: 40px;
                margin-left: 40px;
            }
            font.fm{
                margin-right: 210px;
                margin-left: 40px;
            }
            textArea.ms{
                margin-bottom: 10px;

                margin-left: 40px;
            }
            .main{
                alignment-adjust: central;
            }
            nem.msg{
                position: relative;
                bottom: 10%;
            }
            textarea{
                background-color: cornsilk;

            }
            textarea :hover{
                background-color:crimson;

            }
            .bu1{
                font-family: fantasy;
                font-size: 100%;
                font-style: italic;
                margin-right: 40px;
                margin-left: 140px;
                background-color: transparent;
                background-color: black;
                width: 20em;  height: 2em;
            }
            .bu1:hover{
                 background-color:crimson;
            }
        </style>
    </head>
    <body>
        <form action="contactUs">
            <div class="main">
                <h2 class="well">Contact Us</h2>
                <div class="nem">
                    <font class="fm" face="Comic sans MS" color="FireBrick">Name</font>
                    <font class="fm" face="Comic sans MS" color="FireBrick">Email</font>
                    <font class="fm" face="Comic sans MS" color="FireBrick">Subject</font>
                    <br>
                    <input type="text"placeholder="Name" class="im" name="Name" value="" size="25" />

                    <input type="text" placeholder="Email" class="im" name="Email" value="" size="25" required/>

                    <input type="text" placeholder="Subject" class="im" name="sub" value="" size="25" />
                </div>
                <font style="margin-left: 40px;" face="Comic sans MS" color="FireBrick">Message</font>
                <div class="msg">

                    <textarea placeholder="Message" class="ms" name="con" rows="20" cols="145">
                        
                    </textarea>
                    <br>
                    
                        <input class="bu1"  type="submit" value="Submit" />
                        <input class="bu1"  type="reset" value="Reset" />
                    
                </div>
            </div>

        </form>
    </body>
</html>
