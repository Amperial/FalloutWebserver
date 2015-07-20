<%@ page import="org.bukkit.entity.Player" %>
<%@ page import="org.bukkit.Bukkit" %>
<hr/>
<div class="text-center">
    <h4>Online players (<%= Bukkit.getOnlinePlayers().size() %> / <%= Bukkit.getMaxPlayers() %>)</h4>
</div>
<ul class="small-block-grid-4 medium-block-grid-8 large-block-grid-12">
    <%
        for (Player player : Bukkit.getOnlinePlayers()) {
            out.println("<li><img src=\"https://minotar.net/avatar/" + player.getName() + "/100\"></li>");
        }
    %>
</ul>