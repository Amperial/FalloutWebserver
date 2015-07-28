package ninja.amp.falloutwebserver.command.vote;

import ninja.amp.fallout.command.Command;
import ninja.amp.falloutwebserver.FalloutWebserver;
import ninja.amp.falloutwebserver.message.FOWSMessage;
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
