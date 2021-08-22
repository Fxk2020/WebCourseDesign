package com.study.util;

import com.study.dao.MessageMapper;
import com.study.dao.ReplyMapper;
import com.study.pojo.*;

import java.util.ArrayList;
import java.util.List;

public class GetUnreadMessage {

    /**
     * 返回所有未读的消息和回复的结构
     * @param user
     * @return
     */
    public static AllMessageAndReply getUnreadMessageAndReply(MessageMapper messageMapper, ReplyMapper replyMapper, User user){

        List<Message> messages = messageMapper.selectMessageByUserId(user.getUser_id());

        List<MessageAndReply> messageAndReplies = new ArrayList<>();
        for (int i = 0; i < messages.size(); i++) {
            //获得未读的回复消息
            List<Reply> replies = replyMapper.selectUnreadReplyById(messages.get(i).getMessage_id());
            if (replies.size()!=0){
                MessageAndReply messageAndReply = new MessageAndReply(messages.get(i).getMessage_id(),
                        messages.get(i).getMessage(),messages.get(i).getMessage_time(),replies);
                messageAndReplies.add(messageAndReply);
            }

        }

        AllMessageAndReply allMessageAndReply = new AllMessageAndReply(user.getUser_id(),user.getUser_name(),
                user.getUser_avatar(), messageAndReplies);

        return allMessageAndReply;

    }

    /**
     * 返回未读的回复总数
     * @param messageAndReplies 所有未读的消息和回复
     * @return
     */
    public static int getUnreadNumber(List<MessageAndReply> messageAndReplies){

        int number = 0;

        for (int i = 0; i < messageAndReplies.size(); i++) {
            int temp = messageAndReplies.get(i).getReplies().size();
            number += temp;
        }

        return number;
    }


}
