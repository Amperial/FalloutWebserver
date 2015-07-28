package ninja.amp.falloutwebserver.server;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;

public class JspFilter implements Filter {
    HashSet<String> extensions = new HashSet<>();
    HashSet<String> jspPages = new HashSet<>();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        extensions.add(".css");
        extensions.add(".js");
        extensions.add(".img");
        extensions.add(".png");
        extensions.add(".jpg");
        extensions.add(".jpeg");
        extensions.add(".gif");
        extensions.add(".ico");
        extensions.add(".swf");
        extensions.add(".woff");
        extensions.add(".woff2");
        extensions.add(".ttf");
        extensions.add(".eot");

        // Pages without a servlet
        jspPages.add("/apply");
        jspPages.add("/rules");
        jspPages.add("/wiki");
        jspPages.add("/wiki/lore");
        jspPages.add("/wiki/characters/alignments");
        jspPages.add("/wiki/characters/races");
        jspPages.add("/webmap");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String context = request.getContextPath();
        String uri = request.getRequestURI();
        String qStr = request.getQueryString();

        if (shouldExclude(uri)) {
            chain.doFilter(req, res);
        }

        if (uri.endsWith("/")) {
            uri = uri.substring(0, uri.lastIndexOf("/"));
        }
        if (uri.endsWith(".jsp")) {
            uri = uri.substring(0, uri.lastIndexOf(".jsp"));
        }
        if (uri.equals("index")) {
            uri = "";
        }
        if (request.getRequestURI().equals(uri)) {
            if (jspPages.contains(uri)) {
                // Forward to jsp page
                request.getRequestDispatcher(uri + ".jsp").forward(req, res);
            } else {
                // Forward to servlet
                request.getRequestDispatcher(uri).forward(req, res);
            }
        } else if (uri.isEmpty() && (qStr == null || qStr.isEmpty())) {
            // Forward to home page
            request.getRequestDispatcher("index.jsp").forward(req, res);
        } else {
            if (!uri.isEmpty() && qStr != null && !qStr.isEmpty()) {
                uri += "?" + qStr;
            }

            // Redirect to correctly formatted uri
            response.sendRedirect(uri);
        }
    }

    private boolean shouldExclude(String uri) {
        return uri.contains(".") && extensions.contains(uri.substring(uri.lastIndexOf(".")));
    }

    @Override
    public void destroy() {
    }

}
