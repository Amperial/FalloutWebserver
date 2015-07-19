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

import org.eclipse.jetty.util.log.Logger;

public class JettyNullLogger implements Logger {

    public String getName() {
        return "FalloutWebserver";
    }

    public void warn(String s, Object... objects) {
    }

    public void warn(Throwable throwable) {
    }

    public void warn(String s, Throwable throwable) {
    }

    public void info(String s, Object... objects) {
    }

    public void info(Throwable throwable) {
    }

    public void info(String s, Throwable throwable) {
    }

    public boolean isDebugEnabled() {
        return false;
    }

    public void setDebugEnabled(boolean b) {
    }

    public void debug(String s, Object... objects) {
    }

    public void debug(String s, long l) {
    }

    public void debug(Throwable throwable) {
    }

    public void debug(String s, Throwable throwable) {
    }

    public Logger getLogger(String s) {
        return this;
    }

    public void ignore(Throwable throwable) {
    }

}
