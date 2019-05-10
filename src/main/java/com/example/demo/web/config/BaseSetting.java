package com.example.demo.web.config;


import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public abstract class BaseSetting {


    public List<InterceptorWrapper> getHandlerInterceptors() {
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

    public List<FilterWrapper> getHandlerFilters() {
        List<Class<? extends Filter>> filters = getFilters();
        List<FilterWrapper> ret = new ArrayList<>(filters.size());
        for (Class<? extends Filter> filter : filters) {
            try {
                Filter bean = filter.getConstructor().newInstance();
                FilterWrapper wrapper = new FilterWrapper();
                wrapper.setFilter(bean);
                wrapper.setUrlPatterns("/**");
                ret.add(wrapper);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return ret;
    }

    protected abstract List<Class<? extends HandlerInterceptor>> getInterceptors();

    protected abstract List<Class<? extends Filter>> getFilters();


    public static class InterceptorWrapper{
        private HandlerInterceptor interceptor;
        private String[] pattens;

        public HandlerInterceptor getInterceptor() {
            return interceptor;
        }

        public void setInterceptor(HandlerInterceptor interceptor) {
            this.interceptor = interceptor;
        }

        public String[] getPattens() {
            return pattens;
        }

        public void setPattens(String... pattens) {
            this.pattens = pattens;
        }
    }

    public static class FilterWrapper{
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

    }
}
