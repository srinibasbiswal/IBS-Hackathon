<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<% String id=(String)session.getAttribute("id"); 
ArrayList<String> l=(ArrayList<String>)request.getAttribute("train");
String train_no=l.get(0);
String train_name=l.get(1);
String from=l.get(2);
String to=l.get(3);
String price=l.get(4);
String jdate=l.get(5);

%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>IRCTC 2.0</title>
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
            <div class="uk-card-body uk-padding-remove-bottom">
                <div uk-grid>
                    <div class="uk-align-left">
                        <p>From</p>
                        <h2 class="uk-margin-small-top"><%=from %></h2>
                    </div>
                    <div class="uk-align-right">
                        <p>To</p>
                        <h2 class="uk-margin-small-top"><%=to%></h2>
                    </div>
                </div>
            </div>
            
            <div class="uk-card-body uk-padding-remove-top">
            <form action="proceed" method="post">
                <div class="uk-card uk-card-default uk-margin-medium-top">
                    <div class="uk-card-body">
                    <input type="hidden" name="number" value=<%=train_no%> >
                    <input type="hidden" name="to" value=<%=to%> >
                    <input type="hidden" name="from" value=<%=from%> >
                    <input type="hidden" name="price" value=<%=price%> >
                    <input type="hidden" name="date" value=<%=jdate%> >
                    
                        <h3><%=train_name%></h3>
                        <p><%=train_no%><br> Date: <%=jdate%><br> Scheduled Arrival: 15:25 <br> Scheduled Departure: 15:32
                        </p>
                        <h4>Price : ₹ <%=price %> <button class="uk-button uk-button-primary uk-align-right uk-margin-remove-bottom">Book</button> </h4>
                    </div>
                </div>
				</form>
                <div class="uk-card uk-card-default uk-margin-medium-top">
                    <div class="uk-card-body">
                        <h3>Tapaswini Express</h3>
                        <p>11225<br> Date: <%=jdate %><br> Scheduled Arrival: 06:25<br> Scheduled Departure: 06:30
                        </p>
                        <h4>Price : ₹ 4000 <button class="uk-button uk-button-primary uk-align-right uk-margin-remove-bottom">Book</button> </h4>
                    </div>
                </div>

                <div class="uk-card uk-card-default uk-margin-medium-top">
                    <div class="uk-card-body">
                        <h3>Rajdhani Express</h3>
                        <p>12321<br> Date: <%=jdate%><br> Scheduled Arrival: 10:25<br> Scheduled Departure: 10:40
                        </p>
                        <h4>Price : ₹ N/A (Tickets are Sold)<button class="uk-button uk-button-primary uk-align-right uk-margin-remove-bottom">Book</button> </h4>
                    </div>
                </div>

            </div>


        </div>

    </div>



<spring:url value="/resources/js/uikit.min.js" var="JS" />
<spring:url value="/resources/js/uikit-icons.min.js" var="JS1" />
	<script src="${JS}"></script>
    <script src="${JS1}"></script>

</body>

</html>