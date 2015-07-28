package ninja.amp.falloutwebserver.server.servlet;

import ninja.amp.fallout.Fallout;
import ninja.amp.fallout.FalloutCore;
import ninja.amp.fallout.character.Character;
import ninja.amp.fallout.character.CharacterManager;
import org.bukkit.Bukkit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class PlayerlistServlet extends HttpServlet {

    private FalloutCore fallout;

    public PlayerlistServlet(FalloutCore fallout) {
        this.fallout = fallout;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CharacterManager characterManager = fallout.getCharacterManager();
        Map<UUID, String> players = Fallout.getOnlinePlayers();

        request.setAttribute("playerCount", players.size());
        request.setAttribute("maxPlayers", Bukkit.getMaxPlayers());

        List<String> avatars = new ArrayList<>();
        for (Map.Entry<UUID, String> player : players.entrySet()) {
            UUID playerId = player.getKey();
            String name = player.getValue();
            String img = String.format("<img src=\"http://cravatar.eu/avatar/%1$s/100\" title=\"%1$s\">", name);
            if (characterManager.isOwner(playerId)) {
                Character character = characterManager.getCharacterByOwner(playerId);
                img = String.format("<a href=\"profile?character=%2$s\">%1$s</a>", img, character.getCharacterName());
            }
            avatars.add(img);
        }
        request.setAttribute("avatars", avatars);

        request.getRequestDispatcher("/WEB-INF/playerlist.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
