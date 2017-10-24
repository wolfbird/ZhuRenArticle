package com.article.service;

import com.article.bean.Article;

import java.util.List;

public interface ArticleService {
    int deleteByPrimaryKey(Integer articleId);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer articleId);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKey(Article record);

    List<Article> selectAll();

    List<Article> selectByUserId(Integer userId);
}