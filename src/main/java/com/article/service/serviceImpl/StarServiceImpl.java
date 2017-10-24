package com.article.service.serviceImpl;

import com.article.bean.Star;
import com.article.dao.StarMapper;
import com.article.service.StarService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public class StarServiceImpl implements StarService {

    @Autowired
    private StarMapper starMapper;
    public int deleteByPrimaryKey(Integer starId) {
        starMapper.deleteByPrimaryKey(starId);
        return 0;
    }

    public int insert(Star record) {
        starMapper.insert(record);
        return 0;
    }

    public int insertSelective(Star record) {
        starMapper.insertSelective(record);
        return 0;
    }

    public Star selectByPrimaryKey(Integer starId) {
        return starMapper.selectByPrimaryKey(starId);
    }

    public int updateByPrimaryKeySelective(Star record) {
        starMapper.updateByPrimaryKeySelective(record);
        return 0;
    }

    public int updateByPrimaryKey(Star record) {
        starMapper.updateByPrimaryKey(record);
        return 0;
    }

    public List<Star> selectByArticleId(Integer articleId) {
        return starMapper.selectByArticleId(articleId);
    }

    public List<Star> selectByUserId(Integer userId) {
        return starMapper.selectByUserId(userId);
    }

    public List<Star> selectAll() {
        return starMapper.selectAll();
    }
}
