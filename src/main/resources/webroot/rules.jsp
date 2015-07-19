<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fallout Wasteland Legends: Rules</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/foundation.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    <script src="js/vendor/modernizr.js"></script>
</head>
<body>
<%@include file="WEB-INF/header.jsp"%>
<div id="content">
    <ul class="wide-orbit" data-orbit>
        <li><img src="img/2015-07-02_05.33.48.png"></li>
        <li><img src="img/2015-07-02_05.26.20.png"></li>
        <li><img src="img/2015-07-02_05.14.33.png"></li>
    </ul>

    <div class="row">
        <hr/>
        <ul class="tabs vertical" data-tab>
            <li class="tab-title active"><a href="#globalrules">Global</a></li>
            <li class="tab-title"><a href="#roleplayrules">Roleplay</a></li>
            <li class="tab-title"><a href="#stealingrules">Stealing</a></li>
            <li class="tab-title"><a href="#consequences">Consequences</a></li>
        </ul>
        <div class="tabs-content">
            <div class="content active" id="globalrules">
                <div class="small-3 columns"></div>
                <div class="small-9 columns">
                    <p>These are the general server rules.<br>
                        Remember, staff have the ultimate say in disputes and roleplay.
                    </p>
                    <ul class="circle">
                        <li>Chat Rules
                            <ul>
                                <li>Use RP chat to talk in roleplay (/ch rp) and global chat for all other chat (/ch global).</li>
                                <li>Keep the language in the global chat down to a minimum (Language in roleplay chat is ok).</li>
                                <li>Do not spam, argue, or speak in all caps.</li>
                                <li>Respect the staff and players - harassment will not be tolerated.</li>
                                <li>Do not backseat moderate or impersonate staff.</li>
                                <li>Do not advertise other servers.</li>
                            </ul>
                        </li>
                        <li>Do not hack or abuse glitches. If you discover a glitch report it to a staff member.</li>
                        <li>Modified clients are not allowed. Exceptions include: Mini-map (without radar) and Optifine.<br>
                            If you are unsure about a mod confirm it with staff.</li>
                        <li>Alternate accounts are not allowed.</li>
                        <li>Do not build 1x1 towers for any reason (Especially for scaling walls).</li>
                        <li>Griefing is not allowed.</li>
                        <li>Factions may only claim one area as their base.</li>
                    </ul>
                </div>
            </div>
            <div class="content" id="roleplayrules">
                <div class="small-3 columns"></div>
                <div class="small-9 columns">
                    <ul class="circle">
                        <li>A roleplay rule.</li>
                    </ul>
                </div>
            </div>
            <div class="content" id="stealingrules">
                <div class="small-3 columns"></div>
                <div class="small-9 columns">
                    <p>This is how 2 steal duh lols:</p>
                    <ul class="circle">
                        <li>Robbing a player is only allowed if the player is online.</li>
                        <li>Players that have been offline for over a month can be robbed.</li>
                        <li>Faction community chests can be robbed if at least one faction member is online.</li>
                        <li>Joining a faction to steal their items is not allowed.</li>
                    </ul>
                </div>
            </div>
            <div class="content" id="consequences">
                <div class="small-3 columns"></div>
                <div class="small-9 columns">
                    <p>These are the consequences for breaking rules</p>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="WEB-INF/footer.jsp"%>
<script src="${pageContext.request.contextPath}/js/vendor/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/foundation.min.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>