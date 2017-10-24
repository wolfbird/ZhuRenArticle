package com.article.service.serviceImpl;

import com.article.bean.User;
import com.article.dao.UserMapper;
import com.article.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    public int deleteByPrimaryKey(Integer userId) {
        userMapper.deleteByPrimaryKey(userId);
        return 0;
    }

    public int insert(User record) {
        userMapper.insert(record);
        return 0;
    }

    public int insertSelective(User record) {
        userMapper.insertSelective(record);
        return 0;
    }

    public User selectByPrimaryKey(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    public int updateByPrimaryKeySelective(User record) {
        userMapper.updateByPrimaryKeySelective(record);
        return 0;
    }

    public int updateByPrimaryKey(User record) {
        userMapper.updateByPrimaryKey(record);
        return 0;
    }

    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    public  User selectByUserName(String userName){
         return  userMapper.selectByUserName(userName);
    }
}
