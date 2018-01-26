<!DOCTYPE html>
<%
	String id=(String)session.getAttribute("id");
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>IRCTC 2.0</title>
    <link rel="stylesheet" href="css/uikit.min.css" />
    <link rel="stylesheet" href="css/style.css" />
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
                        <li><a href="#">Wallet Balance ₹4200</a></li>
                        <li class="uk-active">
                            <a href="#"><span class="uk-margin-small-right" uk-icon="icon: user"></span> <%=id %></a>
                            <div class="uk-navbar-dropdown">
                                <ul class="uk-nav uk-navbar-dropdown-nav">
                                    <li><a href="#">Profile</a></li>
                                    <li><a href="#">Settings</a></li>
                                    <li class="uk-nav-divider"></li>
                                    <li><a href="#">Logout</a></li>
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
            <div class="uk-card-header">
                <h3 class="uk-card-title" align="center">Book Train</h3>
            </div>
            <div class="uk-card-body">
                <form>
                    <fieldset class="uk-fieldset">

                        <div class="uk-margin">
                            <select class="uk-select">
                                 <option>Select Source Station</option>
                                 <option>Station 01</option>
                                 <option>Station 02</option>
                              </select>
                        </div>

                        <div class="uk-margin">
                            <select class="uk-select">
                                   <option>Select Destination Station</option>
                                   <option>Station 01</option>
                                   <option>Station 02</option>
                              </select>
                        </div>

                        <div class="uk-margin">
                            <button class="uk-button uk-button-primary uk-align-center">Find trains</button>
                        </div>

                    </fieldset>
                </form>
            </div>


        </div>

    </div>



    <script src="js/uikit.min.js"></script>
    <script src="js/uikit-icons.min.js"></script>

</body>

</html>