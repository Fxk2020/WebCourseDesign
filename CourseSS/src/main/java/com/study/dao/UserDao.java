package com.study.dao;

import com.study.pojo.User;
import com.study.pojo.UserMoreMessage;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UserDao implements UserMapper{

    @Autowired
    SqlSession sqlSession;

    @Override
    public List<User> getAllUser() {
        return sqlSession.selectList("com.dao.UserMapper.getAllUser");
    }

    @Override
    public void addUser(User user) {
        sqlSession.insert("com.dao.UserMapper.addUser",user);
    }

    @Override
    public List<User> selectUserByName(String userName) {
        return sqlSession.selectList("com.dao.UserMapper.selectUserByName",userName);
    }

    @Override
    public void addPersonMessage(int user_id) {
        sqlSession.insert("com.dao.UserMapper.addPersonMessage",user_id);
    }

    @Override
    public List<UserMoreMessage> selectMessage(int user_id) {
        return sqlSession.selectList("com.dao.UserMapper.selectMessage",user_id);
    }

    @Override
    public void updateAvatar(User user) {
        sqlSession.update("com.dao.UserMapper.updateAvatar",user);
    }

    @Override
    public void updateUserName(User user) {
        sqlSession.update("com.dao.UserMapper.updateUserName",user);
    }

    @Override
    public void updateUserSignature(User user) {
        sqlSession.update("com.dao.UserMapper.updateUserSignature",user);
    }

    @Override
    public void updateUserMessage(UserMoreMessage userMoreMessage) {
        sqlSession.update("com.dao.UserMapper.updateUserMessage",userMoreMessage);
    }

    @Override
    public User selectUserById(int user_id) {
        return sqlSession.selectOne("com.dao.UserMapper.selectUserById",user_id);
    }


}
