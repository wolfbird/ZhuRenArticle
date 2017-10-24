package com.article.service;

import com.article.bean.Comment;

import java.util.List;

public interface CommentService {
    int deleteByPrimaryKey(Integer commentId);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer commentId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);

    List<Comment> selectAllByArticleId(Integer articleId);

    List<Comment> selectAllByUserId(Integer userId);

    List<Comment> selectAll();
}