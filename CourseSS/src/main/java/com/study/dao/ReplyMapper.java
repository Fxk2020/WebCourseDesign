package com.study.dao;

import com.study.pojo.Reply;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ReplyMapper {

    @Select("select * from reply where message_id=#{message_id}")
    List<Reply> selectReplyById(@Param("message_id") int message_id);

    @Insert("insert into reply (user_id,message_id,reply,user_name,user_avatar) " +
            "values (#{Rep.user_id},#{Rep.message_id},#{Rep.reply},#{Rep.user_name},#{Rep.user_avatar})")
    void addReply(@Param("Rep") Reply reply);

    @Select("select * from reply where message_id=#{message_id} and reply_read=0")
    List<Reply> selectUnreadReplyById(@Param("message_id") int message_id);

    @Update("update reply set reply_read=1 where message_id=#{message_id}")
    void removeUnreadReply(@Param("message_id") int message_id);
}
