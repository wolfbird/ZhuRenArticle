package com.article.controller;

import com.article.bean.*;
import com.article.service.*;
//import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/8/12.
 */
@Controller
public class UserController {



    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private StarService starService;
    @Autowired
    private GarnerService garnerService;


    @RequestMapping(value = "/user", method = {RequestMethod.GET},produces = "text/html;charset=UTF-8")
    public  String user(String userName , Model model , HttpSession session) throws UnsupportedEncodingException {
       String usernewName= new String(userName.getBytes("iso-8859-1"),"utf-8");
        System.out.println(usernewName);
        User user= userService.selectByUserName(usernewName);

               //获取文章列表
        List<Article> articleList=articleService.selectByUserId(user.getUserId());
        HashMap<Integer,Integer>  articleId2ComCntMap =new HashMap<Integer, Integer>();
        for(Article article:articleList){
            articleId2ComCntMap.put(article.getArticleId(),commentService.selectAllByArticleId(article.getArticleId()).size());  //评论数映射
        }

        int tot=0;
          //计算声望值
        for(Article article:articleList){
            tot+=article.getArticleValue();
        }

        user.setUserValue(tot);



        //获取评论列表

        List<Comment> commentList=commentService.selectAllByUserId(user.getUserId());

        model.addAttribute("commentList",commentList);
        model.addAttribute("articleId2ComCntMap",articleId2ComCntMap);
        model.addAttribute("articleList",articleList);
        model.addAttribute("user",user);



        //获取赞踩列表
        List<Article>  ThumbsUpArticleList=new ArrayList<Article>();
        List<Article>  ThumbsDownArticleList=new ArrayList<Article>();
        List<Star> starList=starService.selectByUserId(user.getUserId());

        for(Star star: starList) {
            if (star.getStarValue() == 1) {
                ThumbsUpArticleList.add(articleService.selectByPrimaryKey(star.getArticleId()));
            }
            if (star.getStarValue() == -1) {
                ThumbsDownArticleList.add(articleService.selectByPrimaryKey(star.getArticleId()));
            }
        }

        model.addAttribute("ThumbsUpArticleList",ThumbsUpArticleList);
        model.addAttribute("ThumbsDownArticleList",ThumbsDownArticleList);




        //是否本人登陆

        if(session.getAttribute("username")==null){
            return  "userInfo";
        }
        else if(session.getAttribute("username").equals(usernewName)){
            return  "myInfo";
        }
        else {
            return  "userInfo";
        }

    }
    @RequestMapping(value = "/editInfo" ,method = {RequestMethod.POST})
    public String editInfo(Integer userId, String location , String bio, RedirectAttributes attributes ) throws UnsupportedOperationException, IOException {
        User user=userService.selectByPrimaryKey(userId);




        user.setUserBio(bio);
        user.setUserLocation(location);

        attributes.addAttribute("userName",user.getUserName());

        userService.updateByPrimaryKey(user);

        return  "redirect:/user.action";


    }


    @RequestMapping(value = "/editPassword",method = {RequestMethod.POST})
    public String editPassword(Integer userId,String password, RedirectAttributes attributes){
        User user=userService.selectByPrimaryKey(userId);

        user.setUserPassword(password);
        attributes.addAttribute("userName",user.getUserName());

        userService.updateByPrimaryKey(user);

        return  "redirect:/user.action";

    }

    @RequestMapping(value = "/editAvatar",method = {RequestMethod.POST})
     public  String editAvatar(Integer userId, RedirectAttributes attributes , MultipartFile pictureFile,HttpSession session) throws IOException {

        User user=userService.selectByPrimaryKey(userId);
        System.out.println(userId);
        //  修改头像

        String picName = UUID.randomUUID().toString();
        // 获取文件名
        String oriName = pictureFile.getOriginalFilename();
        // 获取图片后缀
        String extName = oriName.substring(oriName.lastIndexOf("."));


        // 开始上传
        pictureFile.transferTo(new File( "F:/programman/pic/"+ picName + extName));

        user.setUserAvatar(picName + extName);

        attributes.addAttribute("userName",user.getUserName());

        userService.updateByPrimaryKey(user);

        List<Article> articleList=articleService.selectByUserId(user.getUserId());

        for(Article article:articleList){
            article.setArticleAvatar(picName + extName);
            articleService.updateByPrimaryKey(article);
        }

        return  "redirect:/user.action";
    }

}
