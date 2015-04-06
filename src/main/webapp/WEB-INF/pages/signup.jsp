<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Electronic Voting Application</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <!-- Angular JS -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular-route.min.js"></script>

    <link rel="stylesheet" href="resources/loginPage.css">
</head>
<body>
<!-- Fixed navbar -->
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Electronic Voting</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/signup">Sign up</a></li>
                <li><a href="/login">Sign in</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="wrapper">
    <form class="form-signin" action="/signup-go" method="post" onsubmit="return formValidate(this);">
        <h2 class="form-signin-heading">Sign up</h2>
        <c:if test="${message eq 'passwordsnotequal'}">
            <span style="color: red">Passwords do not match</span>
        </c:if>
        <c:if test="${message eq 'notemail'}">
            <span style="color: red">Invalid email address</span>
        </c:if>
        <c:if test="${message eq 'emailexists'}">
            <span style="color: red">Email address exists</span>
        </c:if>
        <c:if test="${message eq 'nopassword'}">
            <span style="color: red">Please enter a password</span>
        </c:if>
        <input type="text" class="form-control" name="username" placeholder="Email Address" required="" autofocus="" />
        <input type="password" class="form-control" name="password1" placeholder="Create your password" required="" value=""/>
        <input type="password" class="form-control" name="password2" placeholder="Confirm your password" required="" value=""/>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
    </form>
</div>

<script src="resources/scripts/app.js"></script>
</body>
</html>