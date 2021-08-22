package com.study.util;

public class GetSuffix {

    public static String getPng(String fileName){
        //获得图片的原始格式
        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);

        return suffix;
    }
}
