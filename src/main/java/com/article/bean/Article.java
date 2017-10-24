package com.article.bean;



import jdk.nashorn.internal.runtime.regexp.joni.Regex;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Article {
    private Integer articleId;

    private Integer userId;

    private String articleAvatar;

    private Date articleDate;

    private Integer articleValue;

    private String articleContent;

    private Integer articleHidden;

    private String articleTitle;

    public Article(Integer articleId, Integer userId, String articleAvatar, Date articleDate, Integer articleValue, String articleContent, Integer articleHidden, String articleTitle) {
        this.articleId = articleId;
        this.userId = userId;
        this.articleAvatar = articleAvatar;
        this.articleDate = articleDate;
        this.articleValue = articleValue;
        this.articleContent = articleContent;
        this.articleHidden = articleHidden;
        this.articleTitle = articleTitle;
    }

    public Article() {
        super();
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getArticleAvatar() {
        return articleAvatar;
    }

    public void setArticleAvatar(String articleAvatar) {
        this.articleAvatar = articleAvatar == null ? null : articleAvatar.trim();
    }

    public Date getArticleDate() {
        return articleDate;
    }


    public String getArticleChangeDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(articleDate);
        return dateString;
    }

    public String getArticleChangeShortDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(articleDate);
        return dateString;
    }


    public void setArticleDate(Date articleDate) {
        this.articleDate = articleDate;
    }

    public Integer getArticleValue() {
        return articleValue;
    }

    public void setArticleValue(Integer articleValue) {
        this.articleValue = articleValue;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public String getChangeArticleContent() {
        String temp = articleContent.replaceAll("<[^>]*>", "");

        return temp ;
    }



    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent == null ? null : articleContent.trim();
    }

    public Integer getArticleHidden() {
        return articleHidden;
    }

    public void setArticleHidden(Integer articleHidden) {
        this.articleHidden = articleHidden;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle == null ? null : articleTitle.trim();
    }
}