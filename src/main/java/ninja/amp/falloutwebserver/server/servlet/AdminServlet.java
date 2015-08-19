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

import ninja.amp.falloutwebserver.FalloutWebserver;
import ninja.amp.falloutwebserver.server.TokenManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AdminServlet extends HttpServlet {

    private FalloutWebserver plugin;

    public AdminServlet(FalloutWebserver plugin) {
        this.plugin = plugin;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getQueryString() != null) {
            TokenManager tokenManager = plugin.getTokenManager();

            String token = request.getParameter("token");
            if (token != null && !token.isEmpty() && tokenManager.removeIfCorrect(TokenManager.ADMIN, token)) {
                request.getSession().setAttribute("isAdmin", true);
                response.sendRedirect("/admin");
            }
        }
        if (request.getSession().getAttribute("isAdmin") == null) {
            response.sendRedirect("/");
        }

        List<String> applications = new ArrayList<>();
        applications.add("application1");
        applications.add("application2");
        applications.add("application3");
        Collections.sort(applications);
        request.setAttribute("applications", applications);

        // TODO: Handle setting up attributes for applications etc.
        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
