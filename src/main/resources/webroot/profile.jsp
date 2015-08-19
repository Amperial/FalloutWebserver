<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Fallout Wasteland Legends: ${characterName}</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.min.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">

    <script src="${pageContext.request.contextPath}/js/vendor/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
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
                <div class="small-12 medium-11 large-10 small-centered columns" style="font-size: 16px">
                    <br>
                    <c:choose>
                        <c:when test="${not empty characterName}">
                            <h3 class="text-center">${characterName}</h3>
                            <hr/>
                            <h4 class="text-center">${ownerName}</h4>
                            <br>
                            <ul class="small-block-grid-6 small-centered text-center">
                                <li>Gender:<br>${gender}</li>
                                <li>Race:<br>${race}</li>
                                <li>Alignment:<br>${alignment}</li>
                                <li>Age:<br>${age}</li>
                                <li>Height:<br>${height}</li>
                                <li>Weight:<br>${weight}</li>
                            </ul>
                            <br>

                            <ul class="small-block-grid-3 small-centered text-center">
                                <li>
                                    Level: ${level}<br><br>
                                    Perks:<br>
                                    <ul class="circle">
                                        <c:forEach items="${perks}" var="perk">
                                            <li>${perk}</li>
                                        </c:forEach>
                                    </ul>
                                </li>
                                <li>
                                    <img class="image-center" src="http://cravatar.eu/3d/${avatarName}/200">
                                </li>
                                <li>
                                    Faction: ${faction}<br><br>
                                    Knowledge:<br>
                                    <ul class="circle">
                                        <c:forEach items="${knowledge}" var="information">
                                            <li>${information}</li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </ul>

                            <h4 class="text-center">SPECIAL Traits</h4>
                            <hr/>
                            <ul class="small-block-grid-7 small-centered text-center">
                                <li><span class="text-circle">S: ${strength}</span></li>
                                <li><span class="text-circle">P: ${perception}</span></li>
                                <li><span class="text-circle">E: ${endurance}</span></li>
                                <li><span class="text-circle">C: ${charisma}</span></li>
                                <li><span class="text-circle">I: ${intelligence}</span></li>
                                <li><span class="text-circle">A: ${agility}</span></li>
                                <li><span class="text-circle">L: ${luck}</span></li>
                            </ul>
                            <br>

                            <h4 class="text-center">Skills</h4>
                            <hr/>
                            <ul class="small-block-grid-7 small-centered text-center">
                                <li>Big Guns</li>
                                <li>Conventional Guns</li>
                                <li>Energy Weapons</li>
                                <li>Melee Weapons</li>
                                <li>Lockpicking</li>
                                <li>Sneak</li>
                                <li>Speech</li>
                            </ul>
                            <ul class="small-block-grid-7 small-centered text-center">
                                <li><span class="text-circle">${bigguns}</span></li>
                                <li><span class="text-circle">${conventionalguns}</span></li>
                                <li><span class="text-circle">${energyweapons}</span></li>
                                <li><span class="text-circle">${meleeweapons}</span></li>
                                <li><span class="text-circle">${lockpicking}</span></li>
                                <li><span class="text-circle">${sneak}</span></li>
                                <li><span class="text-circle">${speech}</span></li>
                            </ul>
                            <ul class="small-block-grid-7 small-centered text-center">
                                <li>Explosives</li>
                                <li>Unarmed</li>
                                <li>First Aid</li>
                                <li>Surgery</li>
                                <li>Repair</li>
                                <li>Science</li>
                                <li>Logical Thinking</li>
                            </ul>
                            <ul class="small-block-grid-7 small-centered text-center">
                                <li><span class="text-circle">${explosives}</span></li>
                                <li><span class="text-circle">${unarmed}</span></li>
                                <li><span class="text-circle">${firstaid}</span></li>
                                <li><span class="text-circle">${surgery}</span></li>
                                <li><span class="text-circle">${repair}</span></li>
                                <li><span class="text-circle">${science}</span></li>
                                <li><span class="text-circle">${logicalthinking}</span></li>
                            </ul>
                            <br>

                            <c:choose>
                                <c:when test="${fn:toLowerCase(param.character) == loggedInAs}">
                                    <h4 class="text-center">Personality <a id="editpersonality" href="#"><img src="${pageContext.request.contextPath}/img/edit.png"></a></h4>
                                </c:when>
                                <c:otherwise>
                                    <h4 class="text-center">Personality</h4>
                                </c:otherwise>
                            </c:choose>
                            <hr/>
                            <form method="post">
                                <div id="personality">
                                    ${personality}
                                </div>
                                <textarea name="personalityeditor" id="personalityeditor" style="display: none"></textarea>
                            </form>
                            <br>

                            <c:choose>
                                <c:when test="${fn:toLowerCase(param.character) == loggedInAs}">
                                    <h4 class="text-center">Back Story <a id="editbackstory" href="#"><img src="${pageContext.request.contextPath}/img/edit.png"></a></h4>
                                </c:when>
                                <c:otherwise>
                                    <h4 class="text-center">Back Story</h4>
                                </c:otherwise>
                            </c:choose>
                            <hr/>
                            <form method="post">
                                <div id="backstory">
                                    ${backstory}
                                </div>
                                <textarea name="backstoryeditor" id="backstoryeditor" style="display: none"></textarea>
                            </form>
                        </c:when>
                        <c:otherwise>
                            Character not found.
                        </c:otherwise>
                    </c:choose>
                </div>
                <br>
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

    $('#editpersonality').click(function (event) {
        $('#editpersonality').hide();
        $('#editbackstory').hide();

        $('#personalityeditor').html("${personality}").resize();
        CKEDITOR.replace('personalityeditor');
        $('#personality').html("");

        event.preventDefault();
    });

    $('#editbackstory').click(function (event) {
        $('#editpersonality').hide();
        $('#editbackstory').hide();

        $('#backstoryeditor').html("${backstory}").resize();
        CKEDITOR.replace('backstoryeditor');
        $('#backstory').html("");

        event.preventDefault();
    });
</script>
</body>
</html>
