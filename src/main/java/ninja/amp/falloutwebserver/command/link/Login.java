package ninja.amp.falloutwebserver.command.link;

import net.md_5.bungee.api.chat.ClickEvent;
import net.md_5.bungee.api.chat.ComponentBuilder;
import net.md_5.bungee.api.chat.HoverEvent;
import net.md_5.bungee.api.chat.TextComponent;
import ninja.amp.fallout.character.Character;
import ninja.amp.fallout.command.commands.character.CharacterCommand;
import ninja.amp.falloutwebserver.FalloutWebserver;
import org.bukkit.entity.Player;
import org.bukkit.permissions.Permission;
import org.bukkit.permissions.PermissionDefault;

import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * A command that gives the sender a clickable link to login to their character on the website.
 *
 * @author Austin Payne
 */
public class Login extends CharacterCommand {

    private FalloutWebserver plugin;

    public Login(FalloutWebserver plugin) {
        super(plugin, "login");
        setDescription("Gets a clickable link to login to your character on the website");
        setCommandUsage("/fow login");
        setPermission(new Permission("falloutwebserver.login", PermissionDefault.TRUE));

        this.plugin = plugin;
    }

    @Override
    public void execute(String command, Player sender, Character character, List<String> args) {
        TextComponent message = new TextComponent("Click to login to the website as your character");
        message.setHoverEvent(new HoverEvent(HoverEvent.Action.SHOW_TEXT, new ComponentBuilder("Login to the website as your character!").create()));
        message.setUnderlined(true);

        String characterName = character.getCharacterName().toLowerCase();
        try {
            String token = plugin.getTokenManager().generateToken(characterName);
            String link = plugin.getConfig().getString("webserverurl", "http://localhost:80/") + "login?character=" + characterName + "&token=" + token;
            message.setClickEvent(new ClickEvent(ClickEvent.Action.OPEN_URL, link));
        } catch (NoSuchAlgorithmException e) {
            plugin.getMessenger().debug(e);
        }

        sender.spigot().sendMessage(message);
    }

}
