<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
  <script src="resources/scripts/app.js"></script>

  <link rel="stylesheet" href="resources/loginPage.css">
  <link rel="stylesheet" href="resources/test.css">

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
        <sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
          <li><a href="/signup">Sign up</a></li>
          <li><a href="/login">Sign in</a></li>
        </sec:authorize>
        <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
          <li><a href="/signup">Dashboard</a></li>
          <li><a href="/j_spring_security_logout">Log out</a></li>
        </sec:authorize>


      </ul>
    </div>
  </div>
</div>
  <tiles:insertAttribute name="body" />

</body>