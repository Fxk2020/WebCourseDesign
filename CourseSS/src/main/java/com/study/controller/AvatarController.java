package com.study.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.study.dao.UserMapper;
import com.study.pojo.User;
import com.study.util.GetSuffix;
import com.study.util.OssPutObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileNotFoundException;

@Controller
public class AvatarController {

    @Autowired
    UserMapper userMapper;

    @ResponseBody
    @PostMapping("/service/update")
    public JSON updateAvatar(HttpServletRequest request,
                             HttpSession session,
                             @RequestParam("file") MultipartFile file){
        JSONObject json = new JSONObject();

        //获得现在登录的用户
        User user = (User) session.getAttribute("userLogin");

        //路径
        String filePath = "/Users/yuanbao/Desktop/img/avatar/";//上传到这个文件夹
        File file1 = new File(filePath);
        //如果没有的话创建一个
        if (!file1.exists()) {
            file1.mkdirs();
        }

        //路径+文件名
        //文件名：file.getOriginalFilename()
        String finalFilePath = filePath + file.getOriginalFilename().trim();
        File desFile = new File(finalFilePath);
        if (desFile.exists()) {
            desFile.delete();
        }

        try {
            file.transferTo(desFile);
            json.put("code", 0);
            //将文件名放在msg中，前台提交表单时需要用到
            json.put("msg", file.getOriginalFilename().trim());

            JSONObject json2 = new JSONObject();
            json2.put("src", finalFilePath);
            json2.put("title", "");
            json.put("Data", json2);

        } catch (Exception e) {
            System.out.println(e.getMessage());
            json.put("code", 1);
        }

        String suffix = GetSuffix.getPng(file.getOriginalFilename());
        String userName = user.getUser_name();

        try {
            String url = OssPutObject.
                    putObject(finalFilePath,userName+"."+suffix);
            user.setUser_avatar(url);
            userMapper.updateAvatar(user);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        System.out.println(json);
        return json;
    }

}
