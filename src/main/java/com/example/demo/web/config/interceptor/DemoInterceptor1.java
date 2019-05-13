package com.example.demo.web.config.interceptor;

import com.example.demo.api.ISectionService;
import com.example.demo.service.entity.Section;
import com.example.demo.web.config.UrlPatterns;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Component
@UrlPatterns(value = "/**")
public class DemoInterceptor1 implements HandlerInterceptor {

    @Autowired
    private ISectionService sectionService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        List<Section> list = sectionService.list();
        System.out.println("interceptor 1");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
