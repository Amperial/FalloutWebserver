package ninja.amp.falloutwebserver.command.link;

import net.md_5.bungee.api.chat.ClickEvent;
import net.md_5.bungee.api.chat.ComponentBuilder;
import net.md_5.bungee.api.chat.HoverEvent;
import net.md_5.bungee.api.chat.TextComponent;
import ninja.amp.fallout.command.Command;
import ninja.amp.falloutwebserver.FalloutWebserver;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.permissions.Permission;
import org.bukkit.permissions.PermissionDefault;

import java.util.List;

/**
 * A command that gives the sender a clickable link to the website.
 *
 * @author Austin Payne
 */
public class Website extends Command {

    private TextComponent message;

    public Website(FalloutWebserver plugin) {
        super(plugin, "link");
        setDescription("Gets a clickable link to the fallout website");
        setCommandUsage("/fow link");
        setPermission(new Permission("falloutwebserver.link", PermissionDefault.TRUE));

        message = new TextComponent("Click to visit our website!");
        message.setHoverEvent(new HoverEvent(HoverEvent.Action.SHOW_TEXT, new ComponentBuilder("Go to the fallout website!").create()));
        message.setUnderlined(true);

        String link = plugin.getConfig().getString("webserverurl", "http://localhost:80/");
        message.setClickEvent(new ClickEvent(ClickEvent.Action.OPEN_URL, link));
    }

    @Override
    public void execute(String command, CommandSender sender, List<String> args) {
        ((Player) sender).spigot().sendMessage(message);
    }

}
