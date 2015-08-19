<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Fallout Wasteland Legends: Rules</title>

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
        <li><img src="img/banner_rules_1.png"></li>
        <li><img src="img/banner_rules_2.png"></li>
        <li><img src="img/banner_rules_3.png"></li>
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
                            <li>A roleplay skin is required.</li>
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
                            <li><b>You HAVE to be moderated for roleplay actions that are significant such as building, breaking in, fighting etc.</b></li>
                            <li>Staff have the power to overrule any roleplay situation if they believe it was not legitimate in any way shape or form.</li>
                            <li><b>Do NOT meta game</b> roleplay information. Also known as breaking the fourth wall.
                                <ul>
                                    <li>Definition: Using OOC (Out of Character) information the character is unaware of for roleplay.</li>
                                    <li>Example: Someone told you in global that Greg has a hidden chest under his bed, but in roleplay your character does not know.
                                        Although your character does not know about the chest you decide to raid it anyway. This is not allowed.</li>
                                </ul>
                            </li>
                            <li><b>Do NOT power game.</b>
                                <ul>
                                    <li>Definition: Using abilities in roleplay that your character wouldn't realistically be capable of.</li>
                                    <li>Example: You are in a close quarters fight. Your character does not have a gun, but your opponent does.
                                        Your character dodges every bullet and snaps the opponent's weapon in half. Yeah... nope.</li>
                                </ul>
                            </li>
                            <li>Use common sense and real world logic when you are roleplaying.</li>
                            <li>Respect your SPECIAL. Low-STR characters can't use heavy weapons, Low-INT characters
                                have no idea how to write and in extreme cases even have trouble formulating sentences, etc.</li>
                            <li>No RDM, killing a character for no reason is not allowed. Even if you're a raider.</li>
                            <li>New players get a 24 hour grace period in which their first character cannot be roleplay killed.</li>
                            <li>Characters made for getting revenge on another character are not allowed.
                                Most common revenge characters include a family such as a brother, son, or father.</li>
                            <li>Do not harass players OOC or in real life for actions taken in roleplay.</li>
                            <li>Scenes of graphic nature such as torture must have approval from both parties.</li>
                            <li>ERP (Erotic Roleplay) is not allowed on the server.<br>
                                Players who wish to participate in these actions must time skip or do so off of server chat.</li>
                            <li>Remove roleplay description signs when they are no longer needed.</li>
                            <li>Roleplaying with a device other than minecraft is not allowed. This does not mean you can't use them to chat with friends.</li>
                        </ul>
                    </div>
                </div>
                <div class="content" id="stealingrules">
                    <div class="small-3 columns"></div>
                    <div class="small-9 columns content-inner"><br>
                        <ul class="circle">
                            <li>Vandalizing or Robbing a player is only allowed if the player is online.</li>
                            <li>Players that have been offline for over a month can be robbed.</li>
                            <li>Faction community chests can be robbed if at least one faction member is online.</li>
                            <li>Joining a faction to steal their items is not allowed.</li>
                        </ul>
                    </div>
                </div>
                <div class="content" id="consequences">
                    <div class="small-3 columns"></div>
                    <div class="small-9 columns content-inner"><br>
                        <ul class="circle">
                            <li>Language: Warning x3, Kick, 12hr Ban, 24hr Ban, 48hr Ban, Perm-Ban.</li>
                            <li>Spamming: Warning x3, Kick, 48hr Ban, Perm-Ban.</li>
                            <li>Harassment: Kick, 48hr Ban, 48hr Ban, Perm-Ban.</li>
                            <li>Griefing: Kick, 24hr Ban, 48hr Ban, Perm-Ban.</li>
                            <li>Intense Spam: Perm-Ban for guests. 48hr Ban, Perm-Ban.</li>
                            <li>Hacking: Perm-Ban on sight.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>

    <div class="clearfooter"></div>
</div>

<%@include file="WEB-INF/footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/script.min.js"></script>
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
</script>
</body>
</html>
