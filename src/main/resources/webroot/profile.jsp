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
    <script src="js/vendor/modernizr.js"></script>
</head>
<body>
<%@include file="WEB-INF/header.jsp"%>
<div id="content" class="row" style="background: #D8DBE2">
    <div class="small-12 small-centered columns">
        Profile of ${param["character"]}.
    </div>
</div>
<%@include file="WEB-INF/footer.jsp"%>
<script src="js/vendor/jquery.js"></script>
<script src="js/foundation.min.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>
