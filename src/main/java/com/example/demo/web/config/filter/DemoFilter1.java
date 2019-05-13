package com.example.demo.web.config.filter;


import com.example.demo.web.config.UrlPatterns;

import javax.servlet.*;
import java.io.IOException;


@UrlPatterns(value = "/**")
public class DemoFilter1 implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String id = filterConfig.getInitParameter("id");
        System.out.println("init filter 1");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("doFilter filter 1");
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        System.out.println("destroy filter 1");
    }
}
