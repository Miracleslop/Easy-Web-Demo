package com.example.demo.web.config;


import com.example.demo.web.config.filter.DemoFilter;
import com.example.demo.web.config.filter.DemoFilter1;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        ApplicationContext ac = SpringContext.getApplicationContext();
        BaseSetting setting = (BaseSetting) ac.getBean("interceptorSetting");
        List<BaseSetting.InterceptorWrapper> wrappers = setting.getHandlerInterceptors();
        for (BaseSetting.InterceptorWrapper wrapper : wrappers) {
            registry.addInterceptor(wrapper.getInterceptor())
                    .addPathPatterns(wrapper.getPattens());
        }

    }


    @Bean
    public FilterRegistrationBean filterBean() {
//        ApplicationContext ac = SpringContext.getApplicationContext();
//        BaseSetting setting = (BaseSetting) ac.getBean("interceptorSetting");
//        List<BaseSetting.FilterWrapper> handlerFilters = setting.getHandlerFilters();

//        DemoFilter demoFilter = new DemoFilter();
        FilterRegistrationBean bean = new FilterRegistrationBean<>(new DemoFilter());
        bean.addUrlPatterns("/*");
        bean.setName("DemoFilter");
        return bean;
    }
}
