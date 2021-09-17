<%-- 
    Document   : createNewUser
    Created on : Apr 26, 2021, 9:22:57 PM
    Author     : Mon
--%>

<%@page import="vanvlb.dtos.UserErrorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
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
                font-weight: 900;
                text-transform: capitalize;
                color:#00b09b;
                margin-bottom: 1rem;
            }
            a{
                text-decoration:none;
                color:#00b09b;
                font-size: 20px;
            }
            a:visited{
                color:#107569;
            }
            a:hover{
                color:#00b8a2;
                text-decoration: underline;
            }
            .container{
                position:relative;
                width:100vw;
                height:100vh;
                display:flex;
                align-items: center;
                justify-content: center;
            }
            .input-group{
                position:relative;
                margin: 1.8em 0;
            }
            label{
                position: absolute;
                top: 0;
                left: .25rem;
                padding: 10px 0;
                font-size: 1rem;
                pointer-events: none;
                transition: .15s ease;
            }
            .input-group input{
                width:17.5vw;
                font-size: 2em;
            }
            .input-group input:focus{
                transition: ease .05s;
                box-shadow: 0px 1px 5px rgba(0,0,0,0.2);
            }
            form .input-group input:focus + label,
            form .input-group input:valid + label{
                transform: translateY(-1.5rem);
                font-size: .8rem;
            }
            .content{
                background-color:white;
                padding:2.5em 2.5em 2.5em 2.5em;
                display: inline-block;
                box-shadow: 0px 3px 15px rgba(0,0,0,0.2);
            }
            .validation-alt{
                transition: .15s ease;
                position:absolute;
                opacity: 0;
                width:75%;
                border-style: solid;
                border-width:2px;
                background-color:white;
                border-color:#00b09b;
                padding: .5em;
                top:0;
                left:105%;
            }
            form .input-group input:focus + label + .validation-alt{
                transition: .15s ease;
                opacity:100;
            }
            .form-btn-container{
                width:100%;
                margin:0;
                display:flex;
                align-items: center;
                justify-content: center;
            }
            .form-btn{
                transition: ease .1s;
                margin: 0 .1em 0 .1em;
                font-size:1.25em;
                width:50%;
                border-style:solid;
                border-color:#00b09b;
                background-color:#00b09b;
                color:rgb(44, 44, 44);
                padding: .25em 0;
                text-transform: capitalize;
            }

            .form-btn:hover{
                transition: ease .05s;
                cursor:pointer;
                border-color:#00b09b;
                background-color:white;
            }
            .msg-error{
                color:rgb(235, 69, 69);
                position:absolute;
                font-weight:700;
                font-size:.75em;
                right:0;
                top:3.8em;
                text-transform:capitalize;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="content">
                <h1>Sign Up</h1>
                <c:set var="error" value="${requestScope.ERROR_USER}"/>
                <form action="Controller" method="POST">
                    <div class="input-group">
                        <input type="text" name="userID" required="" value="${param.userID}" id="form-username"/>
                        <label for="form-username">User ID</label>
                        <div class="validation-alt">
                            8-16 characters, no spaces
                        </div>
                        <c:if test="${not empty error.userIDErr}">
                            <span class="msg-error">
                                ${error.userIDErr}
                            </span>
                        </c:if>
                    </div>
                    <div class="input-group">
                        <input type="=text" name="fullName" value="${param.fullName}" required=""  id="form-fullname"/>
                        <label for="form-fullname">Full Name</label>
                        <div class="validation-alt">
                            64 characters maximum
                        </div>
                        <c:if test="${not empty error.fullNameErr}">
                            <span class="msg-error">
                                ${error.fullNameErr}
                            </span>
                        </c:if>
                    </div>
                    <div class="input-group">
                        <input type="=text" name="phone" value="${param.phone}" required="" id="form-phone"/>
                        <label for="form-phone">Phone</label>
                        <div class="validation-alt">
                            10 characters maximum
                        </div>
                        <c:if test="${not empty error.phoneErr}">
                            <span class="msg-error">
                                ${error.phoneErr}
                            </span>
                        </c:if>
                    </div>
                    <div class="input-group">
                        <input type="=text" name="address" value="${param.address}" required="" id="form-address"/>
                        <label for="form-address">Address</label>
                        <div class="validation-alt">
                            64 characters maximum
                        </div>
                        <c:if test="${not empty error.addressErr}">
                            <span class="msg-error">
                                ${error.addressErr}
                            </span>
                        </c:if>
                    </div>
                    <div class="input-group">
                        <input type="password" name="password" value="${param.password}" required="" id="form-password"/>
                        <label for="form-password">Password</label>
                        <div class="validation-alt">
                            8-16 characters, no spaces
                        </div>
                        <c:if test="${not empty error.passwordErr}">
                            <span class="msg-error">
                                ${error.passwordErr}
                            </span>
                        </c:if>
                    </div>
                    <div class="input-group">
                        <input type="password" name="confirm" value="${param.confirm}" required="" id="form-confirm"/>
                        <label for="form-confirm">Confirm</label>
                        <div class="validation-alt">
                            Repeat Above Password
                        </div>
                        <c:if test="${not empty error.confirmErr}">
                            <span class="msg-error">
                                ${error.confirmErr}
                            </span>
                        </c:if>
                    </div>
                    <div class="form-btn-container">
                        <input type="submit" value="Create" name="btnAction" class="form-btn"/>
                        <input type="reset" value="Reset" class="form-btn"/></br>
                    </div>
                </form>
                </br>
                <a href="login.html">Back</a>
            </div>
        </div>
    </body>
</html>