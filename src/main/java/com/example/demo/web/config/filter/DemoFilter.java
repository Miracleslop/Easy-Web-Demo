package com.example.demo.web.config.filter;


import com.example.demo.web.config.BaseSetting;
import com.example.demo.web.config.FilterWrapper;
import com.example.demo.web.config.SpringContext;
import org.springframework.context.ApplicationContext;

import javax.servlet.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DemoFilter implements Filter, FilterChain {

    private final List<FilterWrapper> eFilterChain = new ArrayList<>();

    private ThreadLocal<Integer> pos;

    private int n;

    private boolean isFirst = true;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        if (isFirst) {
            synchronized (this) {
                if (isFirst) {
                    pos = ThreadLocal.withInitial(() -> 0);
                    //  初始化所有的过滤器
                    ApplicationContext ac = SpringContext.getApplicationContext();
                    BaseSetting setting = ac.getBean(BaseSetting.class);
                    List<FilterWrapper> handlerFilters = setting.getHandlerFilters();
                    eFilterChain.addAll(handlerFilters);
                    n = eFilterChain.size();
                    isFirst = false;
                }
            }
        }
        pos.set(0);
        this.doFilter(servletRequest, servletResponse);
        Integer i = pos.get();
        if(i >= n) {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
        for (FilterWrapper filter : eFilterChain) {
            filter.destroy();
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse) throws IOException, ServletException {
        Integer i = pos.get();
        if (i < n) {
            FilterWrapper filter = eFilterChain.get(i);
            pos.set(++i);
            while (!filter.matchFiltersURL(servletRequest) && i < n) {
                filter = eFilterChain.get(i);
                pos.set(++i);
            }

            if (i <= n) {
                filter.doFilter(servletRequest, servletResponse, this);
            }
        }
    }
}
