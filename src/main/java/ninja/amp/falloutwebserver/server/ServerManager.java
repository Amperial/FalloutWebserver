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

import ninja.amp.falloutwebserver.FalloutWebserver;
import org.apache.tomcat.InstanceManager;
import org.apache.tomcat.SimpleInstanceManager;
import org.eclipse.jetty.annotations.ServletContainerInitializersStarter;
import org.eclipse.jetty.apache.jsp.JettyJasperInitializer;
import org.eclipse.jetty.plus.annotation.ContainerInitializer;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.DefaultServlet;
import org.eclipse.jetty.servlet.ServletHolder;
import org.eclipse.jetty.util.log.Log;
import org.eclipse.jetty.webapp.WebAppContext;

import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.List;

public class ServerManager {

    private Server server;
    
    public ServerManager(FalloutWebserver plugin) {
        Log.setLog(new JettyNullLogger());

        int port = plugin.getConfig().getInt("webserverport", 80);
        this.server = new Server(port);

        System.setProperty("org.apache.jasper.compiler.disablejsr199", "false");
        System.setProperty("java.net.preferIPv4Stack", "true");

        WebAppContext context = new WebAppContext();
        context.setContextPath("/");
        context.setResourceBase(getClass().getClassLoader().getResource("webroot").toExternalForm());
        context.setAttribute(InstanceManager.class.getName(), new SimpleInstanceManager());

        this.server.setHandler(context);

        JettyJasperInitializer sci = new JettyJasperInitializer();
        ServletContainerInitializersStarter sciStarter = new ServletContainerInitializersStarter(context);

        ContainerInitializer initializer = new ContainerInitializer(sci, null);
        List<ContainerInitializer> initializers = new ArrayList<>();
        initializers.add(initializer);

        context.setAttribute("org.eclipse.jetty.containerInitializers", initializers);
        context.addBean(sciStarter, true);

        ClassLoader jspClassLoader = new URLClassLoader(new URL[0], getClass().getClassLoader());
        context.setClassLoader(jspClassLoader);

        context.addServlet(new ServletHolder("default", DefaultServlet.class), "/");
    }

    public void start() {
        if (!this.server.isRunning()) {
            try {
                this.server.start();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void stop() {
        if (this.server.isRunning()) {
            try {
                this.server.stop();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public boolean isRunning() {
        return this.server.isRunning();
    }

}
