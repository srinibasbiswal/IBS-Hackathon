<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>IRCTC v2.0</title>
    <meta name="description" content="IBS hackathon Project 2018">
    <spring:url value="/resources/css/style.css" var="stylish" />
<spring:url value="/resources/js/index.js" var="JS" />
<spring:url value="/resources/img/favicon.ico" var="img" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="${stylish}" rel="stylesheet" />


    <link rel="icon" href="${img}" type="image/x-icon" />


    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900&subset=latin,latin-ext'>




</head>

<body>

		<div class="intro">

			<h1>IRCTC v2.0</h1>
			<h2>Next Gen Blockchain based eTicketing System</h2>
		</div>

    <div class="materialContainer">


        <div class="box">
			<form action="register" method="post">
            <div class="title">REGISTER</div>

            <div class="input">
                <label for="name">Name</label>
                <input type="text" name="name" id="name">
                <span class="spin"></span>
            </div>

            <div class="input">
                <label for="aadhar">Aadhar</label>
                <input type="number" name="adhar" id="aadhar">
                <span class="spin"></span>
            </div>

            <div class="input">
                <label for="username">Username</label>
                <input type="text" name="username" id="username">
                <span class="spin"></span>
            </div>

            <div class="input">
                <label for="password">Password</label>
                <input type="password" name="password" id="password">
                <span class="spin"></span>
            </div>

            <div class="input">
                <label for="phone">Phone Number</label>
                <input type="number" name="ph" id="phone">
                <span class="spin"></span>
            </div>

            <div class="button login">
                <button><span>GO</span> <i class="fa fa-check"></i></button>
            </div>
            </form>

            <a href="" class="pass-forgot">Forgot your password?</a>

        </div>

        <div class="overbox">
            <div class="material-button alt-2"><span class="shape"></span></div>
			<form action="login" method="post">
            <div class="title">LOGIN</div>

            <div class="input">
                <label for="login_username">Username</label>
                <input type="text" name="username" id="login_username">
                <span class="spin"></span>
            </div>

            <div class="input">
                <label for="login_password">Password</label>
                <input type="password" name="password" id="login_password">
                <span class="spin"></span>
            </div>

            <div class="button">
                <button><span>NEXT</span></button>
            </div>

</form>
        </div>

    </div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="${JS}"></script>






</body>

</html>
