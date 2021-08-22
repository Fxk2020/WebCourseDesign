package com.study;

import com.study.controller.CourseController;
import com.study.controller.MessageReplyController;
import com.study.dao.*;
import com.study.pojo.*;
import com.study.util.GetSuffix;
import com.study.util.OssPutObject;
import com.study.util.ZipUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringBootVersion;
import org.springframework.boot.test.context.SpringBootTest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class CourseSharingSiteApplicationTests {
    @Test
    void contextLoads() {

        System.out.println(SpringBootVersion.getVersion());

    }


    @Autowired
    CourseController courseController;
    @Autowired
    CollectCourseMapper collectCourseMapper;


    @Test
    void testCollect(){

//        CollectCourse collectCourse = new CollectCourse(4,1,"操作系统",4.5,
//                "操作系统是软件工程专业的一门核心专业基础课程，具有较强的理论性和实践性。该课程的考试内容包括引论、进程管理、内存管理、存储管理（包括文件系统与输入/输出系统）、保护与安全五部分的相关概念、设计原理和实现方法。考试的具体要求包括：\n" +
//                        "1. 了解操作系统在计算机系统中的作用、地位、发展和特点。\n" +
//                        "2. 理解操作系统的基本概念、主要功能、主要组成部分，掌握操作系统各个组成部分的设计方法和实现技术。\n" +
//                        "3. 能够运用所学的操作系统原理、方法和技术对相关问题进行分析和解决。\n");
//
//       collectCourseMapper.addCollect(collectCourse);

        CollectCourse collectCourse = new CollectCourse(4,1);
        CollectCourse collectCourse1 = collectCourseMapper.selectKeyCollect(collectCourse);
        if (collectCourse1==null){
            System.out.println("可以插入");
        }else {
            System.out.println("不可以插入");
        }

    }

    @Test
    void testDownload() throws FileNotFoundException {

//        User user = new User("傅显坤","d");
//
//        session.setAttribute("userLogin",user);
//
//        courseController.downloadPPT("/Users/yuanbao/Desktop/ppt/ds",
//                session);
        new Course().getCourse_id();
    }


    @Autowired
    MessageReplyController messageReplyController;
    @Autowired
    HttpSession session;

    @Test
    void testAllMessage(){
        messageReplyController.getAllMessageAndReply(session);

        List<AllMessageAndReply> allMessageAndReplies =
                (List<AllMessageAndReply>) session.getAttribute("allMessageAndReply");

        for (int i = 0; i < allMessageAndReplies.size(); i++) {
            AllMessageAndReply temp = allMessageAndReplies.get(i);
            System.out.println(temp.getUser_avatar());
            System.out.println("================================");
            for (int j = 0; j < temp.getMessageAndReplies().size(); j++) {
                MessageAndReply temp2 = temp.getMessageAndReplies().get(j);
                System.out.println(temp2.getMessage_id());
                System.out.println(temp2.getMessage());
                System.out.println(temp2.getTimestamp());
                for (int k = 0; k < temp2.getReplies().size(); k++) {
                    Reply temp3 = temp2.getReplies().get(k);
                    System.out.print(temp3.getUser_avatar());
                    System.out.println(temp3.getReply());
                }
                System.out.println();
            }
        }
    }


    @Autowired
    UserMapper userMapper;
    @Autowired
    MessageMapper messageMapper;
    @Autowired
    ReplyMapper replyMapper;
    @Autowired
    CourseMapper courseMapper;

    @Test
    void testCourse(){
        List<Course> courses = courseMapper.selectAllCourse();
        for (int i = 0; i < courses.size(); i++) {
            System.out.println(courses.get(i).getCourse_goal());
        }

        Course course = new Course();
        course.getCourse_pptUrl();

    }

    @Test
    void testTimeStamp(){
        List<Message> messages = messageMapper.selectAllMessage();
        for (int i = 0; i < messages.size(); i++) {
            System.out.println(messages.get(i).getMessage_time());
        }
    }

    @Test
    void testReply(){
        replyMapper.removeUnreadReply(4);
    }


    @Test
    void testMessage(){

        Message message = new Message(4,"到底几号返校啊？学校也没有具体通知嘛");

        messageMapper.addMessage(message);

    }


    @Test
    void testMybatis(){

        User user = new User();
        UserMoreMessage userMoreMessage = new UserMoreMessage();

        System.out.println(userMapper.selectUserById(10));

    }

    @Test
    void testOss(){
        try {
            String s = OssPutObject.putObject("/Users/yuanbao/Desktop/img/download.png"
                    , "校长.jpg");

            User user = userMapper.selectUserByName("校长").get(0);
            System.out.println(user);
            user.setUser_avatar(s);

            userMapper.updateAvatar(user);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Test
    void testUtil() throws FileNotFoundException {
        String outputUrl = "/Users/yuanbao/Desktop/temp";
        String fileName = "result.zip";
        String fileUrl = outputUrl+"/"+fileName;
        //服务器必须存在output路径
        FileOutputStream fos1 = new FileOutputStream(new File(fileUrl));
        ZipUtil.toZip("/Users/yuanbao/Desktop/ppt/ds",fos1,true);
    }

}
