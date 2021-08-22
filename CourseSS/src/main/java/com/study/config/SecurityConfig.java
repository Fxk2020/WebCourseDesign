package com.study.config;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    /**
     * 链式编程
     * @param http 授权
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/vip/**").hasRole("vip");

        http.exceptionHandling()
                .accessDeniedHandler(new MyAccessDeniedHandler());

        //没有权限的话--进入登录页面
        http.formLogin().loginPage("/main.html");

        //注销账户
        http.logout()
                .logoutSuccessUrl("/index.html")
                .invalidateHttpSession(true);

        //关闭跨域访问csrf，解决注销404问题--注销账户必须关闭这个csrf
        http.csrf().disable();

//        //记住我功能  cookie
//        http.rememberMe().rememberMeParameter("remember");

        //SecurityConfigurer允许iframe显示
        http.headers().frameOptions().sameOrigin();

    }

    /**
     * 认证
     * @param auth
     * @throws Exception
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        auth.inMemoryAuthentication().passwordEncoder(new BCryptPasswordEncoder())
                .withUser("fx2k").password(new BCryptPasswordEncoder().encode("fff")).roles("vip");
//                .and()通过and添加用户。

    }
}
