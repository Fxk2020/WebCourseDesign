package com.study.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserMoreMessage {

    private int user_id;
    private String user_address;
    private String user_website;
    private String user_introduction;

}
