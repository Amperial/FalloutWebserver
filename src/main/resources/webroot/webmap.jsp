<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fallout Wasteland Legends: Webmap</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">
    <script src="js/vendor/modernizr.js"></script>
</head>
<body>
<div id="wrapper">
    <br>

    <%@include file="WEB-INF/header.jsp"%>

    <div class="row content-main">
        <br>
        <div class="small-12 small-centered columns">
            <div class="small-12 small-centered columns content-inner">
                <br>
                <iframe src="http://fallout.thebigdigmc.info:8123/" width="100%" height="635px"></iframe>
                <br><br>
            </div>
        </div>
        <br>
    </div>
    <br>
    <div class="clearfooter"></div>
</div>

<%@include file="WEB-INF/footer.jsp"%>

<script src="js/vendor/jquery.js"></script>
<script src="js/foundation.min.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>
