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
package ninja.amp.falloutwebserver.server;

import ninja.amp.fallout.FalloutCore;
import ninja.amp.fallout.config.ConfigAccessor;
import ninja.amp.falloutwebserver.FOWSConfig;
import org.bukkit.configuration.file.FileConfiguration;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class TokenManager {

    /**
     * The key name of the website admin token.
     */
    public static final String ADMIN = "website.admin";

    private FalloutCore fallout;

    public TokenManager(FalloutCore fallout) {
        this.fallout = fallout;
    }

    public synchronized String generateToken(String key) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("MD5");
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        digest.update(salt);

        String token = new BigInteger(1, digest.digest(key.getBytes())).toString(16).substring(0, 7);
        long expires = System.currentTimeMillis() + 60000L;

        ConfigAccessor tokenConfig = fallout.getConfigManager().getConfigAccessor(FOWSConfig.TOKENS);
        FileConfiguration tokenConfigFile = tokenConfig.getConfig();
        tokenConfigFile.set(key + ".token", token);
        tokenConfigFile.set(key + ".expires", expires);
        tokenConfig.saveConfig();

        return token;
    }

    public synchronized boolean removeIfCorrect(String key, String token) {
        ConfigAccessor tokenConfig = fallout.getConfigManager().getConfigAccessor(FOWSConfig.TOKENS);
        FileConfiguration tokenConfigFile = tokenConfig.getConfig();

        boolean correct = token.equals(tokenConfigFile.getString(key + ".token"));
        boolean expired = System.currentTimeMillis() > tokenConfigFile.getLong(key + ".expires");
        if (correct || expired) {
            tokenConfigFile.set(key, null);
            tokenConfig.saveConfig();
        }

        return correct && !expired;
    }

}
