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
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MessageReplyController {

    @Autowired
    UserMapper userMapper;
    @Autowired
    MessageMapper messageMapper;
    @Autowired
    ReplyMapper replyMapper;

    /**
     * 获取全部留言和回复
     * @param session
     * @return 留言和回复页面
     */
    @GetMapping("/service/message")
    public String getAllMessageAndReply(HttpSession session){

        User user = (User) session.getAttribute("userLogin");

        List<AllMessageAndReply> allMessageAndReplies = getAllMessageAndReply();
        AllMessageAndReply messageAndReplyByUser = getMessageAndReplyByUser(user);

        session.setAttribute("allMessageAndReply",allMessageAndReplies);
        session.setAttribute("messageAndReply",messageAndReplyByUser);

        return "redirect:/messageReply.html";
    }


    /**
     * 发表留言
     * @param message 留言内容
     * @param session
     * @param model
     * @return
     */
    @GetMapping("/service/addMessage")
    public String addMessage(@RequestParam("message") String message,
                             HttpSession session,
                             Model model){

        User user = (User) session.getAttribute("userLogin");
        Message meg = new Message(user.getUser_id(),message);

        messageMapper.addMessage(meg);

        //更新session中的值
        List<AllMessageAndReply> allMessageAndReplies = getAllMessageAndReply();
        AllMessageAndReply messageAndReplyByUser = getMessageAndReplyByUser(user);

        session.setAttribute("allMessageAndReply",allMessageAndReplies);
        session.setAttribute("messageAndReply",messageAndReplyByUser);

        session.setAttribute("msg","成功发表留言");


        return "redirect:/messageReply.html";
    }


    /**
     * 进行回复
     * @param reply
     * @param message_id
     * @param session
     * @param model
     * @return
     */
    @GetMapping("/service/addReply")
    public String addReply(@RequestParam("reply") String reply,
                           @RequestParam("message_id") int message_id,
                           HttpSession session,
                           Model model){
        User user = (User) session.getAttribute("userLogin");
        int user_id = user.getUser_id();
        String user_name = user.getUser_name();
        String user_avatar = user.getUser_avatar();

        Reply replyAdd = new Reply(user_id,message_id,reply,user_name,user_avatar);

        replyMapper.addReply(replyAdd);

        //更新session中的值
        List<AllMessageAndReply> allMessageAndReplies = getAllMessageAndReply();
        AllMessageAndReply messageAndReplyByUser = getMessageAndReplyByUser(user);

        session.setAttribute("allMessageAndReply",allMessageAndReplies);
        session.setAttribute("messageAndReply",messageAndReplyByUser);
        session.setAttribute("msg","评论成功");

        return "redirect:/messageReply.html";
    }


    @GetMapping("/service/removeUnreadReply")
    public String removeUnreadReply(@RequestParam("message_id") int message_id,
                                    HttpSession session){
        User user = (User) session.getAttribute("userLogin");

        //标记为已读
        replyMapper.removeUnreadReply(message_id);

        //更新session中的值
        List<AllMessageAndReply> allMessageAndReplies = getAllMessageAndReply();
        AllMessageAndReply messageAndReplyByUser = getMessageAndReplyByUser(user);

        session.setAttribute("allMessageAndReply",allMessageAndReplies);
        session.setAttribute("messageAndReply",messageAndReplyByUser);
        session.setAttribute("msg","已经标记为已读！");

        //登录的同时查询有多少条未读消息
        AllMessageAndReply unreadMessageAndReply = GetUnreadMessage.getUnreadMessageAndReply(messageMapper,replyMapper,user);
        int unreadNumber = GetUnreadMessage.getUnreadNumber(unreadMessageAndReply.getMessageAndReplies());
        session.setAttribute("mAndR",unreadMessageAndReply);
        session.setAttribute("mAndRNumber",unreadNumber);

        return "redirect:/messageReply.html";
    }


    /**
     * 获得所有留言回复
     */
    private List<AllMessageAndReply> getAllMessageAndReply(){
        List<User> allUser = userMapper.getAllUser();
        List<AllMessageAndReply> allMessageAndReplies = new ArrayList<>();

        for (int i = 0; i < allUser.size(); i++) {
            //每个人不同的消息
            List<Message> messages = messageMapper.selectMessageByUserId(allUser.get(i).getUser_id());

            List<MessageAndReply> messageAndReplies = new ArrayList<>();
            for (int j = 0; j < messages.size(); j++) {

                List<Reply> replies = replyMapper.selectReplyById(messages.get(j).getMessage_id());

                MessageAndReply messageAndReply = new MessageAndReply(messages.get(j).getMessage_id(),
                        messages.get(j).getMessage(),messages.get(j).getMessage_time(),replies);

                messageAndReplies.add(messageAndReply);
            }

            AllMessageAndReply allMessageAndReply = new AllMessageAndReply(allUser.get(i).getUser_id(),allUser.get(i).getUser_name(),
                    allUser.get(i).getUser_avatar(), messageAndReplies);
            allMessageAndReplies.add(allMessageAndReply);

        }
        return allMessageAndReplies;
    }

    /**
     * 获取登录用户的全部留言回复信息
     * @param loginUser 登录的用户
     * @return
     */
    private AllMessageAndReply getMessageAndReplyByUser(User loginUser){

        List<Message> messages = messageMapper.selectMessageByUserId(loginUser.getUser_id());

        List<MessageAndReply> messageAndReplies = new ArrayList<>();
        for (int j = 0; j < messages.size(); j++) {

            List<Reply> replies = replyMapper.selectReplyById(messages.get(j).getMessage_id());

            MessageAndReply messageAndReply = new MessageAndReply(messages.get(j).getMessage_id(),
                    messages.get(j).getMessage(),messages.get(j).getMessage_time(),replies);

            messageAndReplies.add(messageAndReply);
        }

        AllMessageAndReply allMessageAndReply = new AllMessageAndReply(loginUser.getUser_id(),loginUser.getUser_name(),
                loginUser.getUser_avatar(), messageAndReplies);

        return allMessageAndReply;
    }


}
