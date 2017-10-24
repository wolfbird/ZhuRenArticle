package com.article.bean;

import java.util.Date;

public class Garner {
    private Integer garnerId;

    private Integer userId;

    private Integer articleId;

    private Date garnerDate;

    private Integer garnerValue;

    public Garner(Integer garnerId, Integer userId, Integer articleId, Date garnerDate, Integer garnerValue) {
        this.garnerId = garnerId;
        this.userId = userId;
        this.articleId = articleId;
        this.garnerDate = garnerDate;
        this.garnerValue = garnerValue;
    }

    public Garner() {
        super();
    }

    public Integer getGarnerId() {
        return garnerId;
    }

    public void setGarnerId(Integer garnerId) {
        this.garnerId = garnerId;
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

    public Date getGarnerDate() {
        return garnerDate;
    }

    public void setGarnerDate(Date garnerDate) {
        this.garnerDate = garnerDate;
    }

    public Integer getGarnerValue() {
        return garnerValue;
    }

    public void setGarnerValue(Integer garnerValue) {
        this.garnerValue = garnerValue;
    }
}