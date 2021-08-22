package com.study.controller;

import com.study.dao.UserMapper;
import com.study.pojo.User;
import com.study.pojo.UserMoreMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AddUserMessageController {

    @Autowired
    UserMapper userMapper;

    @GetMapping("/service/changeUserName")
    public String changeUserName(@RequestParam("userName") String newName,
                                 HttpSession session,
                                 Model model){

        User user = (User) session.getAttribute("userLogin");

        if (user.getUser_name().equals(newName)){
            model.addAttribute("msg","新的昵称不能没有变化");
        }else {
            List<User> allUser = userMapper.getAllUser();
            for (int i = 0; i < allUser.size(); i++) {
                if (allUser.get(i).getUser_name().equals(newName)){
                    model.addAttribute("msg","该昵称已经存在，请重新修改");
                    return "personal";
                }
            }

            //昵称不重复
            user.setUser_name(newName);
            userMapper.updateUserName(user);
            model.addAttribute("msg","修改成功");

        }
        return "personal";
    }


    @GetMapping("/service/changeUserMessage")
    public String changUserMessage(@RequestParam("userSignature") String signature,
                                   @RequestParam("userAddress") String address,
                                   @RequestParam("userWebsite") String website,
                                   @RequestParam("desc") String introduction,
                                   HttpSession session,
                                   Model model){
        User user = (User) session.getAttribute("userLogin");
        user.setUser_signature(signature);

        UserMoreMessage userMoreMessage = (UserMoreMessage) session.getAttribute("userMessage");
        userMoreMessage.setUser_address(address);
        userMoreMessage.setUser_website(website);
        userMoreMessage.setUser_introduction(introduction);

        userMapper.updateUserSignature(user);
        userMapper.updateUserMessage(userMoreMessage);

        model.addAttribute("msg","修改成功");
        return "personal";
    }

}
