package com.article.dao;

import com.article.bean.Star;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;
@Component
public interface StarMapper {
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