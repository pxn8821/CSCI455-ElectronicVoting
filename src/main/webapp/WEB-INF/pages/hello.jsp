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

    <link rel="stylesheet" href="resources/test.css">
</head>
<body>
    <div class="helloPage">
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
        <div id="header">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h1>Secure Electronic Voting</h1>
                        <h2 class="subtitle">No blind voting, no cheating and no privacy issues</h2>
                        <button type="submit" class="btn btn-theme">
                            <a class="btn-alink" href="/signup">Sign up</a>
                        </button>
                    </div>

                </div>
            </div>
        </div>

        <section id="section-about" class="section appear clearfix">
            <div class="container">

                <div class="row mar-bot40">
                    <div class="col-md-offset-3 col-md-6">
                        <div class="section-header text-center">
                            <h2 class="section-heading animated" data-animation="bounceInUp">Our Team</h2>
                            <p>All the headaches and decisions are not made by one but by three</p>
                        </div>
                    </div>
                </div>

                <div class="row text-center mar-bot40">
                    <div class="col-md-4">
                        <div class="team-member">
                            <figure class="member-photo"><img src="resources/images/member1.jpg" alt=""></figure>
                            <div class="team-detail">
                                <h4>Mustafa Al-Salihi</h4>
                                <span>Software Engineer</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-member">
                            <figure class="member-photo"><img src="resources/images/member2.jpg" alt=""></figure>
                            <div class="team-detail">
                                <h4>Awelemdy Orakwue</h4>
                                <span>Computer Scientist</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-member">
                            <figure class="member-photo"><img src="resources/images/member3.jpg" alt=""></figure>
                            <div class="team-detail">
                                <h4>Philip Nguyen</h4>
                                <span>Software Engineer</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-lg-offset-3">
                        <p class="copyright">Templates gotten from Bootstraptaste.com(Amoeba and Siimple)</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="resources/scripts/app.js"></script>
</body>
</html>