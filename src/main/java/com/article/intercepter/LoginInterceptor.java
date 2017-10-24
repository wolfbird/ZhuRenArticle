package com.article.intercepter;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by admin on 2017/4/17.
 */
public class LoginInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //获取请求的url
        String url = httpServletRequest.getRequestURI();
        //公开地址(实际开发配置在配置文件中)
        if(url.contains("login.action") ||
                url.contains("home.action")||
                url.contains("article.action")||
                url.contains("logout.action")||
                url.contains("register.action")||
                url.contains("user.action")||
                url.contains("articleClick.action")||
                url.contains("exist.action")||
                url.contains("check.action")||
                url.contains("allArticle.action")) {
            return true;
        }

        HttpSession session = httpServletRequest.getSession();
        String username = (String) session.getAttribute("username");
        if(username != null){
            return true;
        }

        httpServletRequest.getRequestDispatcher("/WEB-INF/jsp/home.jsp").forward(httpServletRequest,httpServletResponse);
        return false;
    }


    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }


    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
