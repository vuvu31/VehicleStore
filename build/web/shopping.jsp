<%-- 
    Document   : shopping
    Created on : Apr 23, 2021, 12:47:13 PM
    Author     : Mon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
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
                color:#00b09b;
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
                display:flex;
                align-items:flex-start;
                justify-content: center;
            }
            .content{
                background-color:white;
                padding:2.5em 2.5em 2.5em 2.5em;
                width:90vw;
                display: inline-block;
                box-shadow: 0px 3px 15px rgba(0,0,0,0.2);
            }

            .form-btn{
                transition: ease .05s;
                border-style:solid;
                padding: .25em 1em;
                background-color:white;
                font-weight:900;
                border-width:2px;
                border-radius: 3px;
                color:rgb(120,120,120);
            }
            #welcome-name{
                position:relative;
            }
            #welcome-msg{
                font-weight: 700;
                margin-bottom:1vh;
            }
            #welcome-id{
                position:absolute;
                top:-.75em;
                right:0;
                font-size: .5em;
                text-transform:none;
                font-style: italic;
                font-weight: 200;
            }
            #welcome-name{
                font-weight: 900;
                text-transform: uppercase;
            }
            #welcome-container{
                margin-bottom: 2vh;
            }
            #welcome-container a, #welcome-container a:visited{
                transition: ease .05s;
                border-style:solid;
                padding: .25em 1em;
                background-color:white;
                font-weight:900;
                border-width:2px;
                border-radius: 3px;
                color:rgb(120,120,120);
            }
            #welcome-container a:hover{
                transition: ease .05s;
                color:#ed6363;
            }
            #welcome-container #login-l:hover{
                transition: ease .05s;
                color:rgb(0, 204, 78);
            }
            .form-btn-container{
                display: flex;
                align-items:center;
            }
            .form-btn-container .form-btn{
                margin-right:.5vw;
                font-size: 1.15em;
            }
            .form-btn[value="View Cart"]{
                color:rgb(0, 192, 250);
                border-color:rgb(0, 192, 250);
            }
            .form-btn[value="View Cart"]:hover{
                color:rgb(0, 163, 212);
                border-color:rgb(0, 163, 212);
            }

            .form-btn:hover{
                color:rgb(80,80,80);
                cursor:pointer;
            }
            form{
                position:relative;
            }
            form label{
                position: absolute;
                left:0;
                font-weight:700;
                font-size:1.5rem;
                top: -1.75rem;
                color:rgb(44, 44, 44);
                text-transform:capitalize;
            }
            input:focus + label{
                transition: .1s ease;
                color:#00b09b;
            }
            form input:focus{
                transition: .1s ease;
                box-shadow: 0px 1px 5px rgba(0,0,0,0.2);
                border-color:#00b09b;
            }
            form input{
                border-width:2px;
                border-style:solid;
                transition: .1s ease;
                font-size: 1.5rem;
                padding: .25em 0;
            }
            .msg-error{
                color:#ed6363;
                font-weight:700;
                text-transform: uppercase;
                font-size:1.25em;
                top:0;
            }
            table{
                border-style: none;
                color:rgb(44, 44, 44);
                border-spacing:0;
                width:100%;
            }
            tr th{
                border-top-left-radius: 2px;
                border-top-right-radius: 2px;
                border-style: none;
                padding:.5em;
                font-weight:700;
                font-size: 1.25em;
                background-color: #4ecca3;
            }
            td{
                background-color: rgba(35, 41, 49, .85);
                color:rgba(240,240,240,1);
                font-weight:lighter;
                height:5vh;
                font-size:1.25em;
            }
            tr td{
                text-align: center;
            }
            table .form-btn{
                border-radius:0;
                height:100%;
                width:80%;
            }
            table input[type="submit"][value="Add"]:hover{
                cursor: pointer;
                color:#ff9900;
            }
            table input[type="submit"]:disabled{
                color:rgb(175,175,175);
            }
            table input[type="submit"]:disabled:hover{
                color:rgb(175,175,175);
                cursor:not-allowed;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="content">
                <c:set var="user" value="${sessionScope.LOGIN_USER}"/>
                <c:set var="listVehicle" value="${requestScope.LIST_VEHICLE}"/>
                <c:if test="${sessionScope.LOGIN_USER eq null or sessionScope.LOGIN_USER.roleID ne 'US'}">
                    <c:redirect url="login.html"></c:redirect>
                </c:if>
                <c:if test="${not empty user}">
                    <div id="welcome-container">
                        <h1 id="welcome-msg">Welcome 
                            <span id="welcome-name">${user.fullName}</span> to the Vehicle shop
                        </h1>
                    </div>
                    </br> </br>

                    <form action="Controller">
                        <label for="find-field">Find your favorite the vehicles: </label>
                        <input type="text" name="productName" value="${param.productName}" id="find-field"/>
                        <input type="submit" name="btnAction" value="Find" class="form-btn"/>
                        <input type="submit" name="btnAction" value="Logout" class="form-btn"/>
                    </form>
                    </br>
                    <c:if test="${listVehicle != null}">
                        <c:if test="${not empty listVehicle}">
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>Vehicle ID</th>
                                        <th>Vehicle Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Add</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <c:forEach var="vehicle" items="${listVehicle}" varStatus="counter">
                                    <form action="Controller">
                                        <td>${vehicle.proID}</td>
                                        <td>${vehicle.proName}</td>
                                        <td>${vehicle.price}$</td>
                                        <td>${vehicle.quantity}</td>
                                        <td>
                                            <input type="submit" value="Add" name="btnAction" class="form-btn"/>
                                            <input type="hidden" name="lastSearchVal" value="${param.productName}" />
                                            <input type="hidden" name="productId" value="${vehicle.proID}" />
                                        </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </c:if>
                    </br>
                    <div class="form-btn-container">
                        <form action="Controller">
                            <input type="submit" value="View Cart" name="btnAction" class="form-btn"/>
                        </form>
                    </div>
                </c:if>

                <c:if test="${empty user}">
                    <div class="msg-error">There are currently no product, please come back later</div>
                    <br>
                    <a href="login.html">Click here to try again !</a>
                </c:if>
            </div>
        </div>
    </body>
</html>
