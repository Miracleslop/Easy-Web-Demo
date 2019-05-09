package com.example.demo.web.config;


import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        ApplicationContext ac = SpringContext.getApplicationContext();
        Object demoInterceptor1 = ac.getBean("DemoInterceptor1");
        registry.addInterceptor((HandlerInterceptor) demoInterceptor1)
                .addPathPatterns("/**");
    }
}
