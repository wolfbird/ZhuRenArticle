package com.article.bean;

import java.util.Date;

public class Comment {
    private Integer commentId;

    private Integer userId;

    private Integer articleId;

    private String commentContent;

    private Date commentDate;

    private Integer commentHidden;

    private Integer commentValue;

    private Integer commentRead;

    public Comment(Integer commentId, Integer userId, Integer articleId, String commentContent, Date commentDate, Integer commentHidden, Integer commentValue, Integer commentRead) {
        this.commentId = commentId;
        this.userId = userId;
        this.articleId = articleId;
        this.commentContent = commentContent;
        this.commentDate = commentDate;
        this.commentHidden = commentHidden;
        this.commentValue = commentValue;
        this.commentRead = commentRead;
    }

    public Comment() {
        super();
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
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

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public Integer getCommentHidden() {
        return commentHidden;
    }

    public void setCommentHidden(Integer commentHidden) {
        this.commentHidden = commentHidden;
    }

    public Integer getCommentValue() {
        return commentValue;
    }

    public void setCommentValue(Integer commentValue) {
        this.commentValue = commentValue;
    }

    public Integer getCommentRead() {
        return commentRead;
    }

    public void setCommentRead(Integer commentRead) {
        this.commentRead = commentRead;
    }
}