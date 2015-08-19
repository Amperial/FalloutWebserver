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
package ninja.amp.falloutwebserver.command.vote;

import ninja.amp.fallout.command.Command;
import ninja.amp.falloutwebserver.FOWSMessage;
import ninja.amp.falloutwebserver.FalloutWebserver;
import org.apache.commons.lang.StringUtils;
import org.bukkit.command.CommandSender;
import org.bukkit.permissions.Permission;
import org.bukkit.permissions.PermissionDefault;

import java.util.List;

/**
 * A command that sets the current vote reward.
 *
 * @author Austin Payne
 */
public class SetVoteReward extends Command {

    private FalloutWebserver plugin;

    public SetVoteReward(FalloutWebserver plugin) {
        super(plugin, "setvotereward");
        setDescription("Sets the current vote reward.");
        setCommandUsage("/fow setvotereward");
        setPermission(new Permission("falloutwebserver.setvotereward", PermissionDefault.OP));
        setArgumentRange(1, -1);
        setPlayerOnly(false);

        this.plugin = plugin;
    }

    @Override
    public void execute(String command, CommandSender sender, List<String> args) {

        String voteReward = StringUtils.join(args, " ");
        plugin.getConfig().set("votereward", voteReward);
        plugin.saveConfig();

        fallout.getMessenger().sendMessage(sender, FOWSMessage.VOTEREWARD_SET, voteReward);
    }

}
