<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fallout Wasteland Legends: Rules</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">
    <script src="js/vendor/modernizr.js"></script>
</head>
<body>
<div id="wrapper">
    <br>
    <!--
    <ul data-orbit>
        <li><img src="img/banner_rules_1.png"></li>
        <li><img src="img/banner_rules_2.png"></li>
        <li><img src="img/banner_rules_3.png"></li>
    </ul>
    <br>
    -->

    <%@include file="WEB-INF/header.jsp"%>

    <div class="row content-main">
        <br>
        <div class="small-12 small-centered columns">
            <ul class="tabs vertical" data-tab>
                <li class="tab-title active"><a href="#globalrules">Global</a></li>
                <li class="tab-title"><a href="#roleplayrules">Roleplay</a></li>
                <li class="tab-title"><a href="#stealingrules">Stealing</a></li>
                <li class="tab-title"><a href="#consequences">Consequences</a></li>
            </ul>
            <div class="tabs-content">
                <div class="content active" id="globalrules">
                    <div class="small-3 columns"></div>
                    <div class="small-9 columns content-inner"><br>
                        These are the general server rules.<br>
                        Remember, staff have the ultimate say in disputes and roleplay.<br>
                        <br>
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
                    <div class="small-9 columns content-inner"><br>
                        <ul class="circle">
                            <li>A roleplay rule.</li>
                        </ul>
                    </div>
                </div>
                <div class="content" id="stealingrules">
                    <div class="small-3 columns"></div>
                    <div class="small-9 columns content-inner"><br>
                        This is how 2 steal duh lols:
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
                    <div class="small-9 columns content-inner"><br>
                        These are the consequences for breaking rules<br>
                    <br></div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="clearfooter"></div>
</div>

<%@include file="WEB-INF/footer.jsp"%>

<script src="js/vendor/jquery.js"></script>
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
