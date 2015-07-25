<%@ page import="java.util.UUID" %>
<%@ page import="ninja.amp.fallout.character.Character" %>
<%@ page import="ninja.amp.fallout.character.CharacterManager" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.bukkit.Bukkit" %>
<%@ page import="ninja.amp.fallout.FalloutCore" %>
<%@ page import="ninja.amp.fallout.Fallout" %>
<%
    Map<UUID, String> players = Fallout.getOnlinePlayers();
%>
<h4 class="strike">Online players (<%= players.size() %> / <%= Bukkit.getMaxPlayers() %>)</h4>
<ul class="small-block-grid-4 medium-block-grid-8 large-block-grid-12">
    <%
        FalloutCore fallout = (FalloutCore) application.getAttribute("fallout");
        CharacterManager characterManager = fallout.getCharacterManager();

        for (Map.Entry<UUID, String> player : players.entrySet()) {
            UUID playerId = player.getKey();
            String name = player.getValue();
            if (characterManager.isOwner(playerId)) {
                Character character = characterManager.getCharacterByOwner(playerId);
    %>
    <li><a href="${pageContext.request.contextPath}/profile.jsp?character=<%= character.getCharacterName() %>"><img src="https://minotar.net/avatar/<%= name %>/100" title="<%= name %>"></a></li>
    <%
            } else {
    %>
    <li><img src="https://minotar.net/avatar/<%= name %>/100" title="<%= name %>"></li>
    <%
            }
        }
    %>
</ul>