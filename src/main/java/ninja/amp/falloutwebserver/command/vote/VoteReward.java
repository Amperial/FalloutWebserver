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

import ninja.amp.fallout.FalloutCore;
import ninja.amp.fallout.command.Command;
import ninja.amp.falloutwebserver.message.FOWSMessage;
import org.bukkit.command.CommandSender;
import org.bukkit.permissions.Permission;
import org.bukkit.permissions.PermissionDefault;

import java.util.List;

/**
 * A command that lists the current vote reward.
 *
 * @author Austin Payne
 */
public class VoteReward extends Command {

    public VoteReward(FalloutCore fallout) {
        super(fallout, "votereward");
        setDescription("Lists the current vote reward.");
        setCommandUsage("/fow votereward");
        setPermission(new Permission("falloutwebserver.votereward", PermissionDefault.TRUE));
        setPlayerOnly(false);
    }

    @Override
    public void execute(String command, CommandSender sender, List<String> args) {
        String voteReward = getPlugin().getConfig().getString("votereward", "a hug from amp");

        fallout.getMessenger().sendMessage(sender, FOWSMessage.VOTEREWARD_LIST, voteReward);
    }

}
