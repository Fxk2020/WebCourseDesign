<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/1/27
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<html>
<head>
  <title>Web技术课程网站</title>
  <link rel="stylesheet" type="text/css" href="CSS文件/navigation.css">
  <link rel="stylesheet" type="text/css" href="CSS文件/new_kinds.css">
  <script type="text/javascript" src="Jquery/jquery.min.js"></script>
  <script type="text/javascript" src="JS/MainPage.js"></script>
  <script type="text/javascript" src="JS/script.js"></script>

  <!--实现图片的轮播的css逻辑-->
  <style>
    .pic{
      width: 100%;
      height: 458px;
      margin: 10px auto;
      position: relative;
      overflow: hidden;
    }
    .content{
      /*<!--能存好多张图 -->*/
      width: 99999px;
      height: 458px;
      position: absolute;
      left: 0px;
      top: 0px;

    }
    .content img{

    }
    .index{
      position: absolute;
      left: 300px;
      bottom: 5px;
      width: 200px;
      height: 20px;
      list-style: none;
    }
    .index li{
      width: 10px;
      height: 10px;
      border-radius: 50%;
      float: left;
      margin-left: 10px;
      background-color: rgba(100,100,100,0.3);
    }

    .left{
      width: 30px;
      height:50px;
      background-color:rgba(100,100,100,0.5);
      position: absolute;
      left: 0px;
      top: 150px;
      line-height: 50px;
      text-align: center;
      font-size: 20px;
      color: #fff;
      display: none;
    }
    .right{
      width: 30px;
      height:50px;
      background-color:rgba(100,100,100,0.5);
      position: absolute;
      right: 0px;
      top: 150px;
      line-height: 50px;
      text-align: center;
      font-size: 20px;
      color: #fff;
      display: none;
    }

    .class_li{
      list-style-type:none;
    }
  </style>

  <!--实现图片的轮播的js逻辑-->
  <script type="text/javascript">
    $(function(){
      //每个固定的时间移动图片
      var timer = setInterval(picLoop,2000);
      var index = 0;

      //定时移动图片
      function picLoop(){
        index++;
        if (index==8) {index=0;}
        //偏移量 显示的内容与容器初始内容的偏移量
        $(".content").animate({"left":-1290*index},500);
        $(".class_li").eq(index).css("background-color","red")
                .siblings().css("background-color","rgba(100,100,100,0.3)");
      }

      //定时器的控制
      $(".pic").hover(function(){
        clearInterval(timer);//clearInterval(timer)的作用只是将定时器停止，但是timer变量本身还是存在的
        $(".left").show();
        $(".right").show();
      },function(){
        timer = setInterval(picLoop,2000);//离开时启动定时器
        $(".left").hide();
        $(".right").hide();
      });


      //小点控制显示那张图片
      $(".class_li").mouseover(function(){
        $(this).css("background-color","red")
                .siblings().css("background-color","rgba(100,100,100,0.3)");
        index = $(this).index();
        $(".content").animate({"left":-1290*index},300);

      })

      //左右移动图片
      $(".left").click(function(){
        index--;
        if (index==-1) {index=7;}
        $(".content").animate({"left":-1290*index},300);
        $("li").eq(index).css("background-color","red")
                .siblings().css("background-color","rgba(100,100,100,0.3)");
      })
      $(".right").click(function(){
        index++;
        if (index==8) {index=0}
        $(".content").animate({"left":-1290*index},300);
        $("li").eq(index).css("background-color","red")
                .siblings().css("background-color","rgba(100,100,100,0.3)");
      })


    })
  </script>

</head>

<body>

<!--引入jQuery-->
<script language="JavaScript"  src="Jquery/jquery-3.4.1.js"></script>

