<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
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

    <%@include file="../WEB-INF/header.jsp" %>

    <div class="row content-main">
        <br>

        <div class="small-12 small-centered columns">
            <div id="vote-alert" style="display: none">
                <jsp:include page="/votealert"/>
            </div>
            <ul class="breadcrumbs">
                <li><a href="${pageContext.request.contextPath}/wiki">Wiki</a></li>
                <li class="current"><a href="#">Characters</a></li>
            </ul>

            <h3>Characters</h3>

            <div class="small-12 small-centered columns content-inner">
                <br>
                <ul class="circle">
                    <c:forEach items="${characters}" var="character">
                        <li><a href="${pageContext.request.contextPath}/profile?character=${character}">${character}</a></li>
                    </c:forEach>
                </ul>
                <br>
            </div>
            <br>
        </div>
    </div>
    <br>

    <div class="clearfooter"></div>
</div>

<%@include file="../WEB-INF/footer.jsp" %>

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
