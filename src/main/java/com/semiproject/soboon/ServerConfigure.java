package com.semiproject.soboon;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ServerConfigure implements WebMvcConfigurer {

	private static final List<String> URL_PATERRNS = Arrays.asList(
			"/board/shareBoardWrite","/board/shareBoardWriteOK",
			"/board/shareBoardEdit","/board/shareBoardEditOk",
			"/board/shareBoardDel","/admin", "/pick/insertPick",
			"/pick/deletePick"
			
			);
	private static final List<String> URL_PATERRNS_ADMIN = Arrays.asList(			
			"/admin/**"
			);
	
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATERRNS);
		registry.addInterceptor(new AdminInterceptor()).addPathPatterns(URL_PATERRNS_ADMIN);
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		commonsMultipartResolver.setDefaultEncoding("UTF-8");
		return commonsMultipartResolver;
	}
}
