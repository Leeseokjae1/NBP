package com.study.nbnb.page;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.github.pagehelper.PageHelper;

@Configuration
public class Pageinfo {
    @Bean
    public PageHelper pageHelper() {
        PageHelper pageHelper = new PageHelper();
        pageHelper.setProperties(new Properties());
        return pageHelper;
    }

}
