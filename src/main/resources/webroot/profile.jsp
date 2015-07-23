<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fallout Wasteland Legends: ${param["character"]}</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">
    <script src="js/vendor/modernizr.js"></script>
</head>
<body>
<%@include file="WEB-INF/header.jsp"%>
<br>
<div class="row content-main">
    <br>
    <div class="small-12 small-centered columns">
        <div class="small-12 small-centered columns content-inner">
            <br>
            Profile of ${param["character"]}.
            <br><br>
        </div>
    </div>
    <br>
</div>
<%@include file="WEB-INF/footer.jsp"%>
<script src="js/vendor/jquery.js"></script>
<script src="js/foundation.min.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>
