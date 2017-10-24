package com.article.controller;

import com.article.bean.Article;
import com.article.bean.User;
import com.article.service.*;
import javafx.print.Collation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by Administrator on 2017/8/15.
 */
@Controller
public class HomeController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;
    @Autowired
    private StarService starService;
    @Autowired
    private GarnerService garnerService;
    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/home",method = {RequestMethod.GET})
    public String home(Model model){

        List<Article> articleList=articleService.selectAll();
        Collections.reverse(articleList);
        HashMap<Integer ,String>  userId2NameMap=new HashMap<Integer, String>();
        HashMap<Integer ,Integer> articleId2ComCntMap=new HashMap<Integer, Integer>();

        for(Article article:articleList){
            userId2NameMap.put(article.getUserId(),userService.selectByPrimaryKey(article.getUserId()).getUserName());
            articleId2ComCntMap.put(article.getArticleId(),commentService.selectAllByArticleId(article.getArticleId()).size());
        }

        //获取三天内热门文章 (评论数多)
        Date nowTime=new Date();
        int commentThreshold = 1;//设置评论数阈值
         List<Article> articleHotComList=new ArrayList<Article>();
         for(Article article:articleList){
             int CommentCnt=commentService.selectAllByArticleId(article.getArticleId()).size();
             if(CommentCnt>=commentThreshold&&Math.abs(nowTime.getTime()-article.getArticleDate().getTime())<=3*24*3600*1000){
                 articleHotComList.add(article);
             }
         }


         //获取精品文章 （点赞值多）
        int starThreshold = 5;//设置声望数阈值
        List<Article> articleStarList=new ArrayList<Article>();
        for(Article article:articleList){
            if(article.getArticleValue()>=starThreshold){
                articleStarList.add(article);
            }
        }

        model.addAttribute("articleList",articleList);
        model.addAttribute("userId2NameMap",userId2NameMap);
        model.addAttribute("articleId2ComCntMap",articleId2ComCntMap);
        model.addAttribute("articleHotComList",articleHotComList);
        model.addAttribute("articleStarList",articleStarList);
        return  "home";
    }


    @RequestMapping(value = "/sendArticle",method = {RequestMethod.POST})
    public  String sendArticle(HttpSession session,String newArticleTitle,String newArticleContent,String newHiddenCheckBox){

           User user=userService.selectByUserName((String) session.getAttribute("username"));
        System.out.println(newArticleContent);
           Article article=new Article();

           if(newHiddenCheckBox!=null) { //匿名
                article.setArticleHidden(1);
               article.setArticleAvatar("hidden-avatar.png");
           }

           else{
               article.setArticleHidden(0);
               article.setArticleAvatar(user.getUserAvatar());
           }

           article.setArticleValue(0);
           article.setArticleTitle(newArticleTitle);
           article.setArticleContent(newArticleContent);
           article.setArticleDate(new Date());
           article.setUserId(user.getUserId());

           articleService.insert(article);
        System.out.println("5555");
           return  "redirect:/home.action";



    }

}
