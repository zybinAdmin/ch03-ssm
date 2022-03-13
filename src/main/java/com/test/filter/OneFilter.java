package com.test.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class OneFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        //1、调用请求对象读取请求包中请求行中URL，了解用户访问的资源文件
        String uri = request.getRequestURI();
        //2、如果本次请求的资源文件与登录和注册相关【user_Add.html】【login.html 或者 LoginServlet】此时无条件放行
        if (uri.indexOf("userAdd")!=-1 || uri.indexOf("user/add")!=-1  || uri.indexOf("img")!=-1 || "/ch03_ssm/".equals(uri)
                || uri.indexOf("login")!=-1 || uri.indexOf("css/style")!=-1 || uri.indexOf("css/public")!=-1
                || uri.indexOf("js/form.js")!=-1){
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }

        //1、拦截后，通过请求对象Tomcat索要当前用户的HttpSession
        HttpSession session = request.getSession(false);

        //2、判断来访用户身份的合法性
        if (session == null){
            request.getRequestDispatcher("/login_error.html").forward(servletRequest,servletResponse);
            return;
        }
        //3、放行
        filterChain.doFilter(servletRequest,servletResponse);


    }

    @Override
    public void destroy() {

    }
}
