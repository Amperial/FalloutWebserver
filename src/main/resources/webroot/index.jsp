<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Fallout Wasteland Legends</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.min.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">

    <script src="${pageContext.request.contextPath}/js/vendor/modernizr.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico">
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

    <%@include file="WEB-INF/header.jsp" %>

    <div class="row content-main">
        <br>

        <div class="small-12 small-centered columns">
            <div id="vote-alert" style="display: none">
                <jsp:include page="/votealert"/>
            </div>
            <hr/>
            <ul class="button-group even-3">
                <li><a href="https://thebigdigmc.info/" class="button">Check out our Forums!</a></li>
                <li><a href="#" class="button" id="copyip" data-clipboard-text="fallout.thebigdigmc.info">
                    <div>Join our Server!</div>
                    <div>fallout.thebigdigmc.info</div>
                </a></li>
                <li><a href="#" class="button">Download our Resource Pack!</a></li>
            </ul>
            <br>

            <div id="auto_refresh">
                <jsp:include page="${pageContext.request.contextPath}/playerlist"/>
            </div>
        </div>
    </div>
    <br>

    <div class="clearfooter"></div>
</div>

<%@include file="WEB-INF/footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/script.min.js"></script>
<script src="${pageContext.request.contextPath}/js/zeroclipboard/ZeroClipboard.min.js"></script>
<script>
    $(document).foundation({
        orbit: {
            bullets: false
        }
    });

    $(document).on('close.fndtn.alert', function (event) {
        $.cookie('vote-alert', 'closed', { path: '/' });
    });
    if ($.cookie('vote-alert') !== 'closed') {
        $('#vote-alert').show();
    }

    var client = new ZeroClipboard($("#copyip"));
    client.on('ready', function (readyEvent) {
        client.on('aftercopy', function (event) {
            alert('Copied IP to clipboard!');
            $('#copyip').blur();
        });
    });

    var auto_refresh = setInterval(
            function () {
                $('#auto_refresh').load('${pageContext.request.contextPath}/playerlist').fadeIn('slow');
            }, 10000);
</script>
</body>
</html>
