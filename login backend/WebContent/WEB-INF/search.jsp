<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<% String id=(String)session.getAttribute("id"); 
ArrayList<String> notification=(ArrayList<String>)request.getAttribute("notification");
int size=notification.size();
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
                            <a href="#"><span class="uk-margin-small-right" uk-icon="icon: bell"></span> <span class="uk-badge"><%=size-1 %></span></a>
                            
                            <div class="uk-navbar-dropdown uk-navbar-dropdown-width-2">
                                <ul class="uk-nav uk-navbar-dropdown-nav">
                                    <li class="uk-nav-header">Swap Requests</li>
                                    
                                    <%
                                    	if((size-1)==0){
                                    		
                                    	}else{
                                    		for(int i=1;i<=size-1;i++){
                                    			out.println("<li>");
                                    		out.println("<form action='notification' method='post'>");
                                    		out.println("<input type='hidden' name='sid' value="+notification.get(i)+">");
                                    		out.println("<div class='uk-card uk-card-default uk-card-body uk-margin-remove-top'>");
                                    		out.println(" <input type='submit' value='view' class='uk-text-medium uk-margin-small'>Swap request from "+notification.get(i));
                                    		out.println("</div></li></form>");
                                    		}
                                    	}
                                    %>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#">Wallet Balance ₹4200</a></li>
                        <li class="uk-active">
                            <a href="#">
                                <span class="uk-margin-small-right" uk-icon="icon: user"></span> <%=id %></a>
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
        <div class="uk-card uk-card-default uk-card-body uk-align-center uk-width-1-2@m">
            <div class="uk-card-body uk-padding-small">
                <h3 class="uk-card-title" align="center">Book Train</h3>
            </div>
            <div class="uk-card-body">
                <form action="findTrain" method="post">
                    <fieldset class="uk-fieldset">

                        <div class="uk-margin">
                            <select class="uk-select" name="from">
                                <option>Select Source Station</option>
                                <option>Bhubaneswar</option>
                                <option>Station 02</option>
                            </select>
                        </div>

                        <div class="uk-margin">
                            <select class="uk-select" name="to">
                                <option>Select Destination Station</option>
                                <option>Mumbai</option>
                                <option>Station 02</option>
                            </select>
                        </div>

                        <div class="uk-margin">
                            Journey Date:
                            <input class="uk-input" type="date" name="date">
                        </div>

                        <div class="uk-margin">
                            <button class="uk-button uk-button-primary uk-align-center">Find trains</button>
                        </div>

                    </fieldset>
                </form>
            </div>


        </div>

    </div>



    <spring:url value="/resources/js/uikit.min.js" var="JS" />
<spring:url value="/resources/js/uikit-icons.min.js" var="JS1" />
	<script src="${JS}"></script>
    <script src="${JS1}"></script>

</body>

</html>