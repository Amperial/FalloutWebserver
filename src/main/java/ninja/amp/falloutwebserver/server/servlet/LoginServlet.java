package ninja.amp.falloutwebserver.server.servlet;

import ninja.amp.fallout.character.CharacterManager;
import ninja.amp.falloutwebserver.FalloutWebserver;
import ninja.amp.falloutwebserver.server.TokenManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private FalloutWebserver plugin;

    public LoginServlet(FalloutWebserver plugin) {
        this.plugin = plugin;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getQueryString() != null) {
            CharacterManager characterManager = plugin.getCharacterManager();
            TokenManager tokenManager = plugin.getTokenManager();

            String characterName = request.getParameter("character");
            if (characterName != null && !characterName.isEmpty() && characterManager.isCharacter(characterName)) {
                characterName = characterName.toLowerCase();
                String token = request.getParameter("token");
                if (token != null && !token.isEmpty() && tokenManager.removeIfCorrect(characterName, token)) {
                    request.getSession().setAttribute("loggedInAs", characterName);
                }
            }
        }

        response.sendRedirect("/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
