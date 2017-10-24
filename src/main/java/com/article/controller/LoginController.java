package com.article.controller;

import com.article.bean.Article;
import com.article.bean.User;
import com.article.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/11.
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    //注册
    @RequestMapping(value = "/register" ,method = {RequestMethod.POST})
    public String register (HttpServletResponse response,HttpSession session, String username, String password) throws IOException {
        System.out.println("LoginController have get request");
        //默认头像组
        List<String> defaultAvatarList = new ArrayList<String>();
        List <User> users=userService.selectAll();

        defaultAvatarList.add("pig1.png");
        defaultAvatarList.add("pig2.png");
        defaultAvatarList.add("pig3.png");


        User  user=new User();

        //默认头像
        user.setUserAvatar(defaultAvatarList.get(((int)(Math.random()*10))%3));
        user.setUserName(username);
        user.setUserPassword(password);
        user.setUserBio("这人啥也没说");
        user.setUserLocation("地区不明");
        user.setUserValue(0);
        System.out.println("user.username:------"+user.getUserName());
        userService.insert(user);
        session.setAttribute("username",username);
        return  "redirect:/home.action";

    }

    //登录
    @RequestMapping(value = "/login",method = {RequestMethod.POST})
    public String loginSubmit(HttpServletResponse response, HttpSession session, String username, String password) throws IOException {
        User user = userService.selectByUserName(username);
        //存在用户，且密码正确
        session.setAttribute("username", username);
        return "redirect:/home.action";
    }


    //登出
    @RequestMapping("/logout")
    public String logoutSubmit(HttpSession session){
        session.invalidate();
        return "redirect:/home.action";
    }




    @RequestMapping(value = "/exist.action", method = {RequestMethod.POST})
    @ResponseBody
    public String checkExist(String username) {
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        boolean result = true;
        //用户不存在，校验有效
        List<User> UserList = userService.selectAll();
        for (User user:UserList) {
            if (user.getUserName().equals(username)) {
                result = false;
                break;
            }
        }

       map.put("valid", result);
        ObjectMapper mapper = new ObjectMapper();
        String resultString = "";
        try {
            resultString = mapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return resultString;

    }
    @RequestMapping(value = "/check.action", method = {RequestMethod.POST})
    @ResponseBody
    public String check(String username,String password) {
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        boolean result = false;
        List<User> UserList = userService.selectAll();
        for (User user:UserList) {
            if (user.getUserName().equals(username)&&user.getUserPassword().equals(password)) {
                result = true;
                break;
            }
        }
        map.put("valid", result);
        ObjectMapper mapper = new ObjectMapper();
        String resultString = "";
        try {
            resultString = mapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return resultString;

    }

}