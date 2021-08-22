package com.study.dao;

import com.study.pojo.CollectCourse;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CollectCourseMapper {

    @Select("select * from collectCourse where user_id=#{user_id}")
    List<CollectCourse> selectCollectCourseById(@Param("user_id") int user_id);

    @Delete("delete from collectCourse where user_id=#{collectCourse.user_id} and course_id=#{collectCourse.course_id}")
    void cancelCollect(@Param("collectCourse") CollectCourse collectCourse);

    @Insert("insert into collectCourse (user_id,course_id,course_name,course_credit,course_goal)" +
            " values (#{collectCourse.user_id},#{collectCourse.course_id},#{collectCourse.course_name}," +
            "#{collectCourse.course_credit},#{collectCourse.course_goal})")
    void addCollect(@Param("collectCourse") CollectCourse collectCourse);

    @Select("select * from collectCourse where user_id=#{collectCourse.user_id} and course_id=#{collectCourse.course_id}")
    CollectCourse selectKeyCollect(@Param("collectCourse") CollectCourse collectCourse);
}
