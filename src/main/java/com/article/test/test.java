package com.article.test;

import com.article.bean.User;
import com.article.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration
public class test {
    @Autowired
    UserService userService;

    @Test
    public void test1(){
        User user=new User();
        user.setUserName("11111111111");
        userService.insert(user);
        System.out.println("success");
    }
}
