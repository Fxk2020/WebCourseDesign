# 介绍

本仓库的是利用Html（css JavaScript）+JSP（servlet）搭建网站

## 第一个项目

采用Jave Web技术开发Web技术课程网站，网站主要实现教学大纲、课程介绍等教学内容的浏览，教学课件和视频资料的浏览下载，简单的留言和回复功能。

## 第二个项目

选用一种与课程相关的技术开发已电子商务系统，实现商户对网上商品的管理以及客户在平台上购物等基本功能。添加了mysql数据库的使用。

### 2021.8.8使用springboot框架重写第一个项目

#### 数据库

- 用户表

![在这里插入图片描述](https://img-blog.csdnimg.cn/73987cdde4a14a17917e397c7d1fba47.png)

- 用户附加信息表

  ![在这里插入图片描述](https://img-blog.csdnimg.cn/8c3e2037672b48cd92c160a46fb44220.png)

- 留言回复表

  - 留言表

    ![在这里插入图片描述](https://img-blog.csdnimg.cn/d650bc5ab08443bbaaf833f706c1bf70.png)

  - 回复表[方便展示--有冗余数据]

  ![在这里插入图片描述](https://img-blog.csdnimg.cn/74988bdd7a5a40419be18dc327b4125f.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2pvZXlfcm8=,size_16,color_FFFFFF,t_70)

- 课程的相关表

  - 主体表

    ![在这里插入图片描述](https://img-blog.csdnimg.cn/7200843d690f4cb282de6263e5b09a30.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2pvZXlfcm8=,size_16,color_FFFFFF,t_70)

  - 收藏记录[方便记录有冗余数据]
  
    ![在这里插入图片描述](https://img-blog.csdnimg.cn/c33a42a0d3794d33b532a7bd63d2eb11.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2pvZXlfcm8=,size_16,color_FFFFFF,t_70)

#### 进度表

8.8-8.15登录、注册，网站大体框架搭建完成

8.16-8.18实现个人中心

- 上传头像
- 更改签名

8.19-8.20实现留言和回复

8.20-8.21实现课件分享和下载

8.22总结博客

具体效果见：http://47.113.196.88:8188/

具体博客见：https://blog.csdn.net/joey_ro/article/details/119850750