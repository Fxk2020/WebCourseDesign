package com.study.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Course {

    private int course_id;
    private String course_name;
    private double course_credit;
    private String course_goal;
    private String course_testSrc;

    private String course_bookUrl;
    private String course_bookPass;

    private String course_pptUrl;
}
