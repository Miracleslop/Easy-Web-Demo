package com.example.demo.web.config;

import com.example.demo.web.config.filter.DemoFilter1;
import com.example.demo.web.config.filter.DemoFilter2;
import com.example.demo.web.config.interceptor.DemoInterceptor1;
import com.google.common.collect.Lists;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.Filter;
import java.util.List;


@Component(value = "interceptorSetting")
public class InterceptorSetting extends BaseSetting {

    @Override
    protected List<Class<? extends HandlerInterceptor>> getInterceptors() {
        return Lists.newArrayList(DemoInterceptor1.class);
    }

    @Override
    protected List<Class<? extends Filter>> getFilters() {
        return Lists.newArrayList(DemoFilter1.class);
    }
}
