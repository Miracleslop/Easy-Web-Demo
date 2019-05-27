package com.example.demo.web.config;


import com.example.demo.web.config.filter.DemoFilter;
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
        BaseSetting setting = ac.getBean(BaseSetting.class);
        List<InterceptorWrapper> wrappers = setting.getHandlerInterceptors();
        for (InterceptorWrapper wrapper : wrappers) {
            registry.addInterceptor(wrapper.getInterceptor())
                    .addPathPatterns(wrapper.getPattens());
        }

    }

    @Bean
    public FilterRegistrationBean filterBean() {
        FilterRegistrationBean bean = new FilterRegistrationBean<>(new DemoFilter());
        bean.addUrlPatterns("/*");
        bean.setName("DemoFilter");
        return bean;
    }
}
