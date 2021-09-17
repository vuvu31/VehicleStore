<%-- 
    Document   : search
    Created on : Apr 23, 2021, 11:33:01 AM
    Author     : Mon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
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
            h3{
                font-weight: 100;
                color:#ff0000;
            }
            a{
                text-decoration:none;
                color:#00b09b;
            }
            a:visited{
                color:#107569;
            }
            a:hover{
                color:#ff9900;
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
                transition: ease .05s;
                border-style:solid;
                padding: .25em 1em;
                background-color:white;
                font-weight:900;
                border-width:2px;
                border-radius: 3px;
                color:rgb(120,120,120);
            }

            .form-btn[value="Search"]:hover{
                color:rgb(80,80,80);
                cursor:pointer;
            }
            .form-btn[value="Logout"]:hover{
                color:rgb(80,80,80);
                cursor:pointer;
            }
            #btnlink{
                display:flex;
                align-items:center;
                justify-content:flex-end;
            }
            #btnlink a{
                margin-right:1vw;
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
                margin-bottom: 8vh;
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
            td input[type="text"]{

                border-style:none;
                width:90%;
                height:60%;
                text-align: center;
            }
            table .form-btn{
                border-radius:0;
                height:100%;
                width:100%;
            }
            table input[type="submit"][value="Update"]:hover{
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
                <c:set var="loginAdmin" value="${sessionScope.LOGIN_ADMIN}"/>
                <c:if test="${loginAdmin eq null or loginAdmin.roleID ne 'AD'}">
                    <c:redirect url="login.html"></c:redirect>
                </c:if>
                <div id="welcome-container">
                    <h1 id="welcome-msg">Welcome : 
                        <span id="welcome-name">${loginAdmin.fullName}</span>
                    </h1>
                </div>

                <form action="Controller" method="POST">
                    <label for="search-field">Search</label> 
                    <input type="text" name="txtSearch" value="${param.txtSearch}" id="search-field"/>
                    <input type="submit" name="btnAction" value="Search" class="form-btn"/>
                </form>
                <br>

                <c:if test="${requestScope.LIST_USER != null}">
                    <c:if test="${not empty requestScope.LIST_USER}">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>User ID</th>
                                    <th>Password</th>
                                    <th>Full Name</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Role ID</th>
                                    <th>Delete</th>
                                    <th>Update</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                                <form action="Controller" method="POST">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${user.userID}</td>
                                        <td>${user.password}</td>
                                        <td>
                                            <input type="text" name="fullName" value="${user.fullName}" />
                                        </td>
                                        <td>
                                            <input type="text" name="phone" value="${user.phone}" />
                                        </td>
                                        <td>
                                            <input type="text" name="address" value="${user.address}" />
                                        </td>
                                        <td>
                                            <input type="text" name="roleID" value="${user.roleID}" />
                                        </td>
                                        <td>
                                            <c:url var="delete" value="Controller">
                                                <c:param name="userID" value="${user.userID}"></c:param>
                                                <c:param name="txtSearch" value="${param.txtSearch}"></c:param>
                                                <c:param name="btnAction" value="${'Delete'}"></c:param>
                                            </c:url>
                                            <a href="${delete}" >Delete</a>
                                        </td>
                                        <td>
                                            <input type="hidden" name="userID" value="${user.userID}" />
                                            <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                                            <input type="submit" name="btnAction" value="Update" class="form-btn"/>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                        <h3 class="msg-error">${requestScope.DELETE_USER}</h3></br>
                    </c:if>
                    <c:if test="${empty requestScope.LIST_USER}">
                        <h3 class="msg-error">Can't find the user with key ${param.txtSearch}</h3></br>
                    </c:if>
                </c:if>
                <form action="Controller" method="POST">
                    <input type="submit" name="btnAction" value="Logout" class="form-btn"/> 
                </form>
            </div>
        </div>
    </body>
</html>
