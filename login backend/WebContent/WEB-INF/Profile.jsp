<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>IRCTC 2.0 |My Profile</title>
    <spring:url value="/resources/css/style2.css" var="stylish" />
     <spring:url value="/resources/css/uikit.min.css" var="stylish1" />
    <link rel="stylesheet" href="${stylish}" />
    <link rel="stylesheet" href="${stylish1}" />
         <spring:url value="/resources/css/jquery.seat-charts.css" var="stylish2" />
    
<link rel="stylesheet" href="${stylish2}" /></head>

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
                                <span class="uk-margin-small-right" uk-icon="icon: user"></span> <%=(String)session.getAttribute("id") %></a>
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
                                        <a href="logout">Logout</a>
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
        <div uk-grid>
            <div class="uk-card uk-card-default uk-card-body uk-align-left uk-width-1-4 uk-margin-large-bottom">
                <div class="uk-card uk-card2 uk-card-default uk-card-title uk-margin-small">
                    <div uk-grid>
                        <div class="uk-width-1-3">
                            <span uk-icon="icon: user;ratio: 2.5"></span>
                        </div>
                        <div class="uk-width-2-3">
                            <p><strong>ABHIJIT PARIDA</strong><br>abhijitparida01</p>
                        </div>
                    </div>
                </div>

                <div class="uk-card uk-card-default uk-card-body uk-margin-remove-top">
                    <ul class="uk-list uk-list-divider">
                        <li>WALLET BALANCE :<strong>₹4200</strong></li>
                        <li>USER NAME: abhijitparida01</li>
                        <li>AADHAR CARD: 1541012143 </li>
                        <li>PHONE NUMBER: 9776 242 2727</li>
                        <li>EMAIL : abhijit.parida.me@gmail.com</li>
                    </ul>

                </div>
            </div>

            <div class="uk-card uk-card-default uk-card uk-align-right uk-width-2-3 uk-margin-large-bottom">

                <div class="uk-title uk-margin-small">
                    <h3>Ticket History</h3>
                </div>


                <div class="uk-card uk-card2 uk-card-default uk-card-body">
                    <div class="uk-title">
                        <h3>Train name</h3>
                        <p><strong>Train Number<br>Station 01 - - > Station 02<br>PNR NUMBER </strong> </p>
                    </div>
                </div>

                <div class="uk-card uk-card2 uk-card-default uk-card-body">
                    <div class="uk-title">
                        <h3>Train name</h3>
                        <p><strong>Train Number<br>Station 01 - - > Station 02<br>PNR NUMBER </strong> </p>
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