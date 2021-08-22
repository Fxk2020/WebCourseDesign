package com.study.dao;

import com.study.pojo.Message;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class MessageDao implements MessageMapper{

    @Autowired
    SqlSession sqlSession;

    @Override
    public List<Message> selectAllMessage() {
        return sqlSession.selectList("com.study.dao.MessageMapper.selectAllMessage");
    }

    @Override
    public List<Message> selectMessageByUserId(int user_id) {
        return sqlSession.selectList("com.study.dao.MessageMapper.selectMessageByUserId",user_id);
    }

    @Override
    public void addMessage(Message message) {
        sqlSession.insert("com.study.dao.MessageMapper.addMessage",message);
    }
}
