package me.jie2g.exam;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.unit.DataSize;

import javax.servlet.MultipartConfigElement;

@SpringBootApplication
@Configuration
@MapperScan ("me.jie2g.exam.dao")   //与dao层的@Mapper二选一写上即可(主要作用是扫包)
public class ExamApplication extends SpringBootServletInitializer {
	
	@Override
	protected SpringApplicationBuilder configure (SpringApplicationBuilder application) {
		return application.sources (ExamApplication.class);
	}
	
	public static void main (String[] args) {
		SpringApplication.run (ExamApplication.class, args);
	}
	
	/**
	 * 文件上传配置
	 */
	@Bean
	public MultipartConfigElement multipartConfigElement () {
		MultipartConfigFactory factory = new MultipartConfigFactory ();
		//单个文件最大10MB
		factory.setMaxFileSize (DataSize.ofMegabytes (10));
		/// 设置总上传数据总大小100MB
		factory.setMaxRequestSize (DataSize.ofMegabytes (100));
		return factory.createMultipartConfig ();
	}
}
