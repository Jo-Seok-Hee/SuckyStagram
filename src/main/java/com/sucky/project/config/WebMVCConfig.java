package com.sucky.project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.sucky.project.common.FileManagerService;
import com.sucky.project.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer{
	
	@Autowired
	PermissionInterceptor permissionInterceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")// 브라우저에서 접근하도록 하는 path
		.addResourceLocations("file:///"+ FileManagerService.FILE_UPLOAD_PATH);
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(permissionInterceptor)
		.addPathPatterns("/**") //모든 경로가 인터셉터를 거쳐서 수행될지 설정
		.excludePathPatterns("/static/**","/images/**","/user/signout"); //제외할 경로
	}
	
}
