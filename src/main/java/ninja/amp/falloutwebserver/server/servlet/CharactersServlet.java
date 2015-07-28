package ninja.amp.falloutwebserver.server.servlet;

import ninja.amp.fallout.FalloutCore;
import ninja.amp.fallout.character.CharacterManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

public class CharactersServlet extends HttpServlet {

    private FalloutCore fallout;

    public CharactersServlet(FalloutCore fallout) {
        this.fallout = fallout;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CharacterManager characterManager = fallout.getCharacterManager();

        List<String> characters = characterManager.getExistingCharacters();
        Collections.sort(characters);
        request.setAttribute("characters", characters);

        request.getRequestDispatcher("/wiki/characters.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
