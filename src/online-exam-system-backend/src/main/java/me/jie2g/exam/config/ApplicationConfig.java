
package me.jie2g.exam.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ApplicationConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers (ResourceHandlerRegistry registry) {
		// 静态资源映射
		registry.addResourceHandler ("/static/upload/img/**").addResourceLocations ("classpath:/static/upload/img/");
		registry.addResourceHandler ("/static/doc/**").addResourceLocations ("classpath:/static/doc/");
		
		WebMvcConfigurer.super.addResourceHandlers (registry);
	}
}

