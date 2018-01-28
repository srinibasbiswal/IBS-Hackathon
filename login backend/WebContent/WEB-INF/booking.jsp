<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
        <html lang="en">
        <% String id=(String)session.getAttribute("id");
ArrayList<String> l=(ArrayList<String>)request.getAttribute("train");
String train_no=l.get(0);
String from=l.get(2);
String to=l.get(1);
String price=l.get(3);
String jdate=l.get(4);

%>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>IRCTC 2.0 | Passenger Details</title>
                <spring:url value="/resources/css/style2.css" var="stylish" />
                <spring:url value="/resources/css/uikit.min.css" var="stylish1" />
                <link rel="stylesheet" href="${stylish}" />
                <link rel="stylesheet" href="${stylish1}" />
            </head>

            <body>


                <div class="uk-position-relative">
                    <div class="uk-position-top">
                        <nav class="uk-navbar-container" uk-navbar>
                            <div class="uk-navbar-left">
                                <ul class="uk-navbar-nav">
                                    <a href="" class="uk-navbar-item uk-logo">IRCTC v2.0</a>
                                </ul>
                            </div>
                            <div class="uk-navbar-right">
                                <ul class="uk-navbar-nav">
                                    <li>
                                        <a href="#"><span class="uk-margin-small-right" uk-icon="icon: bell"></span> <span class="uk-badge">2</span></a>
                                        <div class="uk-navbar-dropdown uk-navbar-dropdown-width-2">
                                            <ul class="uk-nav uk-navbar-dropdown-nav">
                                                <li class="uk-nav-header">Swap Requests</li>
                                                <li>
                                                    <a href="#">
                                                        <div class="uk-card uk-card-default uk-card-body uk-margin-remove-top">
                                                            <span class="uk-badge">22</span> ⇋ <span class="uk-badge">40</span>
                                                            <p class="uk-text-medium uk-margin-small">Swap request from Swaraj Laha</p>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <div class="uk-card uk-card-default uk-card-body uk-margin-remove-top">
                                                            <span class="uk-badge">24</span> ⇋ <span class="uk-badge">36</span>
                                                            <p class="uk-text-medium uk-margin-small">Swap request from Swaraj Laha</p>
                                                        </div>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li><a href="#">Wallet Balance ₹4200</a></li>
                                    <li class="uk-active">
                                        <a href="#">
                                            <span class="uk-margin-small-right" uk-icon="icon: user"></span> abhijitparida01</a>
                                        <div class="uk-navbar-dropdown">
                                            <ul class="uk-nav uk-navbar-dropdown-nav">
                                                <li>
                                                    <a href="ticket.html">My Tickets</a>
                                                </li>
                                                <li>
                                                    <a href="#">Profile</a>
                                                </li>
                                                <li>
                                                    <a href="#">Settings</a>
                                                </li>
                                                <li class="uk-nav-divider"></li>
                                                <li>
                                                    <a href="#">Logout</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>

                <div class="uk-container">
                    <div class="uk-card uk-card-default uk-card-body uk-align-center uk-width-1-2@m uk-margin-large-bottom">

                        <div class="uk-card-body uk-padding-small">
                            <h3 class="uk-card-title" align="center">Enter Passenger Details</h3>
                        </div>

                        <div class="uk-card uk-card-default uk-margin-small">
                            <div class="uk-card-body">
                                <form>
                                    <fieldset class="uk-fieldset">
                                        <input type="hidden" name="number" value=<%=train_no%> >
                                        <input type="hidden" name="to" value=<%=to%> >
                                        <input type="hidden" name="from" value=<%=from%> >
                                        <input type="hidden" name="price" value=<%=price%> >
                                        <input type="hidden" name="date" value=<%=jdate%> >
                                        <div class="uk-margin">
                                            <input class="uk-input" type="text" name="n1" placeholder="Enter Passenger Name">
                                        </div>

                                        <div class="uk-margin">
                                            <input class="uk-input" type="number" name="g1" placeholder="Enter Passenger's Age">
                                        </div>

                                        <div class="uk-margin">
                                            <input class="uk-input" type="number" name="a1" placeholder="Enter Passenger's Aadhar Card Number">
                                        </div>

                                        <div>
                                            <button class="uk-button uk-button-default" type="button" id="btn1" onclick="showDiv('form-2');this.style.display = 'none'">Add Passenger</button>
                                        </div>

                                    </fieldset>

                            </div>
                        </div>

                        <div class="uk-card uk-card-default uk-margin-small" id="form-2">
                            <div class="uk-card-body">
                                <form>
                                    <fieldset class="uk-fieldset">

                                        <div class="uk-margin">
                                            <input class="uk-input" type="text" name="n2" placeholder="Enter Passenger Name">
                                        </div>

                                        <div class="uk-margin">
                                            <input class="uk-input" type="number" name="g2" placeholder="Enter Passenger's Age">
                                        </div>

                                        <div class="uk-margin">
                                            <input class="uk-input" type="number" name="a2" placeholder="Enter Passenger's Aadhar Card Number">
                                        </div>

                                        <div>
                                            <button class="uk-button uk-button-default" type="button" id="btn2" onclick="showDiv('form-3');this.style.display = 'none'">Add Passenger</button>
                                        </div>
                                    </fieldset>

                            </div>
                        </div>

                        <div class="uk-card uk-card-default uk-margin-small" id="form-3">
                            <div class="uk-card-body">

                                <fieldset class="uk-fieldset">

                                    <div class="uk-margin">
                                        <input class="uk-input" name="n3" type="text" placeholder="Enter Passenger Name">
                                    </div>

                                    <div class="uk-margin">
                                        <input class="uk-input" name="g3" type="number" placeholder="Enter Passenger's Age">
                                    </div>

                                    <div class="uk-margin">
                                        <input class="uk-input" name="a3" type="number" placeholder="Enter Passenger's Aadhar Card Number">
                                    </div>

                                </fieldset>
                                </form>
                            </div>
                        </div>

                        <div class="uk-margin">
                            <a target="_blank" href="food.html"><button class="uk-button uk-button-primary uk-align-center uk-marigin-small">Add Meals</button></a>
                            <button class="uk-button uk-button-primary uk-align-center uk-margin-remove-top">Book Tickets</button>

                        </div>

                    </div>
                </div>
                <spring:url value="/resources/js/script.js" var="JS" />
                <script src="${JS}"></script>
                <spring:url value="/resources/js/uikit.min.js" var="JS1" />
                <script src="${JS1}"></script>
                <spring:url value="/resources/js/uikit-icons.min.js" var="JS2" />
                <script src="${JS2}"></script>
            </body>

        </html>