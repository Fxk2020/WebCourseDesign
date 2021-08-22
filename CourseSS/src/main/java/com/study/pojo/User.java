package com.study.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    private Integer user_id;
    private String user_name;
    private String user_password;
    private String user_avatar;
    private String user_signature;

    public User(String user_name, String user_password) {
        this.user_name = user_name;
        this.user_password = user_password;
    }
}
