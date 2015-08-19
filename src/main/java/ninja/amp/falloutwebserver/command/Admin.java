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
package ninja.amp.falloutwebserver.command;

import net.md_5.bungee.api.chat.ClickEvent;
import net.md_5.bungee.api.chat.ComponentBuilder;
import net.md_5.bungee.api.chat.HoverEvent;
import net.md_5.bungee.api.chat.TextComponent;
import ninja.amp.fallout.command.Command;
import ninja.amp.falloutwebserver.FalloutWebserver;
import ninja.amp.falloutwebserver.server.TokenManager;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.permissions.Permission;
import org.bukkit.permissions.PermissionDefault;

import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * A command that gives the sender a clickable link that logs them into the fallout website admin panel.
 *
 * @author Austin Payne
 */
public class Admin extends Command {

    private FalloutWebserver plugin;

    public Admin(FalloutWebserver plugin) {
        super(plugin, "admin");
        setDescription("Gets a link to login to the fallout website admin panel.");
        setCommandUsage("/fow admin");
        setPermission(new Permission("falloutwebserver.admin", PermissionDefault.OP));

        this.plugin = plugin;
    }

    @Override
    public void execute(String command, CommandSender sender, List<String> args) {
        TextComponent message = new TextComponent("Click to login to the admin panel!");
        message.setHoverEvent(new HoverEvent(HoverEvent.Action.SHOW_TEXT, new ComponentBuilder("Go to the admin panel!").create()));
        message.setUnderlined(true);

        String link = plugin.getConfig().getString("webserverurl", "http://localhost:80/");
        try {
            String token = plugin.getTokenManager().generateToken(TokenManager.ADMIN);
            link += "admin?token=" + token;
        } catch (NoSuchAlgorithmException e) {
            plugin.getMessenger().debug(e);
        }
        message.setClickEvent(new ClickEvent(ClickEvent.Action.OPEN_URL, link));

        ((Player) sender).spigot().sendMessage(message);
    }

}
