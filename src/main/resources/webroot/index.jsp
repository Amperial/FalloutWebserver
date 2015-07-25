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
    <script src="js/vendor/jquery.js"></script>
</head>
<body>
<div id="wrapper">
    <br>

    <!--
    <ul data-orbit>
        <li><img src="img/banner_home_1.png"></li>
        <li><img src="img/banner_home_2.png"></li>
        <li><img src="img/banner_home_3.png"></li>
        <li><img src="img/banner_home_4.png"></li>
        <li><img src="img/banner_home_5.png"></li>
        <li><img src="img/banner_home_6.png"></li>
    </ul>
    <br>
    -->

    <%@include file="WEB-INF/header.jsp"%>

    <div class="row content-main">
        <hr/>
        <br>
        <div class="small-12 small-centered columns">
            <ul class="button-group even-3">
                <li><a href="https://thebigdigmc.info/" class="button">Check out our Forums!</a></li>
                <li><a href="#" class="button" id="copyip" data-clipboard-text="fallout.thebigdigmc.info">
                    <div>Join our Server!</div>
                    <div>fallout.thebigdigmc.info</div>
                </a></li>
                <li><a href="[1.8]FalloutWastelandLegendsV4.zip" class="button">Download our Resource Pack!</a></li>
                <script src="js/zeroclipboard/ZeroClipboard.min.js"></script>
                <script>
                    var client = new ZeroClipboard($("#copyip"));
    
                    client.on("ready", function(readyEvent) {
                        client.on('aftercopy', function(event) {
                            alert("Copied IP to clipboard!");
                            $("#copyip").blur();
                        });
                    });
                </script>
            </ul>
            <hr/>
            <div data-alert class="alert-box success text-center">
                Don't forget to vote and receive today's reward of ${applicationScope['votereward']}!
                <a href="#" class="close">&times;</a>
            </div>
            <br>
            <script>
                var auto_refresh = setInterval(
                        function () {
                            $("#auto_refresh").load("playerlist.jsp").fadeIn("slow");
                        }, 10000);
            </script>
            <div id="auto_refresh"><%@include file="playerlist.jsp"%></div>
        </div>
    </div>
    <br>
    <div class="clearfooter"></div>
</div>

<%@include file="WEB-INF/footer.jsp"%>

<script src="js/foundation.min.js"></script>
<script>
    $(document).foundation({
        orbit: {
            bullets: false
        }
    });
</script>
</body>
</html>
