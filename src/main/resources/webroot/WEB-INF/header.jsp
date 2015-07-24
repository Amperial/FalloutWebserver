<div class="row">
    <div id="header" class="contain-to-grid sticky">
        <nav class="top-bar" data-topbar role="navigation">
            <ul class="title-area">
                <li class="name">
                    <h1><a href="${pageContext.request.contextPath}/index.jsp">Fallout: Wasteland Legends</a></h1>
                </li>
                <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
            </ul>
            <section class="top-bar-section">
                <ul class="right">
                    <li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath}/apply.jsp">Apply!</a></li>
                    <li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath}/rules.jsp">Rules</a></li>
                    <li class="divider"></li>
                    <li class="has-dropdown"><a href="#">Vote</a>
                        <ul class="dropdown">
                            <li><a href="http://www.minestatus.net/128332-fallout-wasteland-legends">Minestatus</a></li>
                            <li><a href="http://minecraft-server-list.com/server/282726/">MC Server List</a></li>
                            <li><a href="http://minecraftservers.org/server/206785">MinecraftServers</a></li>
                            <li><a href="http://minecraft-mp.com/server-s74605">Minecraft Multiplayer</a></li>
                            <li><a href="https://mcserverstatus.com/viewserver/27305">MC Server Status</a></li>
                        </ul>
                    </li>
                    <li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath}/wiki/wiki.jsp">Wiki</a></li>
                    <li class="divider"></li>
                    <li><a href="https://thebigdigmc.info/">Forums</a></li>
                    <li class="divider"></li>
                    <li><a href="http://fallout.thebigdigmc.info:8123/">Webmap</a></li>
                    <li class="divider"></li>
                    <li>
                        <form class="has-form" action="${pageContext.request.contextPath}/profile.jsp" method="get">
                            <div class="row collapse">
                                <div class="large-8 small-9 columns">
                                    <input type="text" name="character" placeholder="Find Character" required pattern="([A-Za-z]+_)?[A-Za-z]+" maxlength="20"
                                           oninput="setCustomValidity('')" oninvalid="setCustomValidity('Please enter up to 20 Alphanumeric characters')">
                                </div>
                                <div class="large-4 small-3 columns">
                                    <input class="button expand" type="submit" value="Find">
                                </div>
                            </div>
                        </form>
                    </li>
                </ul>
            </section>
        </nav>
    </div>
</div>
