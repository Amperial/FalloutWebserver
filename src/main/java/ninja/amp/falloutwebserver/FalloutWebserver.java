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
package ninja.amp.falloutwebserver;

import ninja.amp.fallout.Fallout;
import ninja.amp.fallout.FalloutCore;
import ninja.amp.fallout.character.CharacterManager;
import ninja.amp.fallout.command.CommandController;
import ninja.amp.fallout.command.CommandGroup;
import ninja.amp.fallout.command.commands.roll.RollManager;
import ninja.amp.fallout.config.ConfigManager;
import ninja.amp.fallout.faction.FactionManager;
import ninja.amp.fallout.message.Messenger;
import ninja.amp.falloutwebserver.command.AboutCommand;
import ninja.amp.falloutwebserver.command.ReloadCommand;
import ninja.amp.falloutwebserver.command.vote.SetVoteReward;
import ninja.amp.falloutwebserver.command.vote.VoteReward;
import ninja.amp.falloutwebserver.config.FOWSConfig;
import ninja.amp.falloutwebserver.server.ServerManager;
import org.bukkit.Bukkit;
import org.bukkit.event.Listener;
import org.bukkit.plugin.java.JavaPlugin;

import java.util.EnumSet;
import java.util.LinkedHashSet;

/**
 * The main class of the Fallout Webserver plugin.
 *
 * @author Austin Payne
 */
public class FalloutWebserver extends JavaPlugin implements FalloutCore, Listener {

    private FalloutCore fallout;
    private ServerManager serverManager;

    @Override
    public void onEnable() {
        if (Bukkit.getPluginManager().isPluginEnabled("Fallout")) {
            fallout = JavaPlugin.getPlugin(Fallout.class);
        } else {
            return;
        }

        saveDefaultConfig();
        fallout.getConfigManager().registerCustomConfigs(EnumSet.allOf(FOWSConfig.class), this);

        // Create fallout webserver command tree
        CommandGroup falloutweb = new CommandGroup(this, "falloutwebserver")
                .addChildCommand(new AboutCommand(this))
                .addChildCommand(new ReloadCommand(this))
                .addChildCommand(new VoteReward(this))
                .addChildCommand(new SetVoteReward(this));

        // Add fallout webserver command tree to command controller
        fallout.getCommandController().addCommand(falloutweb);

        // Create and start webserver
        serverManager = new ServerManager(this);
        serverManager.start();
    }

    @Override
    public void onDisable() {
        CommandController commandController = fallout.getCommandController();
        for (CommandGroup command : new LinkedHashSet<>(commandController.getCommands())) {
            if (command.getPlugin().equals(this)) {
                commandController.removeCommand(command);
            }
        }
        serverManager.stop();
        serverManager = null;
        fallout = null;
    }

    @Override
    public JavaPlugin getPlugin() {
        return this;
    }

    @Override
    public ConfigManager getConfigManager() {
        return fallout.getConfigManager();
    }

    @Override
    public Messenger getMessenger() {
        return fallout.getMessenger();
    }

    @Override
    public CommandController getCommandController() {
        return fallout.getCommandController();
    }

    @Override
    public CharacterManager getCharacterManager() {
        return fallout.getCharacterManager();
    }

    @Override
    public RollManager getRollManager() {
        return fallout.getRollManager();
    }

    @Override
    public FactionManager getFactionManager() {
        return fallout.getFactionManager();
    }

    public ServerManager getServerManager() {
        return serverManager;
    }

}
