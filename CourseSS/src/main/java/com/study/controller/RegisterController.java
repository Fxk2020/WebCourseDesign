package com.study.controller;

import com.study.dao.UserMapper;
import com.study.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class RegisterController {

    @Autowired
    UserMapper userMapper;

    @PostMapping("/service/register")
    public String register(@RequestParam("userName") String userName,
                           @RequestParam("password") String password,
                           Model model){

        List<User> allUser = userMapper.getAllUser();

        for (int i = 0; i < allUser.size(); i++) {
            if (allUser.get(i).getUser_name().equals(userName)){
                model.addAttribute("msg","用户名已经存在！！！");
                return "register";
            }
        }

        //没有用户名冲突
        User user = new User(userName,password);
        userMapper.addUser(user);
        Integer user_id = userMapper.selectUserByName(userName).get(0).getUser_id();
        userMapper.addPersonMessage(user_id);

        model.addAttribute("msg","注册成功请登录！");

        return "index";
    }

}
