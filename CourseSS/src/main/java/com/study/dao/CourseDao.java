package com.study.dao;

import com.study.pojo.Course;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class CourseDao implements CourseMapper{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<Course> selectAllCourse() {
        return sqlSessionTemplate.selectList("com.study.dao.CourseMapper.selectAllCourse");
    }

    @Override
    public List<Course> selectCourseById(int course_id) {
        return sqlSessionTemplate.selectList("com.study.dao.CourseMapper.selectCourseById",course_id);
    }
}
