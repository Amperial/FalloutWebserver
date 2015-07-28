<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Fallout Wasteland Legends: Wiki</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.min.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">

    <script src="${pageContext.request.contextPath}/js/vendor/modernizr.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico">
</head>
<body>
<div id="wrapper">
    <br>

    <%@include file="../../WEB-INF/header.jsp" %>

    <div class="row content-main">
        <br>

        <div class="small-12 small-centered columns">
            <div id="vote-alert" style="display: none">
                <jsp:include page="/votealert"/>
            </div>
            <ul class="breadcrumbs">
                <li><a href="${pageContext.request.contextPath}/wiki">Wiki</a></li>
                <li><a href="${pageContext.request.contextPath}/wiki/characters">Characters</a></li>
                <li class="current"><a href="#">Races</a></li>
            </ul>

            <h3>Character Races</h3>

            <div class="small-12 small-centered columns content-inner">
                <br><h4 class="wikiheader">Wastelander</h4>
                Life is rough outside of the secured facilities of Project Safehouse and technologically advanced factions.
                But it's the life that most who call the american wasteland home now lead.
                <br><h4 class="wikiheader">Ghoul</h4>
                Many died of radiation poisoning when atomic fire spread across the land. An unlucky few hailed to heed the call of death,
                and mutated into rotting abominations who now thrive on what should have killed them.
                <br><h4 class="wikiheader">Super Mutant</h4>
                Born of the Forced Evolutionary Virus, these hulking monstrosities of flesh
                breed fear into all who call the american wasteland home, even if they don't intend it.
                <br><h4 class="wikiheader">Vault Dweller</h4>
                Some were spared from the wrath of the atom bomb unleashed in the Great War.
                Behind the thick doors of vaults and within heavily secured facilities, remnant of the past still live on.
                <br><br>
            </div>
            <br>
        </div>
    </div>
    <br>

    <div class="clearfooter"></div>
</div>

<%@include file="../../WEB-INF/footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/script.min.js"></script>
<script>
    $(document).foundation();

    $(document).on('close.fndtn.alert', function (event) {
        $.cookie('vote-alert', 'closed', { path: '/' });
    });
    if ($.cookie('vote-alert') !== 'closed') {
        $('#vote-alert').show();
    }
</script>
</body>
</html>
