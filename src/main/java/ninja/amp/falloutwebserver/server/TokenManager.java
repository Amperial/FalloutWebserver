package ninja.amp.falloutwebserver.server;

import ninja.amp.fallout.FalloutCore;
import ninja.amp.fallout.config.ConfigAccessor;
import ninja.amp.falloutwebserver.config.FOWSConfig;
import org.bukkit.configuration.file.FileConfiguration;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class TokenManager {

    private FalloutCore fallout;

    public TokenManager(FalloutCore fallout) {
        this.fallout = fallout;
    }

    public synchronized String generateToken(String characterName) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("MD5");
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        digest.update(salt);

        String token = new BigInteger(1, digest.digest(characterName.getBytes())).toString(16);
        long expires = System.currentTimeMillis() + 60000L;

        ConfigAccessor tokenConfig = fallout.getConfigManager().getConfigAccessor(FOWSConfig.TOKENS);
        FileConfiguration config = tokenConfig.getConfig();
        config.set(characterName + ".token", token);
        config.set(characterName + ".expires", expires);
        tokenConfig.saveConfig();

        return token;
    }

    public synchronized boolean removeIfCorrect(String characterName, String token) {
        ConfigAccessor tokenConfig = fallout.getConfigManager().getConfigAccessor(FOWSConfig.TOKENS);
        FileConfiguration config = tokenConfig.getConfig();
        boolean correct = token.equals(config.getString(characterName + ".token"));
        boolean expired = System.currentTimeMillis() > config.getLong(characterName + ".expires");
        if (correct || expired) {
            config.set(characterName, null);
            tokenConfig.saveConfig();
        }

        return correct && !expired;
    }

}
