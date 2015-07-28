<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<h4 class="strike">Online players (${playerCount} / ${maxPlayers})</h4>
<ul class="small-block-grid-4 medium-block-grid-8 large-block-grid-12">
    <c:forEach items="${avatars}" var="avatar">
        <li>${avatar}</li>
    </c:forEach>
</ul>