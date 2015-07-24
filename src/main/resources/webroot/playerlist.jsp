<%@ page import="org.bukkit.entity.Player" %>
<%@ page import="org.bukkit.Bukkit" %>
<%@ page import="ninja.amp.fallout.FalloutCore" %>
<%@ page import="java.util.UUID" %>
<%@ page import="ninja.amp.fallout.character.Character" %>
<%@ page import="ninja.amp.fallout.character.CharacterManager" %>
<h4 class="strike">Online players (<%= Bukkit.getOnlinePlayers().size() %> / <%= Bukkit.getMaxPlayers() %>)</h4>
<ul class="small-block-grid-4 medium-block-grid-8 large-block-grid-12">
    <%
        FalloutCore fallout = (FalloutCore) application.getAttribute("fallout");
        CharacterManager characterManager = fallout.getCharacterManager();

        for (Player player : Bukkit.getOnlinePlayers()) {
            UUID playerId = player.getUniqueId();
            String name = player.getName();
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