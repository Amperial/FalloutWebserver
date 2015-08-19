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
import ninja.amp.fallout.character.CharacterManager;
import ninja.amp.fallout.command.Command;
import ninja.amp.falloutwebserver.FalloutWebserver;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.permissions.Permission;
import org.bukkit.permissions.PermissionDefault;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.UUID;

/**
 * A command that gives the sender a clickable link to the website.
 *
 * @author Austin Payne
 */
public class Link extends Command {

    private FalloutWebserver plugin;

    public Link(FalloutWebserver plugin) {
        super(plugin, "link");
        setDescription("Gets a link to the fallout website.");
        setCommandUsage("/fow link");
        setPermission(new Permission("falloutwebserver.link", PermissionDefault.TRUE));

        this.plugin = plugin;
    }

    @Override
    public void execute(String command, CommandSender sender, List<String> args) {
        Player player = (Player) sender;
        UUID playerId = player.getUniqueId();

        CharacterManager characterManager = fallout.getCharacterManager();

        TextComponent message = new TextComponent("Click to visit our website!");
        message.setHoverEvent(new HoverEvent(HoverEvent.Action.SHOW_TEXT, new ComponentBuilder("Go to the fallout website!").create()));
        message.setUnderlined(true);

        String link = plugin.getConfig().getString("webserverurl", "http://localhost:80/");
        if (characterManager.isOwner(playerId)) {
            try {
                String name = characterManager.getCharacterByOwner(playerId).getCharacterName().toLowerCase();
                String token = plugin.getTokenManager().generateToken(name);
                link += "login?character=" + name + "&token=" + token;
            } catch (NoSuchAlgorithmException e) {
                plugin.getMessenger().debug(e);
            }
        }
        message.setClickEvent(new ClickEvent(ClickEvent.Action.OPEN_URL, link));

        player.spigot().sendMessage(message);
    }

}
