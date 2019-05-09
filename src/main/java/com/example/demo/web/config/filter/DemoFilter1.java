package com.example.demo.web.config.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;

@WebFilter(filterName = "DemoFilter1", urlPatterns = "/*", initParams = {
        @WebInitParam(name = "id", value = "1", description = "id")
})
public class DemoFilter1 implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String id = filterConfig.getInitParameter("id");
        System.out.println("init filter 1");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("hello filter 1");
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        System.out.println("destroy filter 1");
    }
}
