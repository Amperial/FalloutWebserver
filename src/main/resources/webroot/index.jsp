<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fallout Wasteland Legends</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">
    <script src="js/vendor/modernizr.js"></script>
</head>
<body>
<%@include file="WEB-INF/header.jsp"%>
<ul data-orbit>
    <li><img src="img/banner_home_1.png"></li>
    <li><img src="img/banner_home_2.png"></li>
    <li><img src="img/banner_home_3.png"></li>
    <li><img src="img/banner_home_4.png"></li>
    <li><img src="img/banner_home_5.png"></li>
    <li><img src="img/banner_home_6.png"></li>
</ul>
<div id="content" class="row">
    <br>
    <div class="small-12 small-centered columns">

        <a href="[1.8]FalloutWastelandLegendsV4.zip" class="button expand">Download our resource pack!</a><br>

        <script src="js/vendor/jquery.js"></script>
        <script>
            var auto_refresh = setInterval(
                    function () {
                        $("#auto_refresh").load("playerlist.jsp").fadeIn("slow");
                    }, 10000);
        </script>
        <div id="auto_refresh"><%@include file="playerlist.jsp"%></div>
    </div>
</div>
<%@include file="WEB-INF/footer.jsp"%>
<script src="js/foundation.min.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>
