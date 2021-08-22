package com.study.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.List;

/**
 * 用来记录message_id对应留言及所有回复
 *
 * --非数据库对应的实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessageAndReply {

    private int message_id;
    private String message;
    private Timestamp timestamp;
    private List<Reply> replies;
}
