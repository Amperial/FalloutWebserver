<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fallout Wasteland Legends: Wiki</title>
    <link rel="shortcut icon" href="../img/favicon.ico">
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/foundation.css">
    <link rel="stylesheet" href="../css/app.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">
    <script src="../js/vendor/modernizr.js"></script>
</head>
<body>
<div id="wrapper">
    <br>

    <%@include file="../WEB-INF/header.jsp"%>

    <div class="row content-main">
        <br>
        <div class="small-12 small-centered columns">
            <ul class="breadcrumbs">
                <li class="current"><a href="#">Home</a></li>
            </ul>

            <h3>Wiki</h3>
    
            <div class="small-12 small-centered columns content-inner">
                <br>
                <h4 class="wikiheader">Characters</h4>
                <ul class="circle">
                    <li><a href="characters/alignments.jsp">Alignments</a></li>
                    <li><a href="characters/races.jsp">Races</a></li>
                </ul>
                <br>
                <h4 class="wikiheader">Lore</h4>
                <ul class="circle">
                    <li><a href="lore.jsp">Main Lore</a></li>
                </ul>
                <br>
                <h4 class="wikiheader">NRS</h4>
                <ul class="circle">
                    <li>SPECIAL</li>
                    <li>Skills</li>
                    <li>Perks</li>
                    <li>Rolling</li>
                    <li>Combat</li>
                </ul>
                <br>
                <h4 class="wikiheader">Locking System</h4>
                <ul class="circle">
                    <li>Doors, Chests, and Trapdoors</li>
                    <li>Terminals</li>
                </ul>
                <br>
            </div>
            <br>
        </div>
    </div>
    <br>
    <div class="clearfooter"></div>
</div>

<%@include file="../WEB-INF/footer.jsp"%>

<script src="../js/vendor/jquery.js"></script>
<script src="../js/foundation.min.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>
