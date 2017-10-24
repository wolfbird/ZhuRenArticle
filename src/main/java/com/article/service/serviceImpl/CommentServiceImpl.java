package com.article.service.serviceImpl;

import com.article.bean.Comment;
import com.article.dao.CommentMapper;
import com.article.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;
    public int deleteByPrimaryKey(Integer commentId) {
        commentMapper.deleteByPrimaryKey(commentId);
        return 0;
    }

    public int insert(Comment record) {
        commentMapper.insert(record);
        return 0;
    }

    public int insertSelective(Comment record) {
        commentMapper.insertSelective(record);
        return 0;
    }

    public Comment selectByPrimaryKey(Integer commentId) {
        return commentMapper.selectByPrimaryKey(commentId);
    }

    public int updateByPrimaryKeySelective(Comment record) {
        commentMapper.updateByPrimaryKeySelective(record);
        return 0;
    }

    public int updateByPrimaryKey(Comment record) {
        commentMapper.updateByPrimaryKey(record);
        return 0;
    }

    public List<Comment> selectAllByArticleId(Integer articleId) {
        return  commentMapper.selectAllByArticleId(articleId);
    }

    public List<Comment> selectAllByUserId(Integer userId) {
        return commentMapper.selectAllByUserId(userId);
    }

    public List<Comment> selectAll() {
        return commentMapper.selectAll();
    }
}
