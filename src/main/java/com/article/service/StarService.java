package com.article.service;

import com.article.bean.Star;

import java.util.List;

public interface StarService {
    int deleteByPrimaryKey(Integer starId);

    int insert(Star record);

    int insertSelective(Star record);

    Star selectByPrimaryKey(Integer starId);

    int updateByPrimaryKeySelective(Star record);

    int updateByPrimaryKey(Star record);


    List<Star> selectByArticleId(Integer articleId);

    List<Star> selectByUserId(Integer userId);

    List<Star> selectAll();

}