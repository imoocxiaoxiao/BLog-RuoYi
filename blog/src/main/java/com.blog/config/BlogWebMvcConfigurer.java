package com.blog.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class BlogWebMvcConfigurer implements WebMvcConfigurer {


    public void addResourceHandlers(ResourceHandlerRegistry registry) {
       registry.addResourceHandler("/upload/**").addResourceLocations("file:" + Constants.FILE_UPLOAD_DIC);

        //当部署在其他系统上时，这个可以给到参考与提示作用
//        String os = System.getProperty("os.name");
//        if (os.toLowerCase().startsWith("win")) {  //如果是Windows系统
//            registry.addResourceHandler("/smallapple/**")
//                    // /apple/**表示在磁盘apple目录下的所有资源会被解析为以下的路径
//                    .addResourceLocations("file:G:/itemsource/smallapple/") //媒体资源
//                    .addResourceLocations("classpath:/META-INF/resources/");  //swagger2页面
//        } else {  //linux 和mac
//            registry.addResourceHandler("/smallapple/**")
//                    .addResourceLocations("file:/resources/smallapple/")   //媒体资源
//                    .addResourceLocations("classpath:/META-INF/resources/");  //swagger2页面;
//        }
    }



}
