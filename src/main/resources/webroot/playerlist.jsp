<%@ page import="org.bukkit.entity.Player" %>
<%@ page import="org.bukkit.Bukkit" %>
<h4 class="strike">Online players (<%= Bukkit.getOnlinePlayers().size() %> / <%= Bukkit.getMaxPlayers() %>)</h4>
<ul class="small-block-grid-4 medium-block-grid-8 large-block-grid-12">
    <%
        for (Player player : Bukkit.getOnlinePlayers()) {
            String name = player.getName();
            %>
            <li><img src="https://minotar.net/avatar/<%= name %>/100" title="<%= name %>"></li>
            <%
        }
    %>
</ul>