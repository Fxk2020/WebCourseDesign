package com.study.dao;


import com.study.pojo.User;
import com.study.pojo.UserMoreMessage;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {


    @Select("select * from user")
    List<User> getAllUser();

    @Insert("insert into user (user_name,user_password,user_signature) values" +
            " (#{user.user_name},#{user.user_password},#{user.user_signature})")
    void addUser(@Param("user") User user);

    @Select("select * from user where user_name=#{name}")
    List<User> selectUserByName(@Param("name") String userName);

    @Insert("insert into userMoreMessage (user_id) values (#{user_id})")
    void addPersonMessage(@Param("user_id") int user_id);

    @Select("select * from userMoreMessage where user_id=#{user_id}")
    List<UserMoreMessage> selectMessage(@Param("user_id") int user_id);

    @Update("update user set user_avatar=#{user.user_avatar} where user_name=#{user.user_name}")
    void updateAvatar(@Param("user") User user);

    @Update("update user set user_name=#{user.user_name} where user_id=#{user.user_id}")
    void updateUserName(@Param("user") User user);

    @Update("update user set user_signature=#{user.user_signature} where user_id=#{user.user_id}")
    void updateUserSignature(@Param("user") User user);

    @Update("update userMoreMessage set user_address=#{userMoreMessage.user_address}," +
            "user_website=#{userMoreMessage.user_website},user_introduction=#{userMoreMessage.user_introduction} where user_id=#{userMoreMessage.user_id}")
    void updateUserMessage(@Param("userMoreMessage") UserMoreMessage userMoreMessage);

    @Select("select * from user where user_id=#{user_id}")
    User selectUserById(@Param("user_id") int user_id);

}
