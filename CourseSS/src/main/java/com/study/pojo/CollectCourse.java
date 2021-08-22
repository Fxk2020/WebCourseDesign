package com.study.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CollectCourse {

    private int user_id;
    private int course_id;
    private Timestamp collect_time;

    private String course_name;
    private double course_credit;
    private String course_goal;

    public CollectCourse(int user_id, int course_id) {
        this.user_id = user_id;
        this.course_id = course_id;
    }

    public CollectCourse(int user_id, int course_id, String course_name, double course_credit, String course_goal) {
        this.user_id = user_id;
        this.course_id = course_id;
        this.course_name = course_name;
        this.course_credit = course_credit;
        this.course_goal = course_goal;
    }
}
