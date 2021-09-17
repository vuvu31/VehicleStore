<%-- 
    Document   : viewcart
    Created on : Apr 26, 2021, 7:43:09 PM
    Author     : Mon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
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
                color:#00b09b;
                text-transform:uppercase;
            }
            a,a:visited{
                transition: ease .05s;
                text-decoration:none;
                font-weight:900;
                font-size: 20px;
                color:#4ecca3;
            }
            a:hover{
                transition: ease .05s;
                color:#45b48f;
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
            .form-btn[value="Confirm"]:hover{
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
                text-transform: capitalize;
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
                width:75%;
            }
            table input[type="submit"][value="Update Quantity"]:hover{
                cursor: pointer;
                color:#ff9900;
            }
            table input[type="submit"][value="Remove"]:hover{
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
                <c:if test="${sessionScope.LOGIN_USER eq null or sessionScope.LOGIN_USER.roleID ne 'US'}">
                    <c:redirect url="login.html"></c:redirect>
                </c:if>
                <h1>Your Cart</h1>
                <br>
                <c:set var="user" value="${sessionScope.LOGIN_USER}"/>
                <c:if test="${not empty user}">
                    <c:set var="cart" value="${sessionScope.CART}"/>
                    <c:if test="${not empty cart}">
                        <c:set var="items" value="${cart.items}"/>
                        <c:if test="${not empty items}">
                            <c:set var="total" value="0"/>
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Update</th>
                                        <th>ACtion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <form action="Controller">
                                    <c:forEach var="entry" items="${items}" varStatus="counter">
                                        <tr>
                                            <td>${counter.count}</td>
                                            <td>${entry.key}
                                                <input type="hidden" name="txtID" value="${entry.key}" />
                                            </td>
                                            <td>${entry.value.proName}</td>
                                            <td>${entry.value.price}</td>
                                            <td>
                                                <input type="text" name="txtQuantity" value="${entry.value.quantity}" required="" min="1"/>
                                            </td>
                                            <td>
                                                ${(entry.value.quantity)*(entry.value.price)}$
                                                <c:set var="total" value="${(entry.value.quantity)*(entry.value.price)+(total)}"/>
                                            </td>
                                            <td>
                                                <input type="submit" value="Update Quantity" name="btnAction" class="form-btn"/>
                                            </td>
                                            <td>
                                                <input type="checkbox" name="chkRemoveVehicle" value="${entry.key}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td colspan="5">Total</td>
                                        <td>${total}$</td>
                                        <td></td>
                                        <td>
                                            <input type="submit" value="Remove" name="btnAction" class="form-btn"/>
                                        </td>
                                    </tr>
                                </form>
                                </tbody>
                            </table>
                            </br>
                            <a href="shopping.jsp">Add more!</a> <br>
                            </br>

                            <form action="Controller">
                                <input type="submit" value="Confirm" name="btnAction" class="form-btn"/>
                                <input type="hidden" name="txtTotal" value="${total}" />
                                <input type="hidden" name="userID" value="${user.userID}" />
                            </form> 
                            <!--   validation of update -->
                            <c:set var="error" value="${sessionScope.ERROR_INPUT}"/>
                            <c:if test="${not empty error}">
                                </br>
                                <font color="red">Please solve the problem:${error}</font>
                            </c:if>
                            <!-- validation of checkout-->   
                            <c:set var="errorCheckout" value="${sessionScope.ERROR_CHECKOUT}"/>
                            <c:if test="${not empty errorCheckout}">
                                <font color="red">${errorCheckout}</font>
                            </c:if>
                        </c:if>
                        <c:if test="${empty items}">
                            <h3 class="msg-error">No item in your Cart!!</h3>
                            <a href="shopping.jsp">Back to Search</a>
                        </c:if>
                    </c:if>
                    <c:if test="${empty cart}">
                        <h3 class="msg-error">No item in your Cart!!</h3>
                        <a href="shopping.jsp">Back to Search</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </body>
</html>
