/*
 * This file is part of FalloutWebserver.
 *
 * Copyright (c) 2015-2015 <http://github.com/ampayne2/FalloutWebserver//>
 *
 * FalloutWebserver is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FalloutWebserver is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FalloutWebserver.  If not, see <http://www.gnu.org/licenses/>.
 */
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
                if (token != null && !token.isEmpty() && tokenManager.checkToken(characterName, token)) {
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
