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
