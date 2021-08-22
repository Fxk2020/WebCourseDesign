package com.study.util;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

public class OssPutObject {

    public static String putObject(String url,String fileName) throws FileNotFoundException {
        // yourEndpoint填写Bucket所在地域对应的Endpoint。以华东1（杭州）为例，Endpoint填写为https://oss-cn-hangzhou.aliyuncs.com。
        String endpoint = "https://oss-cn-beijing.aliyuncs.com";
        // 阿里云账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM用户进行API访问或日常运维，请登录RAM控制台创建RAM用户。
        String accessKeyId = AliyunAccout.accessKeyId;
        String accessKeySecret = AliyunAccout.accessKeySecret;

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 填写本地文件的完整路径。如果未指定本地路径，则默认从示例程序所属项目对应本地路径中上传文件流。
        InputStream inputStream = new FileInputStream(url);
        // 依次填写Bucket名称（oss-img-fxk）和Object完整路径（例如exampledir/exampleobject.txt）。Object完整路径中不能包含Bucket名称。
        ossClient.putObject("oss-img-fxk", "courseSS/imgAvatar/"+fileName, inputStream);

        // 关闭OSSClient。
        ossClient.shutdown();

        //返回上传文件的url
        String resultUrl = "https://oss-img-fxk.oss-cn-beijing.aliyuncs.com/courseSS/imgAvatar/"+fileName;
        return resultUrl;

    }

}
