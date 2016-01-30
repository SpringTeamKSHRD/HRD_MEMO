package com.memo.app.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.mangofactory.swagger.configuration.SpringSwaggerConfig;
import com.mangofactory.swagger.models.dto.builder.ApiInfoBuilder;
import com.mangofactory.swagger.plugin.EnableSwagger;
import com.mangofactory.swagger.plugin.SwaggerSpringMvcPlugin;
//this class were created for testing purpose only
@Configuration
@EnableSwagger
public class SwaggerConfig {
	
	private SpringSwaggerConfig springSwaggerConfig;
	
	@Autowired 
	public void setSpringSwaggerConfig(SpringSwaggerConfig springSwaggerConfig){
		this.springSwaggerConfig = springSwaggerConfig;
	}
	
	@Bean
	public SwaggerSpringMvcPlugin configureSwagger() {		 
		return new SwaggerSpringMvcPlugin(this.springSwaggerConfig)
				.apiInfo(new ApiInfoBuilder()
							.title("Memo Management REST API")
							.description("Memo Admin Management")
							.termsOfServiceUrl("http://example.com/terms-of-service")
							.contact("info@example.com")
							.license("MIT License")
							.licenseUrl("http://opensource.org/licenses/MIT")
							.build())
				.apiVersion("1.0")
				.includePatterns(".*api.*");
	}
}