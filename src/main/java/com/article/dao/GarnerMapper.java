package com.article.dao;

import com.article.bean.Garner;
import com.article.bean.Star;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;
@Component
public interface GarnerMapper {
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