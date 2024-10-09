package com.systex.lotterygame.filter;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import com.systex.lotterygame.filter.LoginFilter;

@Configuration
public class WebConfig implements WebMvcConfigurer {

//    @Bean
//    public FilterRegistrationBean<LoginFilter> loggingFilter(){
//        FilterRegistrationBean<LoginFilter> registrationBean = new FilterRegistrationBean<>();
//        registrationBean.setFilter(new LoginFilter());
//        registrationBean.addUrlPatterns("/lottery/*"); //保護/lottery下的所有URL
//        return registrationBean;
//    }
}