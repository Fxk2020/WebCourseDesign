package com.study.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 用来记录user_id下的所有留言及回复
 * --非数据库对应的实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AllMessageAndReply {

    private int user_id;
    private String user_name;
    private String user_avatar;

    private List<MessageAndReply> messageAndReplies;

}
