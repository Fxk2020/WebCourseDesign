package com.study.config;

//进行地址映射

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MyMvcConfig implements WebMvcConfigurer {

    //添加拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

//        添加拦截器的同时，可以添加不受拦截的url
        registry.addInterceptor(new LoginHandlerInterceptor()).addPathPatterns("/**")
                .excludePathPatterns("/index.html","/","/register.html","/service/*",
                        "/css/*","/js/*","/files/*","/img/*");//静态资源也要不拦截
    }

    @Override
    //做页面映射！！！
    public void addViewControllers(ViewControllerRegistry registry) {

        //创建静态网页也需要在控制器中注册
        registry.addViewController("/").setViewName("index");
        registry.addViewController("/index.html").setViewName("index");
        registry.addViewController("/main.html").setViewName("main");
        registry.addViewController("/register.html").setViewName("register");
        registry.addViewController("/personal.html").setViewName("personal");
        registry.addViewController("/messageReply.html").setViewName("messageReply");
        registry.addViewController("/course.html").setViewName("course");

        registry.addViewController("/vip/videos.html").setViewName("vip/videos");
        registry.addViewController("/messageP/personal.html").setViewName("messageP/personalCenter");

        //改名--路径名的重命名
        registry.addViewController("/service/monitor").setViewName("board");
    }


}
