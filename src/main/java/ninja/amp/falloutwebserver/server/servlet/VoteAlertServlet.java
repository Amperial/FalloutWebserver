package ninja.amp.falloutwebserver.server.servlet;

import ninja.amp.falloutwebserver.FalloutWebserver;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VoteAlertServlet extends HttpServlet {

    private FalloutWebserver plugin;

    public VoteAlertServlet(FalloutWebserver plugin) {
        this.plugin = plugin;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("votereward", plugin.getConfig().getString("votereward", "a hug from amp"));

        request.getRequestDispatcher("/WEB-INF/votealert.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
