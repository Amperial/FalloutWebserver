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

import ninja.amp.fallout.config.ConfigAccessor;
import ninja.amp.falloutwebserver.FOWSConfig;
import ninja.amp.falloutwebserver.FalloutWebserver;
import org.bukkit.configuration.file.FileConfiguration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ApplyServlet extends HttpServlet {

    private FalloutWebserver plugin;

    public ApplyServlet(FalloutWebserver plugin) {
        this.plugin = plugin;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FileConfiguration applyConfig = plugin.getConfigManager().getConfig(FOWSConfig.APPLICATIONS);
        if (applyConfig.contains("backstory")) {
            String backstory = applyConfig.getString("backstory");
            request.setAttribute("backstory", backstory);
        } else {
            request.setAttribute("backstory", "this is the player's backstory");
        }
        request.getRequestDispatcher("/apply.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConfigAccessor applyConfig = plugin.getConfigManager().getConfigAccessor(FOWSConfig.APPLICATIONS);
        applyConfig.getConfig().set("backstory", request.getParameter("backstory"));
        applyConfig.saveConfig();

        request.setAttribute("backstory", request.getParameter("backstory"));
        request.getRequestDispatcher("/apply.jsp").forward(request, response);
    }

}
