package com.article.bean;

import java.util.Date;

public class Star {
    private Integer starId;

    private Integer userId;

    private Integer articleId;

    private Date starDate;

    private Integer starValue;

    public Star(Integer starId, Integer userId, Integer articleId, Date starDate, Integer starValue) {
        this.starId = starId;
        this.userId = userId;
        this.articleId = articleId;
        this.starDate = starDate;
        this.starValue = starValue;
    }

    public Star() {
        super();
    }

    public Integer getStarId() {
        return starId;
    }

    public void setStarId(Integer starId) {
        this.starId = starId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Date getStarDate() {
        return starDate;
    }

    public void setStarDate(Date starDate) {
        this.starDate = starDate;
    }

    public Integer getStarValue() {
        return starValue;
    }

    public void setStarValue(Integer starValue) {
        this.starValue = starValue;
    }
}