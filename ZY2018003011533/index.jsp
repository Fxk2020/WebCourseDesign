<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/21
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>


<!--head负责引入css文件和js文件-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>淘，我喜欢！</title>

    <style>
        /*美化按钮*/
        .new_button{
            display: inline-block;
            outline: none;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            font: 14px/100% Arial, Helvetica, sans-serif;
            padding: 5px 2px 4px;
            text-shadow: 0 1px 1px rgba(0,0,0,.3);
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
            box-shadow: 0 1px 2px rgba(0,0,0,.2);
            color: #d9eef7;
            border: solid 1px #0076a3;
            background: #0095cd;
            background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));
            background: -moz-linear-gradient(top, #00adee, #00678e);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#00678e');

            margin-top: 8px;


        }

        .new_button:hover{
            background: #007ead;
            background: -webkit-gradient(linear, left top, left bottom, from(#00678e), to(#0095cc));
            background: -moz-linear-gradient(top, #00678e, #0095cc);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00678e', endColorstr='#0095cc');
        }
    </style>

    <!--引入css文件-->
    <link href="css/lunbo.css" rel="stylesheet" type="text/css">

    <!--导入js文件-->
    <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
    <script type="text/javascript" src="js/chk.js"></script>
    <script type="text/javascript">



        //实现向上间断滚动的控制
        $(document).ready(function(){
            $(".scroll").hover(function(){//鼠标指向滚动区域
                clearTimeout(timeID);//中止超时，即停止滚动
            },function(){//鼠标离开滚动区域
                timeID=setInterval('autoScroll()',3000);   //设置超时函数，每过3秒执行一次函数
            });
        });
        function autoScroll(){
            $(".scroll").find(".list").animate({   //自定义动画效果
                marginTop : "-25px"
            },500,function(){
                $(this).css({"margin-top" : "0px"}).find("li:first").appendTo(this);   //把列表第一行内容移动到列表最后
            })
        }
        var timeID=setInterval('autoScroll()',3000);   //设置超时函数，每过3秒执行一次函数

        $(document).ready(function() {
            $(".tab_content").hide();							//将class值为tab_content的div隐藏
            $("ul.tabs li a:first").addClass("active"); 				//为第一个选项卡添加样式
            $(".tab_content:first").show(); 						//将第一个class值为tab_content的div显示
            $("ul.tabs li a").hover(function() {						//将鼠标移到某选项卡上
                $("ul.tabs li a").removeClass("active"); 				//移除样式
                $(this).addClass("active"); 						//为当前的选项卡添加样式
                $(".tab_content").hide(); 						//将所有class值为tab_content的div隐藏
                var activeTab = $(this).attr("name"); 		//获取当前选项卡的name属性值
                $(activeTab).show();							//将相同id值的div显示
            });
        });
    </script>

    <style>
        /*position:
        fixed 定位
 元素的位置相对于浏览器窗口是固定位置。

 即使窗口是滚动的它也不会移动：

 控制新的窗口显示

 */
        .black_overlay{
            display: none;
            position: fixed;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=88);
        }
        .white_content {
            display: none;
            position: fixed;
            top: 25%;
            left: 25%;
            width: 55%;
            height: 55%;
            padding: 20px;
            border: 10px solid orange;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }

        #login2{

            float: right;
            position:relative;
            height:320px;
            width:30%;
            overflow:hidden;

            background-image: url("image/123.jpg");
            background-size: 320px  100%;

        }
    </style>
    <!--引进css文件-->
    <link rel="stylesheet" href="css/style.css" />

    <!--引进jQuery文件-->
    <script src="js/jquery-3.4.1.js"></script>

</head>


<!--body负责显示html页面-->
<body class="bodys">
<table class="top_box" width="1206" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">

    <!--jsp逻辑-->
    <%
        //获取用户名：  初始jsp页面时值为null
        String username = request.getParameter("username");

        System.out.println(username);
%>



    <!--log标志-->
    <tr  class="log">
        <td style="background-color: transparent;cursor: pointer" width="98" height="98"  onclick="javascript:void(0)"><img src="images/taobao.gif"></td>
        <td width="260" height="28" onclick=""><img src="image/prize1.png" style="width: 198px;height: 98px"/></td>
        <td width="260" height="28" onclick=""><img src="image/prize2.png" style="width: 198px;height: 98px"/></td>
        <td width="260" height="28" onclick=""><img src="image/prize3.png" style="width: 198px;height: 98px"/></td>
        <td width="260" height="28" ><a href="<%
        if (username!=null&&!username.equals("null")&&!username.equals("")){
            %>http://localhost:8080/ZY2018003011533/ShowCar.jsp?username=<%=username%>
        <%}else {
            %>

       javascript:alert('请您先登陆！');

            <%
        }


        %>"> <img src="image/car_every.png" style="width: 198px;height: 98px"/></a></td>
    </tr>

    <!--log与首页之间的分隔符-->
    <tr>
        <td colspan="6" height="1" bgcolor="#e5e5e5"></td>
    </tr>
    <tr>
        <!--colspan	number	规定单元格可横跨的列数。
          valign
             top
             middle
             bottom
             baseline
             规定单元格内容的垂直排列方式。-->
        <td colspan="6" align="center" valign="top">
            <p style="background-color: #ebebeb;height: 8px">&nbsp;</p><!--用于模块之间的分割-->

            <!--导航栏-->
            <div>
                <script type="text/javascript">
                    //用于显示下拉导航的方法
                    function showadv(par,par2,par3){
                        document.getElementById("a0").style.display = "none";
                        document.getElementById("a0color").style.color = "";
                        document.getElementById("a0bg").style.backgroundImage="";
                        document.getElementById("a1").style.display = "none";
                        document.getElementById("a1color").style.color = "";
                        document.getElementById("a1bg").style.backgroundImage="";
                        document.getElementById("a2").style.display = "none";
                        document.getElementById("a2color").style.color = "";
                        document.getElementById("a2bg").style.backgroundImage="";
                        document.getElementById("a3").style.display = "none";
                        document.getElementById("a3color").style.color = "";
                        document.getElementById("a3bg").style.backgroundImage="";
                        document.getElementById("a4").style.display = "none";
                        document.getElementById("a4color").style.color = "";
                        document.getElementById("a4bg").style.backgroundImage="";
                        document.getElementById("a5").style.display = "none";
                        document.getElementById("a5color").style.color = "";
                        document.getElementById("a5bg").style.backgroundImage="";
                        document.getElementById("a6").style.display = "none";
                        document.getElementById("a6color").style.color = "";
                        document.getElementById("a6bg").style.backgroundImage="";
                        document.getElementById(par).style.display = "";
                        document.getElementById(par2).style.color = "#000000";
                        document.getElementById(par3).style.backgroundImage = "url(images/i13.gif)";
                    }
                </script>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td><div class="i01w">
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <!--onmouseover 事件会在鼠标指针移动到指定的对象上时发生-->
                                    <!--name属性网页内部超链接-->
                                    <td width="166" height="42" align="center" id="a0bg"><span id="a0color" onmouseover="showadv('a0','a0color','a0bg')"><a href="javascript:void(0)" name="007"><font color="#FA4A05">首页</font></a></span></td>
                                    <td width="1"><img src="images/i14.gif" width="1" height="25" /></td>
                                    <td id="a1bg" align="center" width="166"><span id="a1color" onmouseover="showadv('a1','a1color','a1bg')"><a href="beauty.jsp?username=<%=username%>">美妆个护</a></span></td>
                                    <td width="1"><img src="images/i14.gif" width="1" height="25" /></td>
                                    <td id="a2bg" align="center" width="166"><span id="a2color" onmouseover="showadv('a2','a2color','a2bg')"><a href="foodFresh.jsp?username=<%=username%>">美食生鲜</a></span></td>
                                    <td width="1"><img src="images/i14.gif" width="1" height="25" /></td>
                                    <td id="a3bg" align="center" width="166"><span id="a3color" onmouseover="showadv('a3','a3color','a3bg')"><a href="lamps.jsp?username=<%=username%>">灯具电工</a></span></td>
                                    <td width="1"><img src="images/i14.gif" width="1" height="25" /></td>
                                    <td id="a4bg" align="center" width="166"><span id="a4color" onmouseover="showadv('a4','a4color','a4bg')"><a href="toys.jsp?username=<%=username%>">童装玩具</a></span></td>
                                    <td width="1"><img src="images/i14.gif" width="1" height="25" /></td>
                                    <td id="a5bg" align="center" width="166"><span id="a5color" onmouseover="showadv('a5','a5color','a5bg')"><a href = "javascript:void(0)" onclick = "document.getElementById('light2').style.display='block';document.getElementById('fade2').style.display='block'">珠宝饰品</a></span></td>
                                    <td width="1"><img src="images/i14.gif" width="1" height="25" /></td>
                                    <td id="a6bg" align="center" width="166"><span id="a6color" onmouseover="showadv('a6','a6color','a6bg')"><a href = "javascript:void(0)" onclick = "document.getElementById('light2').style.display='block';document.getElementById('fade2').style.display='block'">学习卡卷</a></span></td>
                                </tr>
                            </table>
                        </div></td>
                    </tr>

<!-- 切换jsp页面 -->
<%--                    <div style="visibility: hidden">--%>
<%--                        <form  method="post" action="/beauty.jsp" name="00000">--%>
<%--                            <input type="text" value="<%=username%>" name="username">--%>
<%--                            <input type="submit" id="beauty">--%>
<%--                        </form>--%>

<%--                    </div>--%>

<%--                    <script>--%>
<%--                        function beauty() {--%>
<%--                            $("#beauty").click();--%>
<%--                            // alert("ok");--%>
<%--                        }--%>
<%--                    </script>--%>


                    <!--浮窗弹出表示模块尚未开通-->
                    <div id="light2" class="white_content"><p align="center" class="font2" style="font-size: 55px;margin-top: 125px">模块尚未开通敬请期待！</p>
                        <a href = "javascript:void(0)" onclick = "document.getElementById('light2').style.display='none';document.getElementById('fade2').style.display='none'"><p align="center" style="color: #66CCFF;font-size: 20px;margin-top: 55px">点这里关闭本窗口</p></a></div>
                    <div id="fade2" class="black_overlay"></div>

                    <!--显示的下拉菜单-->
                    <tr>
                        <td><table width="100%" height="41" cellpadding="0" cellspacing="0" id="a0"　border="0">
                            <tr>
                                <td align="left" style="padding-left:12px">欢迎来到淘宝网，好货应有尽有</td>
                            </tr>
                        </table>
                            <table id="a1" style="DISPLAY: none" height="41" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td  style="padding-left:97px" align="left"><ul class="i02w">
                                        <li>时髦女装</li>
                                        <li>潮男冬装</li>
                                        <li>运动户外</li>
                                    </ul></td>
                                </tr>
                            </table>
                            <table id="a2" style="DISPLAY: none" height="41" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td style="padding-left:292px" align="left"><ul class="i02w">
                                        <li><a href="https://huodong.taobao.com/wow/a/act/tao/tmc/24519/wupr?spm=a211oj.13653541.3735339880.d1.43d926780mZt7r&wh_pid=part-industry-176110">馋嘴零食</a></li>
                                        <li><a href="https://huodong.taobao.com/wow/a/act/tao/tmc/24519/wupr?spm=a211oj.13655247.4694290240.d2.4ee038bbKuDsCL&wh_pid=part-industry-176109">速食粮油</a></li>
                                        <li><a href="https://huodong.taobao.com/wow/a/act/tao/tmc/24519/wupr?spm=a211oj.13653541.3735339880.d3.4f5c2678CQfMid&wh_pid=part-industry-176108">海产生鲜</a></li>
                                    </ul></td>
                                </tr>
                            </table>
                            <table id="a3" style="DISPLAY: none" height="41" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td style="padding-left:456px"><ul class="i02w">
                                        <li><a href="#">爆款灯具</a></li>
                                        <li><a href="#">电工五金</a></li>
                                        <li><a href="#">智能家居</a></li>
                                    </ul></td>
                                </tr>
                            </table>
                            <table id="a4" style="DISPLAY: none" height="41" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td style="padding-left:636px"><ul class="i02w">
                                        <li><a href="#">潮流玩具</a></li>
                                        <li><a href="#">时尚童鞋</a></li>
                                        <li><a href="#">童装上新</a></li>
                                    </ul></td>
                                </tr>
                            </table>
                            <table id="a5" style="DISPLAY: none" height="41" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td style="padding-right:160px"><ul class="i03w">
                                        <li>时尚珠宝</li>
                                        <li>开运水晶</li>
                                        <li>珠宝行家</li>
                                    </ul></td>
                                </tr>
                            </table>
                            <table id="a6" style="DISPLAY: none" height="41" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td style="padding-right:2px"><ul class="i03w">
                                        <li>语言学习</li>
                                        <li>职场技能</li>
                                        <li>考试考证</li>
                                    </ul></td>
                                </tr>
                            </table></td>
                    </tr>
                </table>
            </div>

        </td>


    </tr>








    <tr>
        <!--大图轮播-->
        <td colspan="6"  bgcolor="#e5e5e5" valign="top">
            <div class="banner" style="width: 100%">

                <div id='tabs'>

                    <a name="i" href="http://localhost:8080/ZY2018003011533/beauty.jsp?username=<%=username%>"><img src="image/new3.jpg" width="100%" height="320" /></a>
                    <a name="i" href="http://localhost:8080/ZY2018003011533/lamps.jsp?username=<%=username%>"><img src="image/new2.jpg" width="100%" height="320" /></a>
                    <a name="i" href="http://localhost:8080/ZY2018003011533/toys.jsp?username=<%=username%>"><img src="image/new5.jpg" width="100%" height="320" /></a>
                    <a name="i" href="http://localhost:8080/ZY2018003011533/foodFresh.jsp?username=<%=username%>"><img src="image/new1.webp" width="100%" height="320" /></a>


                    <!--伴随移动的小圆点-->
                    <div id="buttons">
                        <span index="1" class="on"></span>
                        <span index="2"></span>
                        <span index="3"></span>
                        <span index="4"></span>
                        <span index="5"></span>
                    </div>

                </div>

                <!--用于登录的模块-->
                <div id="login2">

                    <%
                        if (username!=null&&!username.equals("")&&!username.equals("null")){

                            System.out.println(username);
                    %>

                    <p id="loginSuc" class="font2" style="font-size: 35px;text-align: center;margin-top: 195px;color: orange;font-weight: bolder" ><%=username%>,你好！</p>

                    <%

                        }else {
                          %>
                    <p class="font2" style="font-size: 25px;font-weight:bolder;text-align: center;margin-top: 195px;color: orange">请您先登录:</p>
                    <form id="forLogin" name="dl" action="http://localhost:8080/ZY2018003011533/login.jsp" method="post">

                        <input type="submit" name="denglu" id="forLogin2" class="new_button"  style="margin-top: 25px;margin-left: 150px" value="登陆">
                    </form>

<%
                        }
                    %>

                </div>
            </div>
        </td>
    </tr>
</table>

<!--有好货-->
<table class="top_box" width="1206" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    <tr>
        <td>&nbsp;</td>
        <td width="920" valign="top">

            <table width="100%" height="50" border="0" style="margin-left:0;">
                <tr>
                    <p style="background-color: #ebebeb;height: 8px">&nbsp;</p><!--用于模块之间的分割-->
                    <td align="left" valign="bottom" style="font-size:22px;"><font class="font1">有好货</font></td>
                </tr>
            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:0;">
                <tr>
                    <td width="40%">
                        <table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
                            <tr><td><a href="http://localhost:8080/ZY2018003011533/beauty.jsp?username=<%=username%>"><img src="image/money.png" width="400" height="420" border="0" style="background-image:url('image/back6.png')"/></a></td></tr>
                            <tr><td height="40" valign="bottom" style="padding-left:20px; font-size:20px; color: #333333"><a href="http://localhost:8080/ZY2018003011533/beauty.jsp?username=<%=username%>">珠宝饰品</a></td></tr>
                            <tr><td height="40" valign="middle" style="padding-left:20px; font-size:14px; color: #7a7a7a">尽显雍容华贵</td></tr>
                        </table>
                    </td>
                    <td width="54%" align="center">
                        <table width="100%" border="0">

                            <tr>
                                <td width="49%" align="center">
                                    <!--手机 -->
                                    <table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style="margin:0px 0px 8px 0px;">
                                        <tr>
                                            <td align="center"><a href="http://localhost:8080/ZY2018003011533/lamps.jsp?username=<%=username%>"><img name="news" src="image/5G.png" width="100%" height="172" alt="" border="0" style="background-image:url('image/back4.png')"/></a></td>
                                        </tr>
                                        <tr><td height="32" align="left" valign="bottom" style="padding-left:10px; font-size:18px; color: #333333"><a href="http://localhost:8080/ZY2018003011533/lamps.jsp?username=<%=username%>">手机数码</a></td></tr>
                                        <tr><td height="32" align="left" valign="middle" style="padding-left:10px; font-size:14px; color: #7a7a7a">7元/天买5G手机</td></tr>
                                    </table>
                                </td>
                                <td width="49%" align="center">
                                    <!--食品 -->
                                    <table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style="margin:0px 0px 8px 0px;">
                                        <tr>
                                            <td align="center"><a href="http://localhost:8080/ZY2018003011533/foodFresh.jsp?username=<%=username%>" style=""><img name="news" src="image/food.png" width="100%" height="172" alt="" border="0" style="background-image:url('css/foodback.png')" /></a></td>
                                        </tr>
                                        <tr><td height="32" align="left" valign="bottom" style="padding-left:10px; font-size:18px; color: #333333;"><a href="http://localhost:8080/ZY2018003011533/foodFresh.jsp?username=<%=username%>">食品生鲜</a></td></tr>
                                        <tr><td height="32" align="left" valign="middle" style="padding-left:10px; font-size:14px; color: #7a7a7a">每满300减30</td></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td width="49%" align="center">
                                    <!--男装 -->
                                    <table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style="margin:0px 0px 8px 0px;">
                                        <tr>
                                            <td align="center"><a href="http://localhost:8080/ZY2018003011533/beauty.jsp?username=<%=username%>"><img name="news" src="image/man.png" width="100%" height="172" alt="" border="0" style="background-image:url('image/back3.png')" /></a></td>
                                        </tr>
                                        <tr><td height="32" align="left" valign="bottom" style="padding-left:10px; font-size:18px; color: #333333"><a href="http://localhost:8080/ZY2018003011533/beauty.jsp?username=<%=username%>">男装主会场</a></td></tr>
                                        <tr><td height="32" align="left" valign="middle" style="padding-left:10px; font-size:14px; color: #7a7a7a">大牌1000减400</td></tr>
                                    </table>
                                </td>
                                <td width="49%" align="center">
                                    <!--女装 -->
                                    <table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style="margin:0px 0px 8px 0px;">
                                        <tr>
                                            <td align="center"><a href="http://localhost:8080/ZY2018003011533/toys.jsp?username=<%=username%>"><img name="news" src="image/woman.png" width="100%" height="172" alt="" border="0" style="background-image:url('image/back2.png')"/></a></td>
                                        </tr>
                                        <tr><td height="32" align="left" valign="bottom" style="padding-left:10px; font-size:18px; color: #333333"><a href="http://localhost:8080/ZY2018003011533/toys.jsp?username=<%=username%>">女装主会场</a></td></tr>
                                        <tr><td height="32" align="left" valign="middle" style="padding-left:10px; font-size:14px; color: #7a7a7a">抢百元神券</td></tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>

        <!--商品排行榜 -->
        <td width="270" valign="top">


            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-left:5%;">
                <tr>
                    <p style="background-color: #ebebeb;height: 8px">&nbsp;</p><!--用于模块之间的分割-->
                    <td align="left" height="50" style="font-size:22px;" valign="bottom" class="font2">近日排行榜</td>
                    <td align="center" valign="bottom">
                        <ul class="tabs">
                            <li><a name="#tab1">精品促销</a></li>
                            <li><a name="#tab2">热卖单品</a></li>
                        </ul>
                    </td>
                </tr>
            </table>
            <div id="tab1" class="tab_content">
                <table width="95%" border="0" cellpadding="0" cellspacing="0" style="position:relative; margin-top: 2px;margin-left:5%;">

                    <script>
                        var num = 1;
                        var nameArr = new Array("时尚女装","潮流男装","数码电器","家居百货","品质母婴","食品饮料","男女鞋品");
                        var dnumArr = new Array("image/fashionW.jpg","image/fashionM.jpg","image/dian.jpeg","image/baihuo.jpg","image/mother.webp","image/foodAnddrink.jpg","image/kt5.jpg");
                        for(var i=0; i<nameArr.length; i++){
                            //用document写html元素
                            document.write('<tr height="43">');
                            document.write('<td width="26" align="center" class="f_td">'+(num++)+'</td>');
                            document.write('<td width="75" align="left" class="f_td"><a href="#">'+nameArr[i]+'</td>');
                            document.write('<td width="90" align="right" class="f_td"><img width="90" align="right" class="img" src="'+dnumArr[i]+'"></img></td></tr>');
                        }
                    </script>

                </table>

            </div>
            <div id="tab2" class="tab_content">
                <table width="95%" border="0" cellpadding="0" cellspacing="0" style="position:relative; margin-top: 2px;margin-left:5%;">
                    <script>
                        var num = 1;
                        var nameArr = new Array("客厅灯","床垫","电脑椅","收纳箱","椅子","沙发","茶几");
                        var dnumArr = new Array("免费上门安装","天然乳胶床垫","科学护腰久坐不累","结实耐用，退换无忧","简约北欧风","意大利进口油蜡皮","实木茶几，品质保障");
                        for(var i=0; i < nameArr.length; i++){

                            //利用document写html元素
                            document.write('<tr height="43">');
                            document.write('<td width="26" align="center" class="f_td">'+(num++)+'</td>');
                            document.write('<td width="75" align="left" class="f_td"><a class="s">'+nameArr[i]+'</td>');
                            document.write('<td width="90" align="right" class="f_td">'+dnumArr[i]+'</td></tr>');
                        }
                    </script>
                </table>
            </div>


            <!--即将开售-->
            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-left:5%;">
                <tr><td align="left" height="50" style="font-size:22px;" valign="bottom" class="font3">即将开售：</td></tr>
            </table>
            <div class="scroll">
                <ul class="list">
                    <!--javascript:void(0), 仅仅表示一个死链接。-->
                    <li><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'" >华为MateBook D系列即将开售</a></li>
                    <li><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">微软Surfac系列笔记本正式开售</a></li>
                    <li><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">OPPO新款手机即将上市，售价2499元起！</a></li>
                    <li><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">荣耀20iAAP E特别版正式开售</a></li>
                    <li><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">Charles&Keith正价美包美鞋热卖</a></li>
                    <li><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">丰田卡罗拉GRport信息曝光</a></li>
                </ul>
            </div>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>

<!--浮窗弹出表示商品尚未发售-->
<div id="light" class="white_content"><p align="center" class="font3" style="font-size: 55px;margin-top: 125px">商品尚未发售敬请期待！</p>
    <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><p align="center" style="color: #66CCFF;font-size: 20px;margin-top: 55px">点这里关闭本窗口</p></a></div>
<div id="fade" class="black_overlay"></div>

<!--实现商品图片不断滚动的过程-->
<div id="demo" class="top_box" style="overflow: hidden; width: 1200px; height: 264px">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td id="demo1"><p style="height: 8px;background-color: #ebebeb">&nbsp;</p><!--用于模块之间的分割--><table cellpadding="0" cellspacing="0">
                <tr>
                    <td width="191" height="200" style="padding-right:10px"><a href="javascript:void(0)"><img src="image/4.jpg" width="191" height="200" border="0" /></a>
                        <div class="title"><a href="javascript:void(0)">怦然心动</a></div>
                        <div class="content">柔软顺滑</div></td>
                    <td width="191" height="200" style="padding-right:10px"><a href="javascript:void(0)"><img src="image/5.jpg" width="191" height="200" border="0" /></a>
                        <div class="title"><a href="javascript:void(0)">小萌萌睡衣形象店</a></div>
                        <div class="content">全店满减折扣</div></td>
                    <td width="191" height="200" style="padding-right:10px"><a href="javascript:void(0)"><img src="image/6.jpg" width="191" height="200" border="0" /></a>
                        <div class="title"><a href="javascript:void(0)">华为Mate30</a></div>
                        <div class="content">活动价：￥3999</div></td>
                    <td width="191" height="200" style="padding-right:10px"><a href="javascript:void(0)"><img src="image/7.png" width="191" height="200" border="0" /></a>
                        <div class="title"><a href="javascript:void(0)">OPPO Reno Ace</a></div>
                        <div class="content">只售￥3199</div></td>
                    <td width="191" height="200" style="padding-right:10px"><a href="javascript:void(0)"><img src="image/8.jpg" width="191" height="200" border="0" /></a>
                        <div class="title"><a href="javascript:void(0)">润玉收藏</a></div>
                        <div class="content">和田玉营收批发平台</div></td>
                    <td width="191" height="200" style="padding-right:10px"><a href="javascript:void(0)"><img src="image/9.jpg" width="191" height="200" border="0" /></a>
                        <div class="title"><a href="javascript:void(0)">俄罗斯进口</a></div>
                        <div class="content">kdv巧克力kpokaht紫皮糖500g正品年货喜糖果零食品包邮</div></td>

                    <td width="191" height="200" style="padding-right:10px"><a href="javascript:void(0)"><img src="image/1.jpg" width="191" height="200" border="0" /></a>
                        <div class="title"><a href="javascript:void(0)">促销精品：5折起</a></div>
                        <div class="content">新品随你挑</div></td>
                    <td width="191" height="200" style="padding-right:10px"><a href="javascript:void(0)"><img src="image/2.jpg" width="191" height="200" border="0" /></a>
                        <div class="title"><a href="javascript:void(0)">潮店新品</a></div>
                        <div class="content">全场包邮，潮到震撼</div></td>
                    <td width="191" height="200" style="padding-right:10px"><a href="javascript:void(0)"><img src="image/3.jpg" width="191" height="200" border="0" /></a>
                        <div class="title"><a href="javascript:void(0)">全程品牌团</a></div>
                        <div class="content">冬季新品预售</div></td>
                </tr>
            </table></td>
            <td id="demo2"></td>
        </tr>
    </table>
</div>

<!--利用Marquee方法图片的滚动-->
<script type="text/javascript">
    var speed=30;
    demo2.innerHTML=demo1.innerHTML;
    function Marquee(){
        if(demo2.offsetWidth-demo.scrollLeft<=0)
            demo.scrollLeft-=demo1.offsetWidth;
        else{
            demo.scrollLeft++;
        }
    }
    var MyMar=setInterval(Marquee,speed)
    demo.onmouseover=function(){
        clearInterval(MyMar);
    }
    demo.onmouseout=function(){
        MyMar=setInterval(Marquee,speed);
    }
</script>

<div align="center">
    <img src="images/call2.png" border="0" usemap="#Map" />
    <!--图片的热键-->
    <map name="Map" id="Map"><area shape="rect" coords="5,7,60,26" href="javascript:void(0)"/>
    </map>
</div>

<!--悬浮右侧的热键-->
<!--  position: fixed; /*滚动时可以固定在屏幕上*/ -->
<table width="81" border="0" cellspacing="0" cellpadding="0" style="margin-top: -1399px;position: fixed;margin-left: 5px">
    <tr>
        <td><img src="images/ra_01.png" width="81" height="12" /></td>
    </tr>
    <tr>
        <td align="center" background="images/ra_03.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="65" align="center" valign="top"><a href="#007"><img src="image/shouye.png" width="59" height="63" border="0"/></a></td>
            </tr>

            <tr>
                <td height="15" align="center" valign="top"></td>
            </tr>
            <tr>
                <td height="85" align="center" valign="top"><p class="font4">客服热线：</p><br><img src="image/kefu2.png" width="59" height="81" border="0"/></td>
            </tr>
        </table> </td>
    </tr>
    <tr>
        <td><img src="images/ra_02.png" width="81" height="11" /></td>
    </tr>
</table>
</body>
