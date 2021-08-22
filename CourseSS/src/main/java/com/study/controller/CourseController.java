package com.study.controller;

import com.study.dao.CollectCourseMapper;
import com.study.dao.CourseMapper;
import com.study.pojo.CollectCourse;
import com.study.pojo.Course;
import com.study.pojo.User;
import com.study.util.ZipUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@Controller
public class CourseController {

    @Autowired
    CourseMapper courseMapper;
    @Autowired
    CollectCourseMapper collectCourseMapper;

    /**
     * 获取服务端有的课程
     * @param session
     * @return
     */
    @GetMapping("/service/getCourse")
    public String getCourses(HttpSession session){

        List<Course> courses = courseMapper.selectAllCourse();

        session.setAttribute("allCourse",courses);

        return "redirect:/course.html";
    }

    /**
     * 下载PPT
     * @param dirUrl
     * @param session
     * @param response
     * @throws FileNotFoundException
     */
    @ResponseBody
    @GetMapping("/service/downloadPPT")
    public void downloadPPT(@RequestParam("fileUrl") String dirUrl,
                            Model model,
                            HttpSession session,
                            HttpServletResponse response) throws FileNotFoundException {
        User user = (User) session.getAttribute("userLogin");

        //outputUrl 压缩文件的输出目录--输出路径每个用户应该唯一
        String outputUrl = "/Users/yuanbao/Desktop/"+user.getUser_name();

        File folder = new File(outputUrl);
        if (!folder.exists() && !folder.isDirectory()) {
            folder.mkdirs();
        }

        String fileName = "result.zip";
        String fileUrl = outputUrl+"/"+fileName;
        //服务器必须存在output路径
        FileOutputStream fos1 = new FileOutputStream(new File(fileUrl));
        ZipUtil.toZip(dirUrl, fos1, true);

//        //创造文件流，进行文件传输
        responseFile(fileUrl,model,response,fileName);
    }

    //将文件传给前端
    private boolean responseFile(String fileUrl,Model model,HttpServletResponse response,String fileName){
        File file = new File(fileUrl);
        if(!file.exists()){
            model.addAttribute("downloadMsg","下载文件不存在"); ;
            return false;
        }
        response.reset();
        response.setContentType("application/octet-stream");
        response.setCharacterEncoding("utf-8");
        response.setContentLength((int) file.length());
        response.setHeader("Content-Disposition", "attachment;filename="+fileName);

        try(BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));) {
            byte[] buff = new byte[1024];
            OutputStream os  = response.getOutputStream();
            int i = 0;
            while ((i = bis.read(buff)) != -1) {
                os.write(buff, 0, i);
                os.flush();
            }
            os.close();
        } catch (IOException e) {
            model.addAttribute("downloadMsg","下载失败");
            return false;
        }
        model.addAttribute("downloadMsg","下载成功");
        return true;
    }


    /**
     * 获得所有的收藏课程
     * @param session
     * @return
     */
    @GetMapping("/service/getCollect")
    public String getCollect(HttpSession session){

        User user = (User) session.getAttribute("userLogin");

        List<CollectCourse> collectCourses = collectCourseMapper.selectCollectCourseById(user.getUser_id());

        session.setAttribute("collectCourse",collectCourses);

        return "redirect:/personal.html";
    }


    /**
     * 取消收藏课程
     * @param course_id 课程id
     * @param session
     * @return
     */
    @GetMapping("/service/cancelCollect")
    public String cancelCollect(@RequestParam("course_id") int course_id,
                                HttpSession session,
                                Model model){
        User user = (User) session.getAttribute("userLogin");

        CollectCourse collectCourse = new CollectCourse(user.getUser_id(),course_id);

        collectCourseMapper.cancelCollect(collectCourse);

        //更新我的收藏
        List<CollectCourse> collectCourses = collectCourseMapper.selectCollectCourseById(user.getUser_id());

        session.setAttribute("collectCourse",collectCourses);

        model.addAttribute("msgPersonal","恭喜你学习完成，休息一下吧");

        return "personal";

    }

    /**
     * 收藏课程
     * @param course_id 课程id
     * @param course_name 课程名字
     * @param course_credit 课程学分
     * @param course_goal 课程目标
     * @param session
     * @return
     */
    @GetMapping("/service/addCollect")
    public String addCollect(@RequestParam("course_id") int course_id,
                             @RequestParam("course_name") String course_name,
                             @RequestParam("course_credit") double course_credit,
                             @RequestParam("course_goal") String course_goal,
                             HttpSession session,
                             Model model){
        User user = (User) session.getAttribute("userLogin");

        CollectCourse collectCourse = new CollectCourse(user.getUser_id(),course_id,course_name,course_credit,course_goal);

        CollectCourse haveYes = collectCourseMapper.selectKeyCollect(new CollectCourse(user.getUser_id(), course_id));

        if (haveYes!=null){
            model.addAttribute("msgAdd","你已经加入该课程的学习了");
            return "course";
        }
        collectCourseMapper.addCollect(collectCourse);


        model.addAttribute("msgAdd","添加成功，可以再个人中心中查看！");

        return "course";
    }

}
