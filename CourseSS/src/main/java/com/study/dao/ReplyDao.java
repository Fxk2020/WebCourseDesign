package com.study.dao;

import com.study.pojo.Reply;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ReplyDao implements ReplyMapper {

    @Autowired
    SqlSession sqlSession;
    SqlSessionTemplate sqlSessionTemplate;//

    @Override
    public List<Reply> selectReplyById(int message_id) {
        return sqlSessionTemplate.selectList("com.study.dao.ReplyMapper.selectReplyById",message_id);
    }

    @Override
    public void addReply(Reply reply) {
        System.out.println(reply.getUser_id());
        sqlSessionTemplate.insert("com.study.dao.ReplyMapper.addReply",reply);
    }

    @Override
    public List<Reply> selectUnreadReplyById(int message_id) {
        return sqlSessionTemplate.selectList("com.study.dao.ReplyMapper.selectUnreadReplyById",message_id);
    }

    @Override
    public void removeUnreadReply(int message_id) {
        sqlSessionTemplate.update("com.study.dao.ReplyMapper.removeUnreadReply",message_id);
    }
}
