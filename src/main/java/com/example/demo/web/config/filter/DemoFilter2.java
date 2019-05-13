package com.example.demo.web.config.filter;


import com.example.demo.web.config.UrlPatterns;

import javax.servlet.*;
import java.io.IOException;

@UrlPatterns(value = "/**")
public class DemoFilter2 implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("init DemoFilter2");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("doFilter DemoFilter2");
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        System.out.println("destroy DemoFilter2");
    }
}
