<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Fallout Wasteland Legends: Apply</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.min.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">

    <script src="${pageContext.request.contextPath}/js/vendor/modernizr.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico">
</head>
<body>
<div id="wrapper">
    <br>

    <%@include file="WEB-INF/header.jsp" %>

    <div class="row content-main">
        <br>

        <div class="small-12 small-centered columns">
            <div id="vote-alert" style="display: none">
                <jsp:include page="/votealert"/>
            </div>
            <div class="small-12 small-centered columns content-inner">
                <br>
                Do not use your character's back story to give yourself powers, abilities, items, and things that are OP
                <br><br>
                Names do not need to be 50's Era. Your character should have a legitimate name. Permanent broad names are not allowed.
                If your character's face is concealed by a mask or face covering helmet, then it would be allowed to have a name like Masked_Man.
                Example: Someone named Mercenary would not be allowed because Mercenary is a title not a name.
                Someone named Random_Guy would not be allowed because Random guy is not a real name for a person.
                <br><br>
            </div>
        </div>
        <br>
    </div>
    <br>

    <div class="clearfooter"></div>
</div>

<%@include file="WEB-INF/footer.jsp" %>

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
