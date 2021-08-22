package com.study.dao;

import com.study.pojo.Course;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CourseMapper {

    @Select("select * from course")
    List<Course> selectAllCourse();

    @Select("select * from course where course_id=#{course_id}")
    List<Course> selectCourseById(@Param("course_id") int course_id);

}
