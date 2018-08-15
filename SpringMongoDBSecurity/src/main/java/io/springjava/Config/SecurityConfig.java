package io.springjava.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;


/**
 * @author Saeed Eslami
 *
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/static/**");
    }
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests().antMatchers("/").permitAll()
            .antMatchers("/welcome").hasAnyRole("USER", "ADMIN")
            .antMatchers("/signout").hasAnyRole("USER", "ADMIN")
            .antMatchers("/show-users").hasAnyRole("USER", "ADMIN")
            .antMatchers("/register").hasAnyRole("USER","ADMIN")
            .antMatchers("/signin").hasAnyRole("USER","ADMIN")
            .anyRequest().authenticated()
            .and()
            .formLogin().loginPage("/login").permitAll()
            .and()
            .logout().permitAll();

        http.csrf().disable();
    }
	
    @Bean
    @Override
    public UserDetailsService userDetailsService() {

    	PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
    	 // outputs {bcrypt}$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG
    	 // remember the password that is printed out and use in the next step
//    	 System.out.println(encoder.encode("user"));
//    	 System.out.println("*******************************");
//    	 System.out.println(encoder.encode("admin"));
    	 
    	 UserDetails user = User.withUsername("user")
    	     .password("{bcrypt}$2a$10$YIit9dwxnUqcTlWyYgLuFOcdbTx.Fz6r7eXxq5PYcP8VXCL7S17e.")
    	     .roles("USER")
    	     .build();

    	 UserDetails admin = User.withUsername("admin")
        	     .password("{bcrypt}$2a$10$LzXORsx7lomuc9LvuPHF6OYSVlNejgpOTkfesf1XJiKwv7RxBgAwe")
        	     .roles("ADMIN")
        	     .build();
    	 
        return new InMemoryUserDetailsManager(user,admin);
    }
}