<div id="Container">

  <!--网站log-->
  <div id="Header_img">
    <img src="CSS文件/Photos/Web.jpg" width="100%" height="50%" style="margin-bottom: 35px">

    <%
      String name= request.getParameter("name");
      String pinglun = request.getParameter("pinglun");
      if (pinglun!=null&&pinglun.equals("yes")){
    %>
    <script>
      alert("留言评论成功！");
    </script>
    <%
      }

      if (name==null||name==""){
        %>
    <span style="margin-top: 10px"><a class="font4" style="font-size: 18px" href="login.jsp">亲，请先登录！</a></span>
    <%
      }else {
        System.out.println("name:"+name);
        %>

   <span style="margin-top: 10px"><font class="font4" style="font-size: 18px">您好，<%=name%>同学！</font></span>
    <br>
    <br>
    <span><font class="font4" style="font-size: 18px">快去学习吧！</font></span>
    <%
      }

    %>

  </div>

  <!--实现图片的轮播-->
  <div id="Header" class="pic">
    <div id="front" class="content">
      <a class="class_i" href="#"><img src="CSS文件/frontEnd/why.jpg" style="width: 1290px" height="458px"></a>
      <a class="class_i" href="#"><img src="CSS文件/frontEnd/html5.jpg" style="width: 1290px" height="458"></a>
      <a class="class_i" href="#"><img src="CSS文件/frontEnd/css.jpeg" style="width: 1290px" height="458"></a>
      <a class="class_i" href="#"><img src="CSS文件/frontEnd/js.png" style="width: 1290px" height="458"></a>
      <a class="class_i" href="#"><img src="CSS文件/frontEnd/jQuery.jpg" style="width: 1290px" height="458"></a>
      <a class="class_i" href="#"><img src="CSS文件/afterEnd/jsp.jpg" style="width: 1290px" height="458px"></a>
      <a class="class_i" href="#"><img src="CSS文件/afterEnd/jsf.jpg" style="width: 1290px" height="458px"></a>
      <a class="class_i" href="#"><img src="CSS文件/afterEnd/mysql.png" style="width: 1290px" height="458px"></a>
      <a class="class_i" href="#"><img src="CSS文件/afterEnd/node.png" style="width: 1290px" height="458px"></a>
    </div>
    <!--    图片下面的小点    -->
    <ul class="index" style="align-self: center" >
      <li class="class_li" style=" background-color: red;"></li><!-- 起始点是红色的 -->
      <li class="class_li"></li>
      <li class="class_li"></li>
      <li class="class_li"></li>
      <li class="class_li"></li>
      <li class="class_li"></li>
      <li class="class_li"></li>
      <li class="class_li"></li>
    </ul>
    <div class="right">></div>
    <div class="left"><</div>
  </div>


  <!--&lt;!&ndash;头像上传和登陆界面&ndash;&gt;-->
  <!--    <input type="file" id="chooseImage" name="file" value="上传头像">-->
  <!--    <div id="register">-->
  <!--        <img align="center" id="cropedBigImg" value='custom' alt="lorem ipsum dolor sit" data-address='' title="自定义背景" src="CSS文件/Photos/HeadImage.png"/><br><br><br><br>-->
  <!--        <input align="center" id="chooseImages" type='button' value='上传头像'  OnClick='getSrc()' class="btn"/><br>-->
  <!--        <input id="log" type="button" onclick="" value="登陆" class="new_button">-->
  <!--        &lt;!&ndash; 保存用户自定义的背景图片 &ndash;&gt;-->
  <!--    </div>-->

  <!--    <script>-->
  <!--//登陆界面-->
  <!--//将文件上传按钮隐藏-->
  <!--        $('#chooseImage').hide();-->

  <!--        function getSrc() {-->
  <!--            // alert("hello");-->
  <!--            //点击按钮实现头像的上传。-->
  <!--            $("#chooseImage").click();-->
  <!--        }-->
  <!--//将图片上传到指定位置-->
  <!--        $('#chooseImage').on('change',function(){-->
  <!--            var filePath = $(this).val(),         //获取到input的value，里面是文件的路径-->
  <!--                fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase(),-->
  <!--                src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式-->

  <!--            // 检查是否是图片-->
  <!--            if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {-->
  <!--                error_prompt_alert('上传错误,文件格式必须为：png/jpg/jpeg');-->
  <!--                return;-->
  <!--            }-->

  <!--            $('#cropedBigImg').attr('src',src);-->
  <!--        });-->


  <!--    </script>-->

  <!--主要的内容显示界面-->
  <div id="PageBody">
    <!--左侧导航页-->
    <div id="SideBar">
      <img src="CSS文件/Photos/java.png" width="30" height="30" id="flag" style="margin-top: 35px"><br>
      <span id="box">
        <img src="CSS文件/Photos/title.gif" width="30" height="80" id="flag2" style="margin-top: 50px;margin-left: -30px">
        <div id="menu">
            <ul class="menu_ul">
                <li class="menu_li"><a onclick="refreshes()" class="menu_a" title="课程大纲在这里">首页</a></li>
                <li class="menu_li"><a onclick="homePage()" class="menu_a" title="开发工具和语言">总览</a></li>
                <li class="menu_li"><a onclick="downloadPage()" class="menu_a" title="PPT浏览和下载">课件</a></li>
                <li class="menu_li"><a onclick="video()" class="menu_a" title="全部视频在这里">视频</a></li>
                <li class="menu_li"><a onclick="forum()" class="menu_a" title="和小伙伴尽情的讨论吧">论坛</a></li>
            </ul>
        </div>
        </span>
    </div>
    <!--实现导航菜单隐藏的js逻辑-->
    <script>

      $(document).ready(function () {
        $("#box").hover(function () {
          $("#menu").show(300);
        },function () {
          $("#menu").hide(300);
        });

      })

    </script>

    <!-- JS控制逻辑 -->
    <script>
      //引入jQuery并且使html文件进入div中
      function homePage(){
//设置背景图片
        var m1 = document.getElementById("MainBody");
        m1.style.backgroundImage = 'url(CSS文件/Pictures/2.jpg)';
        var i = 1;
        if (i===1){
          m1.className = 'divBg';//css类的名字
        }

//jQuery载入html文件
        var m = $("#MainBody");

        m.load("Start.html");

        var foot = $("#Footer");
        foot.show();

      }
      //刷新当前页面所以function不能由js文件导入到html中。
      function refreshes() {

        // alert("ok");

        window.location.reload();//刷新当前页面.

      }

      //导入ppt下载的网页
      function downloadPage() {

        var mm = document.getElementById("MainBody");

        mm.style.backgroundImage = "";//设置背景图片为空

        var m = $("#MainBody");
        m.load("pptBrowse.html");

        var foot = $("#Footer");
        foot.hide();

      }
      //引入留言的html
      function forum() {

        var foot = $("#Footer");
        foot.show();

        var m = $("#MainBody");

        m.load("answering.jsp");

        // alert("hello!");



      }
      //引入视频下载的html
      function video() {

        var foot = $("#Footer");
        foot.show();


        var mm = document.getElementById("MainBody");

        mm.style.backgroundImage = "";//设置背景图片为空

        var m = $("#MainBody");

        m.load("HTMLVideo.html");



      }
    </script>


    <div id="MainBody">
      <img src="CSS文件/Photos/课程简述.jpg" class="adapt2">
      <h2 class="h_nature">课程概述:</h2>
      <p class="p_nature">在互联网迅速发展的今天，我们已能深切感受到互联网带给我们工作与生活方式上的巨大变化。了解互联网的运作机制并掌握一些基本的Web程序设计的技巧与技能已成为时代对目前大多数学习者的一项基本要求。该课程紧扣互联网发展的趋势，以“前台+后台”为支撑，以“能力+项目”为驱动，使学习者了解Web编程的基本框架，并在此基础上培养学习者基本的Web编程技能。</p>
      <p class="p_nature">在内容组织上，该课程主要包括WEB原理、开发过程和环境部署；HTML语言基础； CSS技术、JavaScript技术、JavaEE技术；重点介绍JSP、servlet及相关的数据库应用开发。</p>

      <img src="CSS文件/Photos/课程大纲.jpg" class="adapt2">
      <h2 class="h_nature"> 课程大纲:</h2>

      <!--书签导航-->
      <div id="bookmark">
        <img src="CSS文件/Photos/书签.jpg" class="adapt3">
        <h3 class="h4_nature">书签传送</h3>
        <ul>
          <!-- 利用超链接创建书签 需要借助下面《a》标签的name属性-->
          <li class="no_disc"><a href="#1" class="bookmark">第一章</a><a href="#2" class="bookmark">第二章</a><a href="#3" class="bookmark">第三章</a><a href="#4" class="bookmark">第四章</a><a href="#5" class="bookmark">第五章</a></li>
          <li class="no_disc"><a href="#6" class="bookmark">第六章</a><a href="#7" class="bookmark">第七章</a><a href="#8" class="bookmark">第八章</a><a href="#9" class="bookmark">第九章</a><a href="#10" class="bookmark">第十章</a></li>
          <li class="no_disc"><a href="#11" class="bookmark">第十一章</a><a href="#12" class="bookmark">第十二章</a><a href="#13" class="bookmark">第十三章</a><a href="#14" class="bookmark">第十四章</a></li>
          <li class="no_disc"></li>
        </ul>
      </div>


      <h4 class="h4_nature"><a name="1">第一章 Web前端开发技术综述：</a></h4> <!-- 利用超链接创建书签 -->
      <ul class="ul_nature">
        <li>了解Web发展史；</li>
        <li> 掌握Web网站相关的基本概念；</li>
        <li>理解Web前端开发技术及其在Web网页中的作用；</li>
        <li> 熟悉并学会使用常用的Web前端开发工具、浏览器工具。</li>
      </ul>

      <h4 class="h4_nature"><a name="2">第二章 HTML基础：</a></h4>
      <ul class="ul_nature">
        <li>了解HTML 文档的基本结构；</li>
        <li> 理解标记类型、标记语法；</li>
        <li> 学会body标记的属性的设置方法；</li>
        <li>  学会给网页添加注释；</li>
        <li>理解meta元信息的作用；</li>
        <li>了解HTML文档类型</li>
      </ul>

      <h4 class="h4_nature"><a name="3">第三章 格式化文字与段落：</a></h4>
      <ul class="ul_nature">
        <li>掌握标题字（h1～h6）标记语法及属性语法。</li>
        <li> 理解文本格式化标记类型与作用，并学会使用各种样式。</li>
        <li> 学会使用字体font 标记。</li>
        <li> 学会使用段落与排版标记。</li>
        <li> 学会使用各类格式化标记设计简易的Web 页面。</li>
      </ul>

      <h4 class="h4_nature"><a name="4">第四章 列表：</a></h4>
      <ul class="ul_nature">
        <li>了解列表的类型；</li>
        <li> 掌握无序列表、有序列表、定义列表标记语法及属性语法；</li>
        <li> 了解菜单列表、目录列表标记语法；</li>
        <li>学会使用无序、有序及定义列表设计Web网页；</li>
        <li> 学会使用嵌套列表设计小型网站首页。</li>
      </ul>

      <h4 class="h4_nature"><a name="5">第五章 超链接：</a></h4>
      <ul class="ul_nature">
        <li>掌握超链接的基本标记语法和属性语法。</li>
        <li> 理解超链接分类、路径、书签等概念。</li>
        <li>学会使用超链接实现文件下载、FTP 下载、电子邮件链接、图像链接。</li>
        <li>学会使用超链接制作书签。</li>
        <li>学会使用浮动框架实现内嵌页面的显示。</li>
      </ul>

      <h4 class="h4_nature"><a name="6">第六章 图像与多媒体文件：</a></h4>
      <ul class="ul_nature">
        <li>掌握图像img标记语法及属性设置方法。</li>
        <li> 学会设置图像热区链接。</li>
        <li>掌握滚动文字marquee标记语法及属性设置方法。</li>
        <li>掌握背景音乐bgsound标记语法及属性设置方法。</li>
        <li> 学会采用超链接插入动画、音频和视频类等多媒体文件。</li>
      </ul>

      <h4 class="h4_nature"><a name="7">第七章 CSS基础：</a></h4>
      <ul class="ul_nature">
        <li>理解CSS 的概念、特点。</li>
        <li> 掌握CSS 基本语法、选择器分类与声明的结构。</li>
        <li> 掌握CSS 的定义及引用的方式。</li>
        <li> 理解CSS 继承与层叠的含义。</li>
      </ul>

      <h4 class="h4_nature"><a name="8">第八章 DIV与SPAN(1课时)：</a></h4>
      <ul class="ul_nature">
        <li>掌握DIV标记的基本用法、常用属性。</li>
        <li> 理解DIV嵌套与层叠的含义。</li>
        <li> 掌握SPAN标记的语法，灵活使用SPAN标记。</li>
        <li>掌握DIV与SPAN标记在使用上的差异</li>
        <li> 学会使用DIV+CSS进行和简易页面布局。</li>
      </ul>

      <h4 class="h4_nature"><a name="9">第九章 CSS样式属性(2课时)：</a></h4>
      <ul class="ul_nature">
        <li>熟悉CSS样式设置中常用的单位。</li>
        <li> 掌握控制文字、文本、背景、颜色、列表等样式的属性及设置方法。</li>
        <li>理解CSS盒子模型。</li>
        <li> 掌握边框、边界、填充及内容等属性及设置方法。</li>
      </ul>

      <h4 class="h4_nature"><a name="10">第十章 CSS+DIV页面布局（1-2课时）：</a></h4>
      <ul class="ul_nature">
        <li>熟练地使用DIV标记的CSS各类属性。</li>
        <li>掌握CSS定义与引用方法，学会使用外部样式表定义页面样式。</li>
        <li>熟悉各类常见的页面布局类型，能够写出相应的DIV结构及CSS规则。</li>
        <li>学会使用DIV+CSS进行页面布局，能够编写HTML代码和CSS文件。</li>
      </ul>

      <h4 class="h4_nature"><a name="11">第十一章 表格：</a></h4>
      <ul class="ul_nature">
        <li> 掌握设计表格所有标记和属性。</li>
        <li>掌握表格行标记的属性及设置方法。</li>
        <li> 掌握表格单元格的跨行与跨列属性的设置方法。</li>
        <li>掌握表格的嵌套方法。</li>
        <li>学会在表格中嵌入各种页面元素。</li>
        <li>学会使用表格进行简易网页布局。</li>
      </ul>

      <h4 class="h4_nature"><a name="12">第十二章 表单：</a></h4>
      <ul class="ul_nature">
        <li> 理解Web网页中表单的概念与作用。</li>
        <li> 掌握表单结构语法及属性语法。</li>
        <li> 掌握表单元素标记语法及属性语法。</li>
        <li>掌握域和域标题标记语法。</li>
        <li>学会综合运用表单及表单元素设计Web网页。</li>
      </ul>

      <h4 class="h4_nature"><a name="13">第十三章 HTML5 基础与CSS3 应用：</a></h4>
      <ul class="ul_nature">
        <li>熟悉掌握HTML5 新特性。</li>
        <li>掌握HTML5 页面结构。</li>
        <li>学会使用HTML5 新增元素和新增属性。</li>
        <li>掌握HTML5 新增表单元素及新增属性的设置方法。</li>
        <li>学会使用HTML5 的Audio 和Video 媒体元素。</li>
        <li>学会HTML5 本地存储开发简易Web 应用。</li>
        <li>学会使用CSS3 的转换、过渡和动画等特性设计页面的动态效果。</li>
        <li>学会设置与应用CSS3 文本效果及多列等属性。</li>
      </ul>

      <h4 class="h4_nature"><a name="14">第十四章 JavaScript基础：</a></h4>
      <ul  type="disc" class="ul_nature">
        <li>理解JavaScript程序的概念与作用；</li>
        <li>掌握JavaScript标识符和变量的概念及使用方法；</li>
        <li>掌握JavaScript常用运算符和表达式概念；</li>
        <li>掌握JavaScript中顺序、分支、循环等3种程序控制结构语法；</li>
        <li>掌握JavaScript函数的定义方法，并学会使用；</li>
        <li>学会综合运用JavaScript设计具有动态、交互功能的网页。</li>
      </ul>


      <!--  letter-spacing:2px;line-height:1em;text-indent:2em字符间距，行高，首行缩进 -->

      <img src="CSS文件/Photos/学习.jpg" class="adapt4">
      <h2 class="h_nature">预备知识:</h2>
      <p class="p_nature">学习该课程，您应该具备以下条件：</p>
      <p class="p_nature"> 1、熟悉Java语言程序设计基础知识；</p>
      <p class="p_nature"> 2、了解因特网与万维网运行基本原理；</p>
      <p class="p_nature">3、对B/S及C/S有较清晰的认识；</p>
      <p class="p_nature"> 4、能够分清楚前端与后台的概念.</p>

      <img src="CSS文件/Photos/考试.jpg" class="adapt2">
      <h2 class="h_nature">考试要求:</h2>
      <p class="p_nature">一、成绩组成，实验成绩50%，期末上级考试50%</p>
      <p class="p_nature"> 二、实验成绩</p>
      <p class="p_nature"> （1）采用课程相关技术实现Web技术课程网站，网站主要实现教学大纲、课程介绍等教学内容的浏览，教学课件和视频资料的浏览下载，简单的留言和回复功能(20分)</p>
      <p class="p_nature">（2）选用一种与课程相关的技术开发已电子商务系统，实现商户对网上商品的管理以及客户在平台上购物等基本功能。（30分）</p>
      <p class="p_nature"> 三、期末考试</p>
      <p class="p_nature"> （1）笔试，主要考察学生对基本概念和基本技术原理的掌握（20分）</p>
      <p class="p_nature">（2）上机考试，主要考察学生实际Web技术开发能力。（30分）</p>

      <img src="CSS文件/Photos/课外材料.jpg" class="adapt2">
      <h2 class="h_nature">课外资料:</h2>
      <p class="p_nature"><a href="https://www.icourse163.org/course/XJTU-1003679001" class="a1">Web编程技术(西安交通大学)</a> </p>
      <p class="p_nature"> <a href="http://pan.baidu.com/s/1bpDQStp" class="a1">储久良课件下载（密码：1lxv）</a> </p>
      <p class="p_nature"><a href="https://www.icourse163.org/course/NBCC-1001710008" class="a1">JSP开发应用(面向职业 )</a> </p>
      <!--防止页眉阻挡文字-->
      <br>
      <br>

    </div>
  </div>

  <div id="Footer">
    <p>
      <a href="start2.html">刷新</a>
      2019-2020 Web 前端工作室 &copy山东大学软件学院傅显坤
      <a href="mailto:2629256976@qq.com?subject=Hello%20again&body=有问题">有问题请联系我们</a>
    </p>
  </div>
</div>

</body>
</html>
