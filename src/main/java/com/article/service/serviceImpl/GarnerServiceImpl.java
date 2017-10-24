package com.article.service.serviceImpl;

import com.article.bean.Garner;
import com.article.dao.GarnerMapper;
import com.article.service.GarnerService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public class GarnerServiceImpl implements GarnerService {
    @Autowired
    private GarnerMapper garnerMapper;
    public int deleteByPrimaryKey(Integer garnerId) {
        garnerMapper.deleteByPrimaryKey(garnerId);
        return 0;
    }

    public int insert(Garner record) {
        garnerMapper.insert(record);
        return 0;
    }

    public int insertSelective(Garner record) {
        garnerMapper.insertSelective(record);
        return 0;
    }

    public Garner selectByPrimaryKey(Integer garnerId) {
        return garnerMapper.selectByPrimaryKey(garnerId);
    }

    public int updateByPrimaryKeySelective(Garner record) {
        garnerMapper.updateByPrimaryKeySelective(record);
        return 0;
    }

    public int updateByPrimaryKey(Garner record) {
        garnerMapper.updateByPrimaryKey(record);
        return 0;
    }

    public List<Garner> selectByArticleId(Integer articleId) {
        return garnerMapper.selectByArticleId(articleId);
    }

    public List<Garner> selectByUserId(Integer userId) {
        return garnerMapper.selectByUserId(userId);
    }

    public List<Garner> selectAll() {
        return garnerMapper.selectAll();
    }
}
