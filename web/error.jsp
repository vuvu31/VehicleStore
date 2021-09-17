<%-- 
    Document   : error
    Created on : 15-Apr-2021, 13:35:02
    Author     : erumi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <style>
            *{
                padding:0;
                margin:0;
                font-family: sans-serif;
            }
            body{
                background-color:white;
            }
            h1{
                font-weight: 100;
                text-transform: uppercase;
                color:#00b09b;
                margin-bottom:.25rem;
            }
            a{
                text-decoration:none;
                color:#00b09b;
            }
            a:visited{
                color:#107569;
            }
            a:hover{
                color:#00b8a2;
                text-decoration: underline;
            }
            #container{
                position:relative;
                width:100vw;
                height:100vh;
                display:flex;
                align-items: center;
                justify-content: center;
            }
            #content{
                background-color:white;
                padding:2.5em 2.5em 2.5em 2.5em;
                display: inline-block;
                box-shadow: 0px 3px 15px rgba(0,0,0,0.2);
            }
        </style>
    </head>
    <body>
        <div id = 'container'>
            <div id ='content'>
                <h1>Login Invalid!</h1>
                <div>Invalid Username or Password</div>
                <a href="./">Click here to return to home</a>
            </div>
        </div>
    </body>
</html>
