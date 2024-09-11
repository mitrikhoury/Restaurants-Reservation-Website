package com.axsos.project.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class WebSecurityConfig {
 	
	private UserDetailsService userDetailsService;
	// Add BCrypt Bean
		@Bean
		public BCryptPasswordEncoder bCryptPasswordEncoder() {
			return new BCryptPasswordEncoder();
		}
	
    	@Bean
    	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
    		
    		http
    		.csrf().disable()
    		.authorizeRequests()
    	                .requestMatchers("/css/", "/js/", "/registration", "/login" , "/home").permitAll()
    	                .requestMatchers("/admin/**").access("hasRole('ADMIN')")    // NEW
    	                .anyRequest().permitAll()
    	                .and()
    	           .formLogin()
            .loginPage("/login")
            .failureUrl("/login?error=true")
            .defaultSuccessUrl("/home" , true)
            .permitAll()
            .and()
        .logout()
            .permitAll();
    		
    		return http.build();
    	    		
    	}
    	
    	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
            auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
        } 
    }