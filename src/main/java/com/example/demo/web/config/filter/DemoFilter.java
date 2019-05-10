package com.example.demo.web.config.filter;

import com.example.demo.web.config.BaseSetting;
import org.apache.catalina.core.ApplicationFilterChain;

import javax.servlet.*;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

import org.apache.catalina.core.ApplicationFilterConfig;

public class DemoFilter implements Filter {

    private List<BaseSetting.FilterWrapper> filterWrapperList;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        ServletContext servletContext = servletRequest.getServletContext();

        Class<ApplicationFilterChain> chainClass = ApplicationFilterChain.class;
        try {
            Field filters = chainClass.getDeclaredField("filters");
            filters.setAccessible(true);
            Object o = filters.get(filterChain);
            Method addFilter = chainClass.getDeclaredMethod("addFilter", ApplicationFilterConfig.class);
            addFilter.setAccessible(true);


            System.out.println("");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }
}
