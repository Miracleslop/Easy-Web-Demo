package com.example.demo.web.config;


import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.*;
import java.util.ArrayList;
import java.util.List;

public abstract class BaseSetting {


    public final List<InterceptorWrapper> getHandlerInterceptors() {
        List<Class<? extends HandlerInterceptor>> interceptors = getInterceptors();
        List<InterceptorWrapper> ret = new ArrayList<>(interceptors.size());
        for (Class<? extends HandlerInterceptor> interceptor : interceptors) {
            try {
                HandlerInterceptor bean = SpringContext.getBean(interceptor);
                InterceptorWrapper wrapper = new InterceptorWrapper();
                wrapper.setInterceptor(bean);
                wrapper.setPattens("/**");
                ret.add(wrapper);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return ret;
    }

    public final List<FilterWrapper> getHandlerFilters() {
        List<Class<? extends Filter>> filters = getFilters();
        List<FilterWrapper> ret = new ArrayList<>(filters.size());
        for (Class<? extends Filter> filter : filters) {
            try {
                Filter bean = filter.getConstructor().newInstance();
                FilterWrapper wrapper = new FilterWrapper();
                wrapper.setFilter(bean);
                wrapper.setUrlPatterns("/*");
                ret.add(wrapper);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return ret;
    }

    protected List<Class<? extends HandlerInterceptor>> getInterceptors() {
        return new ArrayList<>();
    }

    protected List<Class<? extends Filter>> getFilters() {
        return new ArrayList<>();
    }

}
