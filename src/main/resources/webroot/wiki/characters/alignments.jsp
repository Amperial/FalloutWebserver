<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Fallout Wasteland Legends: Wiki</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/foundation.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
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
                <li class="current"><a href="#">Alignments</a></li>
            </ul>

            <h3>Character Alignments</h3>

            <div class="small-12 small-centered columns content-inner">
                <br><h4 class="subheader" style="color: lime">Lawful Good</h4>
                A Lawful Good character typically acts with compassion, and always with honor and a sense of duty.
                A Lawful Good nation would consist of a well-organized government that works for the benefit of its citizens.
                <br><h4 class="subheader" style="color: limegreen">Good</h4>
                A Neutral Good character is guided by his conscience and typically acts altruistically,
                without regard for or against Lawful precepts such as rules or tradition.
                <br><h4 class="subheader" style="color: green">Chaotic Good</h4>
                A Chaotic Good character favors change for a greater good, disdains bureaucratic organizations that get in the way of social improvement,
                and places a high value on personal freedom, not only for oneself, but for others as well. They always intend to do the right thing,
                but their methods are generally disorganized and often out of alignment with the rest of society.
                <br><h4 class="subheader" style="color: lightgray">Lawful Neutral</h4>
                A Lawful Neutral character typically believes strongly in Lawful concepts such as honor, order, rules and tradition, and often follows a personal code.
                A Lawful Neutral society would typically enforce strict laws to maintain social order, and place a high value on traditions and historical precedent.
                <br><h4 class="subheader" style="color: darkgray">Neutral</h4>
                A Neutral character represents Neutral on both axes, and tends not to feel strongly towards any alignment.
                <br><h4 class="subheader" style="color: gray">Chaotic Neutral</h4>
                A Chaotic Neutral character is an individualist who follows his or her own heart, and generally shirks rules and traditions.
                Although they promote the ideals of freedom, it is their own freedom that comes first.
                Good and Evil come second to their need to be free, and the only reliable thing about them is how totally unreliable they are.
                <br><h4 class="subheader" style="color: red">Lawful Evil</h4>
                A Lawful Evil character sees a well-ordered system as being easier to exploit, and shows a combination of desirable and undesirable traits;
                while they usually obey their superiors and keep their word, they care nothing for the rights and freedomes of other individuals
                and are not averse to twisting the rules to work in their favor.
                <br><h4 class="subheader" style="color: darkred">Evil</h4>
                A Neutral Evil character is typically selfish and has no qualms about turning on their allies-of-the-moment,
                and usually makes allies primarily to further their own goals. They have no compunctions about harming others to get what they want,
                but neither will they go out of their way to cause carnage or mayhem when they see no direct benefit to it.
                They abide by laws for only as long as it is convenient to them.
                <br><h4 class="subheader" style="color: maroon">Chaotic Evil</h4>
                A Chaotic Evil character tends to have no respect for rules, other people's lives, or anything but their own desires, which are typically selfish and cruel.
                They set a high value on personal freedom, but do not have any regard for the lives or freedom of other people.
                <br><br>
            </div>
            <br>
        </div>
    </div>
    <br>

    <div class="clearfooter"></div>
</div>

<%@include file="../../WEB-INF/footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/vendor/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/foundation.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
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
