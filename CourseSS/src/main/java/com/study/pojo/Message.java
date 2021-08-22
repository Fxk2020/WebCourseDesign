package com.study.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {

    private int user_id;
    private int message_id;
    private String message;

    private Timestamp message_time;


    public Message(int user_id, String message) {
        this.user_id = user_id;
        this.message = message;
    }
}
