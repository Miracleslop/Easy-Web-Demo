package com.example.demo.web.config;

import javax.servlet.*;
import java.io.IOException;

public class FilterWrapper implements Filter {
    private Filter filter;

    private String[] urlPatterns;

    public Filter getFilter() {
        return filter;
    }

    public void setFilter(Filter filter) {
        this.filter = filter;
    }

    public String[] getUrlPatterns() {
        return urlPatterns;
    }

    public void setUrlPatterns(String... urlPatterns) {
        this.urlPatterns = urlPatterns;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        filter.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        filter.doFilter(servletRequest, servletResponse, filterChain);
    }

    @Override
    public void destroy() {
        filter.destroy();
    }

    public boolean matchFiltersURL(ServletRequest servletRequest) {
        String requestPath = null;
        Object attribute = servletRequest.getAttribute("org.apache.catalina.core.DISPATCHER_REQUEST_PATH");
        if (attribute != null) {
            requestPath = attribute.toString();
        }

        if (this.getUrlPatterns() == null) {
            return true;
        } else if (requestPath == null) {
            return false;
        } else {
            String[] testPaths = this.getUrlPatterns();

            for (int i = 0; i < testPaths.length; ++i) {
                if (matchFiltersURL(testPaths[i], requestPath)) {
                    return true;
                }
            }

            return false;
        }
    }

    private boolean matchFiltersURL(String testPath, String requestPath) {
        if (testPath == null) {
            return false;
        } else if (testPath.equals(requestPath)) {
            return true;
        } else if (testPath.equals("/*")) {
            return true;
        } else if (testPath.endsWith("/*")) {
            if (testPath.regionMatches(0, requestPath, 0, testPath.length() - 2)) {
                if (requestPath.length() == testPath.length() - 2) {
                    return true;
                }

                if ('/' == requestPath.charAt(testPath.length() - 2)) {
                    return true;
                }
            }

            return false;
        } else {
            if (testPath.startsWith("*.")) {
                int slash = requestPath.lastIndexOf(47);
                int period = requestPath.lastIndexOf(46);
                if (slash >= 0 && period > slash && period != requestPath.length() - 1 && requestPath.length() - period == testPath.length() - 1) {
                    return testPath.regionMatches(2, requestPath, period + 1, testPath.length() - 2);
                }
            }

            return false;
        }
    }
}
