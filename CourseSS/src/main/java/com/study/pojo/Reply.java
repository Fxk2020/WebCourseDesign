package com.study.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {

    private int user_id;
    private int message_id;
    private int reply_id;
    private String reply;
    private int reply_read;//回复是否被阅读到

    //冗余数据--便于展示
    private String user_name;
    private String user_avatar;

    public Reply(int user_id, int message_id, String reply, String user_name, String user_avatar) {
        this.user_id = user_id;
        this.message_id = message_id;
        this.reply = reply;
        this.user_name = user_name;
        this.user_avatar = user_avatar;
    }
}
