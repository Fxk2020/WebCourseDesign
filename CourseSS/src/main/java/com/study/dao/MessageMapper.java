package com.study.dao;

import com.study.pojo.Message;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MessageMapper {

    @Select("select * from message")
    List<Message> selectAllMessage();

    @Select("select * from message where user_id=#{user_id}")
    List<Message> selectMessageByUserId(@Param("user_id") int user_id);

    @Insert("insert into message (user_id,message) values (#{message.user_id},#{message.message})")
    void addMessage(@Param("message") Message message);

}
