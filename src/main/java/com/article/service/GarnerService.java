package com.article.service;

import com.article.bean.Garner;

import java.util.List;

public interface GarnerService {
    int deleteByPrimaryKey(Integer garnerId);

    int insert(Garner record);

    int insertSelective(Garner record);

    Garner selectByPrimaryKey(Integer garnerId);

    int updateByPrimaryKeySelective(Garner record);

    int updateByPrimaryKey(Garner record);

    List<Garner> selectByArticleId(Integer articleId);

    List<Garner> selectByUserId(Integer userId);

    List<Garner> selectAll();
}