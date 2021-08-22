package com.study.controller;

import com.study.dao.MessageMapper;
import com.study.dao.ReplyMapper;
import com.study.dao.UserMapper;
import com.study.pojo.*;
import com.study.util.GetUnreadMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    UserMapper userMapper;
    @Autowired
    MessageMapper messageMapper;
    @Autowired
    ReplyMapper replyMapper;

    @PostMapping("/service/login")
    public String login(@RequestParam("userName") String userName,
                        @RequestParam("password") String password,
                        Model model,
                        HttpSession session){

        List<User> allUser = userMapper.getAllUser();
        System.out.println(allUser.get(0));

        for (User u:
             allUser) {
            if (u.getUser_name().equals(userName)){

                if (u.getUser_password().equals(password)){
                    List<User> users = userMapper.selectUserByName(userName);
                    User loginUser = users.get(0);
                    session.setAttribute("userLogin",loginUser);

                    UserMoreMessage userMoreMessage = userMapper.selectMessage(loginUser.getUser_id()).get(0);
                    session.setAttribute("userMessage",userMoreMessage);

                    //登录的同时查询有多少条未读消息
                    AllMessageAndReply unreadMessageAndReply = GetUnreadMessage.getUnreadMessageAndReply(messageMapper,replyMapper,loginUser);
                    int unreadNumber = GetUnreadMessage.getUnreadNumber(unreadMessageAndReply.getMessageAndReplies());
                    session.setAttribute("mAndR",unreadMessageAndReply);
                    session.setAttribute("mAndRNumber",unreadNumber);

                    return "redirect:/main.html";
                }else {
                    model.addAttribute("msg","密码错误");

                    return "index";
                }
            }
        }

        model.addAttribute("msg","您输入的账户不存在");

        return "index";
    }



}
