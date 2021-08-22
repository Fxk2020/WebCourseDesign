package com.study.dao;

import com.study.pojo.CollectCourse;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class CollectCourseDao implements CollectCourseMapper{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<CollectCourse> selectCollectCourseById(int user_id) {
        return sqlSessionTemplate.selectList("com.study.dao.CollectCourseMapper.selectCollectCourseById",user_id);
    }

    @Override
    public void cancelCollect(CollectCourse collectCourse) {
        sqlSessionTemplate.delete("com.study.dao.CollectCourseMapper.cancelCollect",collectCourse);
    }

    @Override
    public void addCollect(CollectCourse collectCourse) {
        sqlSessionTemplate.insert("com.study.dao.CollectCourseMapper.addCollect",collectCourse);
    }

    @Override
    public CollectCourse selectKeyCollect(CollectCourse collectCourse) {
        return sqlSessionTemplate.selectOne("com.study.dao.CollectCourseMapper.selectKeyCollect",collectCourse);
    }
}
