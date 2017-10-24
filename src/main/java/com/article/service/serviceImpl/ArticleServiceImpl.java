package com.article.service.serviceImpl;

import com.article.bean.Article;
import com.article.dao.ArticleMapper;
import com.article.dao.CommentMapper;
import com.article.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public class ArticleServiceImpl implements ArticleService {


    @Autowired
    private ArticleMapper articleMapper;

    public int deleteByPrimaryKey(Integer articleId) {
        articleMapper.deleteByPrimaryKey(articleId);
        return 0;
    }

    public int insert(Article record) {
        articleMapper.insert(record);
        return 0;
    }

    public int insertSelective(Article record) {
        articleMapper.insertSelective(record);
        return 0;
    }

    public Article selectByPrimaryKey(Integer articleId) {
        return articleMapper.selectByPrimaryKey(articleId);
    }

    public int updateByPrimaryKeySelective(Article record) {
        articleMapper.updateByPrimaryKeySelective(record);
        return 0;
    }

    public int updateByPrimaryKey(Article record) {
        articleMapper.updateByPrimaryKey(record);
        return 0;
    }

    public List<Article> selectAll() {
        return articleMapper.selectAll();
    }

    public List<Article> selectByUserId(Integer userId) {
        return articleMapper.selectByUserId(userId);
    }
}
