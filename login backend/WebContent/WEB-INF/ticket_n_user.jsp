<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.util.*"%>
<% String id=(String)session.getAttribute("id"); 
	ArrayList<String> al=new ArrayList<String>();
	al=(ArrayList<String>)request.getAttribute("invoice");
	int size=al.size();
	
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>IRCTC 2.0 | Ticket Details</title>
    <spring:url value="/resources/css/jquery.seat-charts.css" var="stylish2" />
    
    <spring:url value="/resources/css/style2.css" var="stylish" />
     <spring:url value="/resources/css/uikit.min.css" var="stylish1" />
    <link rel="stylesheet" href="${stylish}" />
    <link rel="stylesheet" href="${stylish1}" />
        <link rel="stylesheet" href="${stylish2}" />
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
                                <span class="uk-margin-small-right" uk-icon="icon: user"></span> <%=id%></a>
                            <div class="uk-navbar-dropdown">
                                <ul class="uk-nav uk-navbar-dropdown-nav">
                                    <li>
                                        <a href="#">My Tickets</a>
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
            <div class="uk-card-body">
                <h3 class="uk-card-title" align="center">Ticket Details for PNR <%=al.get(size-1) %></h3>
            </div>
            <div class="uk-card-body">
                <div class="uk-grid uk-child-width-expand">
                    <div id="seat-map"></div>
                    <div>
                        <button class="uk-button uk-button-primary uk-width-1-1">Swap Seats</button>
                        <p>You can swap seats with other passengers by sending them a swap request.</p>
                    </div>
                </div>
            </div>


        </div>

    </div>



     <spring:url value="/resources/js/uikit.min.js" var="JS" />
<spring:url value="/resources/js/uikit-icons.min.js" var="JS1" />
	<script src="${JS}"></script>
    <script src="${JS1}"></script>
     <spring:url value="/resources/js/jquery-1.11.0.min.js" var="JS2" />
    
     <spring:url value="/resources/js/jquery.seat-charts.min.js" var="JS3" />
     <spring:url value="/resources/js/script.js" var="JS4" />
         <script src="${JS2}"></script>
     
         <script src="${JS3}"></script>
     
         <script src="${JS4}"></script>

</body>

</html>