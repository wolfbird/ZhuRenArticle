package com.article.controller;

import com.article.bean.*;
import com.article.service.*;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2017/8/14.
 */
@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private StarService starService;
    @Autowired
    private GarnerService garnerService;

    @RequestMapping(value = "/article",method = {RequestMethod.GET})
    public  String  rant(Model model ,Integer articleId ,HttpSession session){

        Article article=articleService.selectByPrimaryKey(articleId);
        User user=userService.selectByPrimaryKey(article.getUserId());
        User myuser=userService.selectByUserName((String) session.getAttribute("username"));
        List<Article> articleList=articleService.selectAll();
        List<Comment> commentList=commentService.selectAllByArticleId(articleId);
        HashMap<Integer ,String>  userId2userNameMap=new HashMap<Integer, String>();
        for(Comment c:commentList){
            userId2userNameMap.put(c.getUserId(),userService.selectByPrimaryKey(c.getUserId()).getUserName());
        }
           //是否赞或踩过

        int starValue=0;
        if(myuser!=null) {
            List<Star> starList = starService.selectByArticleId(articleId);
            for (Star star : starList) {
                if (star.getUserId().equals(myuser.getUserId())) {
                    starValue = star.getStarValue();
                }
            }
        }

        int tot=0;
        //计算声望值
        List<Article> articleUserList=articleService.selectByUserId(user.getUserId());
        for(Article articleExa:articleUserList){
            tot+=articleExa.getArticleValue();
        }

        user.setUserValue(tot);
        //获取三天内热门文章 (评论数多)
        Date nowTime=new Date();
        int commentThreshold = 1;//设置评论数阈值
        List<Article> articleHotComList=new ArrayList<Article>();
        for(Article articleone:articleList){
            int CommentCnt=commentService.selectAllByArticleId(articleone.getArticleId()).size();
            if(CommentCnt>=commentThreshold&&Math.abs(nowTime.getTime()-articleone.getArticleDate().getTime())<=3*24*3600*1000){
                articleHotComList.add(articleone);
            }
        }


        //获取精品文章 （点赞值多）
        int starThreshold = 10;//设置声望数阈值
        List<Article> articleStarList=new ArrayList<Article>();
        for(Article articleone:articleList){
            if(articleone.getArticleValue()>=starThreshold){
                articleStarList.add(articleone);
            }
        }

        model.addAttribute("starValue",starValue);

        model.addAttribute("article",article);
        model.addAttribute("user",user);
        model.addAttribute("commentList",commentList);
        model.addAttribute("userId2userNameMap",userId2userNameMap);
        model.addAttribute("articleHotComList",articleHotComList);
        model.addAttribute("articleStarList",articleStarList);

        return  "articleDetail";
    }
    @RequestMapping(value = "/articleClick",method = {RequestMethod.GET})
    public String articleClick(){

        return "sendArticle";
    }

    @RequestMapping(value = "/allArticle",method = {RequestMethod.GET})
    public String allArticle(Model model ){
        List<Article> articleList=articleService.selectAll();
        PageInfo<Article> pageInfo = new PageInfo<Article>(articleList);

        HashMap<Integer ,String>  userId2NameMap=new HashMap<Integer, String>();

        for(Article article:articleList){
            userId2NameMap.put(article.getUserId(),userService.selectByPrimaryKey(article.getUserId()).getUserName());
        }
        //获取三天内热门文章 (评论数多)
        Date nowTime=new Date();
        int commentThreshold = 1;//设置评论数阈值
        List<Article> articleHotComList=new ArrayList<Article>();
        for(Article articleone:articleList){
            int CommentCnt=commentService.selectAllByArticleId(articleone.getArticleId()).size();
            if(CommentCnt>=commentThreshold&&Math.abs(nowTime.getTime()-articleone.getArticleDate().getTime())<=3*24*3600*1000){
                articleHotComList.add(articleone);
            }
        }


        //获取精品文章 （点赞值多）
        int starThreshold = 10;//设置声望数阈值
        List<Article> articleStarList=new ArrayList<Article>();
        for(Article articleone:articleList){
            if(articleone.getArticleValue()>=starThreshold){
                articleStarList.add(articleone);
            }
        }

        model.addAttribute("userId2NameMap",userId2NameMap);
        model.addAttribute("articleList",articleList);
        model.addAttribute("articleHotComList",articleHotComList);
        model.addAttribute("articleStarList",articleStarList);
        model.addAttribute("pageinfo",pageInfo);
        return "articleList";
    }


    @RequestMapping(value = "/deleteArticle",method = {RequestMethod.POST})
    public  String deleteArticle(Integer articleId,String userName,RedirectAttributes attributes){
        List<Comment> commentList=commentService.selectAllByArticleId(articleId);
        articleService.deleteByPrimaryKey(articleId);
        System.out.println("delete-----------"+userName);

        for(Comment c:commentList){
            articleService.deleteByPrimaryKey(c.getCommentId());
        }
        attributes.addAttribute("userName",userName);
        return  "redirect:/user.action";
    }

    @RequestMapping(value = "/deleteComment",method = {RequestMethod.POST})
    public  String deleteComment(Integer commentId,String userName,RedirectAttributes attributes){

        commentService.deleteByPrimaryKey(commentId);
        attributes.addAttribute("userName",userName);
        return  "redirect:/user.action";
    }

    @RequestMapping(value = "/sendComment",method = {RequestMethod.POST})
    public  String sendComment(String newCommentCotent , Integer articleId , HttpSession session){
         User user = userService.selectByUserName((String) session.getAttribute("username"));

        Comment comment=new Comment();
        comment.setArticleId(articleId);
        comment.setCommentContent(newCommentCotent);
        comment.setCommentDate(new Date());
        comment.setCommentHidden(0);
        comment.setCommentRead(0);
        comment.setCommentValue(0);
        comment.setUserId(user.getUserId());
        commentService.insert(comment);

        return  "redirect:/article.action?articleId="+articleId;

    }

    @RequestMapping(value = "/thumbsUp",method = {RequestMethod.POST})
    public String thumbsUp(Integer articleId, HttpSession session){
        //得到用户
        User user=userService.selectByUserName((String) session.getAttribute("username"));

        Article article=articleService.selectByPrimaryKey(articleId);
        //得到该文章所有踩和赞
        List<Star> starList= starService.selectByArticleId(articleId);

        for(Star star:starList) {

            //已经赞过的取消赞
            if (star.getUserId().equals(user.getUserId()) && star.getStarValue() == 1) {
                article.setArticleValue(article.getArticleValue() - 1);
                articleService.updateByPrimaryKey(article);
                starService.deleteByPrimaryKey(star.getStarId());
                return "redirect:/article.action?articleId=" + articleId;
            }

            //已经踩过的取消踩
            else if (star.getUserId().equals(user.getUserId()) && star.getStarValue() == -1) {
                article.setArticleValue(article.getArticleValue() + 1);
                articleService.updateByPrimaryKey(article);
                starService.deleteByPrimaryKey(star.getStarId());
                return "redirect:/article.action?articleId=" + articleId;
            }
        }
        //没有赞或踩过得赞

        Star star1=new Star();
        star1.setArticleId(articleId);
        star1.setStarDate(new Date());
        star1.setStarValue(1);
        star1.setUserId(user.getUserId());
        starService.insert(star1);
        article.setArticleValue(article.getArticleValue()+1);
        articleService.updateByPrimaryKey(article);
        return "redirect:/article.action?articleId="+articleId;

    }

    @RequestMapping(value = "/thumbsDown",method = {RequestMethod.POST})
    public String thumbsDown(Integer articleId, HttpSession session){
        //得到用户
        User user=userService.selectByUserName((String) session.getAttribute("username"));

        Article article=articleService.selectByPrimaryKey(articleId);
        //得到该文章所有踩和赞
        List<Star> starList= starService.selectByArticleId(articleId);

        for(Star star:starList) {

            //已经赞过的取消赞
            if (star.getUserId().equals(user.getUserId()) && star.getStarValue() == 1) {
                article.setArticleValue(article.getArticleValue() - 1);
                articleService.updateByPrimaryKey(article);
                starService.deleteByPrimaryKey(star.getStarId());
                return "redirect:/article.action?articleId=" + articleId;
            }

            //已经踩过的取消踩
            else if (star.getUserId().equals(user.getUserId()) && star.getStarValue() == -1) {
                article.setArticleValue(article.getArticleValue() + 1);
                articleService.updateByPrimaryKey(article);
                starService.deleteByPrimaryKey(star.getStarId());
                return "redirect:/article.action?articleId=" + articleId;
            }
        }
        //没有赞或踩过得踩

        Star star1=new Star();
        star1.setArticleId(articleId);
        star1.setStarDate(new Date());
        star1.setStarValue(-1);
        star1.setUserId(user.getUserId());
        starService.insert(star1);
        article.setArticleValue(article.getArticleValue()-1);
        articleService.updateByPrimaryKey(article);
        return "redirect:/article.action?articleId="+articleId;

    }


}
