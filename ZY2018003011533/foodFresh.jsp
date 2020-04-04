<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/21
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script src="js/chk.js" language="javascript"></script>
<link rel="stylesheet" href="css/style.css" />
<script src="js/jquery-3.4.1.js"></script>

<head>
    <meta charset="UTF-8">
    <title>美食生鲜</title>
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
    </style>
</head>

<body>

<%
    String username = request.getParameter("username");
%>

<table class="top_box" width="1212" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
    <!--log标志-->
    <tr class="log">
        <td style="background-color: transparent;cursor: pointer" width="98" height="98"  onclick="javascript:void(0)"><img src="images/taobao.gif"></td>
        <td width="260" height="28" onclick=""><img src="image/prize1.png" style="width: 198px;height: 98px"/></td>
        <td width="260" height="28" onclick=""><img src="image/prize2.png" style="width: 198px;height: 98px"/></td>
        <td width="260" height="28" onclick=""><img src="image/prize3.png" style="width: 198px;height: 98px"/></td>
        <td width="260" height="28" ><a href="<%
        if (username!=null&&!username.equals("null")&&!username.equals("")){
            %>ShowCar.jsp?username=<%=username%>
        <%}else {
            %>

       javascript:alert('请您先登陆！');

            <%
        }


        %>"> <img src="image/car_every.png" style="width: 198px;height: 98px"/></a></td>
    </tr>
    <tr>
        <td colspan="6" height="1" bgcolor="#e5e5e5"></td>
    </tr>
    <tr>
        <td colspan="6" align="center" valign="top">
            <!--导航栏-->
            <div>
                <script language="JavaScript" type="text/javascript">
                    function showadv(par,par2,par3)
                    {
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
                        document.getElementById(par2).style.color = "#ffffff";
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
                                    <td width="166" height="42" align="center" id="a0bg"><span id="a0color" onmouseover="showadv('a0','a0color','a0bg')"><a href="index.jsp?username=<%=username%>" name="007"><font color="#FA4A05">首页</font></a></span></td>
                                    <td width="1"><img src="images/i14.gif" width="1" height="25" /></td>
                                    <td id="a1bg" align="center" width="166"><span id="a1color" onmouseover="showadv('a1','a1color','a1bg')"><a href="beauty.jsp?username=<%=username%>"">美妆个护</a></span></td>
                                    <td width="1"><img src="images/i14.gif" width="1" height="25" /></td>
                                    <td id="a2bg" align="center" width="166"><span id="a2color" onmouseover="showadv('a2','a2color','a2bg')"><a href="javascript:void(0)">美食生鲜</a></span></td>
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

                    <!--浮窗弹出表示模块尚未开通-->
                    <div id="light2" class="white_content"><p align="center" class="font2" style="font-size: 55px;margin-top: 125px">模块尚未开通敬请期待！</p>
                        <a href = "javascript:void(0)" onclick = "document.getElementById('light2').style.display='none';document.getElementById('fade2').style.display='none'"><p align="center" style="color: #66CCFF;font-size: 20px;margin-top: 55px">点这里关闭本窗口</p></a></div>
                    <div id="fade2" class="black_overlay"></div>
                    <tr>
                        <td><table width="100%" height="41" cellpadding="0" cellspacing="0" id="a0"　border="0">
                            <tr>
                                <td align="left" style="padding-left:12px">欢迎来到淘宝网，好货应有尽有</td>
                            </tr>
                        </table>
                            <table id="a1" style="DISPLAY: none" height="41" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td  style="padding-left:97px" align="left"><ul class="i02w">
                                        <li><a href="javascript:void(0)">时髦女装</a></li>
                                        <li><a href="javascript:void (0)">潮男冬装</a> </li>
                                        <li><a href="javascript:void (0)">运动户外</a></li>
                                    </ul></td>
                                </tr>
                            </table>
                            <table id="a2" style="DISPLAY: none" height="41" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td style="padding-left:292px" align="left"><ul class="i02w">
                                        <li><a href="javascript:void(0)">馋嘴零食</a></li>
                                        <li><a href="javascript:void(0)">速食粮油</a></li>
                                        <li><a href="javascript:void(0)">海产生鲜</a></li>
                                    </ul></td>
                                </tr>
                            </table>
                            <table id="a3" style="DISPLAY: none" height="41" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td style="padding-left:456px"><ul class="i02w">
                                        <!--javascript:void(0)表示一个死链接-->
                                        <li><a href="javascript:void(0)">爆款灯具</a></li>
                                        <li><a href="javascript:void(0)">电工五金</a></li>
                                        <li><a href="javascript:void(0)">智能家居</a></li>
                                    </ul></td>
                                </tr>
                            </table>
                            <table id="a4" style="DISPLAY: none" height="41" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td style="padding-left:636px"><ul class="i02w">
                                        <li><a href="javascript:void(0)">潮流玩具</a></li>
                                        <li><a href="javascript:void(0)">时尚童鞋</a></li>
                                        <li><a href="javascript:void(0)">童装上新</a></li>
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
            <!-- ----------------------------------- -->
        </td>
    </tr>
    <tr>
        <td colspan="6"  bgcolor="#e5e5e5" valign="top">
            <div class="banner" style="width: 100%">
                <div width="100%" style="height: 204px; background: url('image/foodFresh.jpg') no-repeat center;background-size: 100% 204px">
                </div>
            </div>
        </td>
    </tr>
</table>


<!--************************************************************购买食品***************************************************************************************************-->

<div class="w_1200" style="height:1px; background-color: #CCCCCC"></div>
<!-- 列表-->



<table class="w_1200 right_table" width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr><td align="left" style="font-size:22px; padding-left:0px;">热门推荐</td></tr>
</table>

<div class="w_1200" style="">

    <!--显示商品资料 -->
    <table width="32%" border="0" cellspacing="0" cellpadding="0" style="float:left; border: 1px solid #dadada; margin-right: 8px;margin-bottom: 8px">
        <tr>
            <td width="52%" align="center" valign="middle"><a href="javascript:void(0)"><img name="news" src="Production/P6.jpg" width="100%" height="260" alt="" border="0" style=" border-color:#CCCCCC; margin-top:0px; margin-left:0px; margin-bottom:0px; margin-right:0px;" /></a></td>
            <td align="left" valign="top">
                <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 14px">
                    <tr>
                        <td align="left" height="68" colspan="2" style="font-size:20px; padding-left: 0px;"><a href="javascript:void(0)">鲜活大闸蟹</a></td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">品牌：</td>
                        <td>紫澄</td>
                    </tr>
                    <tr>
                        <td width="50" height="35" align="left" valign="middle" style="">简介：</td>
                        <td >12只鲜活大闸蟹公5两全母4两特大现货海鲜水产阳澄湖协会清水螃蟹</td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">价格：</td>
                        <td>RMB:388.00</td>
                    </tr>
                    <tr>
                        <td height="35" colspan="2" align="left" valign="middle" style="padding-left:2%;">
                            <!--加入购物车！！！！！！！！！！！！！！！-->
                            <a href="javascript:void(0)" onclick="
                                <%
                                if (username!=null&&!username.equals("null")&&!username.equals("")){
                                    %>
                                    production6();
                                    alert('您已将货物成功加入购物车！');
                                <%
                                }else {
                                    %>
                                    alert('请您先登录！')
                                <%
                                }
                            %>
                                    "><img src="image/ShoppingCar.jpg"  border="0" alt="购买" style="width: 32px;height: 32px"/></a>

                            <!--jsp逻辑-->
                            <form method="post" name="buybuybuy" action="http://localhost:8080/ZY2018003011533/AddShoppingCarServlet" style="display: none">
                                <input type="text" value="<%=username%>" name="name">
                                <input type="text" value="6" name="ID">
                                <input type="submit" name="" id="production6">
                            </form>
                            &nbsp;
                            <!-- 宝贝的详细介绍 -->
                            <img src="images/show_icon.png" alt="介绍" border="0" style="cursor:pointer;" onclick="javascript:window.open('introduce/introduce6.html','new','height=640,width=690,top=100,left=400');"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="32%" border="0" cellspacing="0" cellpadding="0" style="float:left; border: 1px solid #dadada; margin-right: 8px;margin-bottom: 8px">
        <tr>
            <td width="52%" align="center" valign="middle"><a href="javascript:void(0)"><img name="news" src="Production/P7.jpg" width="100%" height="260" alt="" border="0" style=" border-color:#CCCCCC; margin-top:0px; margin-left:0px; margin-bottom:0px; margin-right:0px;" /></a></td>
            <td align="left" valign="top">
                <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 14px">
                    <tr>
                        <td align="left" height="68" colspan="2" style="font-size:20px; padding-left: 0px;"><a href="javascript:void(0)">螺丝粉酸辣</a></td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">品牌：</td>
                        <td>好欢螺</td>
                    </tr>
                    <tr>
                        <td width="50" height="35" align="left" valign="middle" style="">简介：</td>
                        <td >好欢螺螺蛳粉柳州特产美食方便面速食300g*5袋螺丝粉酸辣粉</td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">价格：</td>
                        <td>RMB:65.00</td>
                    </tr>
                    <tr>
                        <td height="35" colspan="2" align="left" valign="middle" style="padding-left:2%;">
                            <!--加入购物车！！！！！！！！！！！！！！！-->
                            <a href="javascript:void(0)" onclick="
                                <%
                                if (username!=null&&!username.equals("null")&&!username.equals("")){
                                    %>
                                    production7();
                                    alert('您已将货物成功加入购物车！');
                                <%
                                }else {
                                    %>
                                    alert('请您先登录！')
                                <%
                                }
                            %>
                                    " ><img src="image/ShoppingCar.jpg"  border="0" alt="购买" style="width: 32px;height: 32px"/></a>

                            <!--jsp逻辑-->
                            <form method="post" name="buybuybuy" action="http://localhost:8080/ZY2018003011533/AddShoppingCarServlet" style="display: none">
                                <input type="text" value="<%=username%>" name="name">
                                <input type="text" value="7" name="ID">
                                <input type="submit" name="" id="production7">
                            </form>
                            &nbsp;
                            <!-- 宝贝的详细介绍 -->
                            <img src="images/show_icon.png" alt="介绍" border="0" style="cursor:pointer;" onclick="javascript:window.open('introduce/introduce7.html','new','height=640,width=690,top=100,left=400');"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="32%" border="0" cellspacing="0" cellpadding="0" style="float:left; border: 1px solid #dadada; margin-right: 8px;margin-bottom: 8px">
        <tr>
            <td width="52%" align="center" valign="middle"><a href="javascript:void(0)"><img name="news" src="Production/P8.jpg" width="100%" height="260" alt="" border="0" style=" border-color:#CCCCCC; margin-top:0px; margin-left:0px; margin-bottom:0px; margin-right:0px;" /></a></td>
            <td align="left" valign="top">
                <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 14px">
                    <tr>
                        <td align="left" height="68" colspan="2" style="font-size:20px; padding-left: 0px;"><a href="javascript:void(0)">突尼斯石榴</a></td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">品牌：</td>
                        <td>甘福园</td>
                    </tr>
                    <tr>
                        <td width="50" height="35" align="left" valign="middle" style="">简介：</td>
                        <td >甘福园 会理突尼斯软籽石榴6斤新鲜当季水果甜红应季特产整箱包邮</td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">价格：</td>
                        <td>RMB:54.00</td>
                    </tr>
                    <tr>
                        <td height="35" colspan="2" align="left" valign="middle" style="padding-left:2%;">
                            <!--加入购物车！！！！！！！！！！！！！！！-->
                            <a href="javascript:void(0)" onclick="
                                <%
                                if (username!=null&&!username.equals("null")&&!username.equals("")){
                                    %>
                                    production8();
                                    alert('您已将货物成功加入购物车！');
                                <%
                                }else {
                                    %>
                                    alert('请您先登录！')
                                <%
                                }
                            %>
                                    "><img src="image/ShoppingCar.jpg"  border="0" alt="购买" style="width: 32px;height: 32px"/></a>

                            <!--jsp逻辑-->
                            <form method="post" name="buybuybuy" action="http://localhost:8080/ZY2018003011533/AddShoppingCarServlet" style="display: none">
                                <input type="text" value="<%=username%>" name="name">
                                <input type="text" value="8" name="ID">
                                <input type="submit" name="" id="production8">
                            </form>
                            &nbsp;
                            <!-- 宝贝的详细介绍 -->
                            <img src="images/show_icon.png" alt="介绍" border="0" style="cursor:pointer;" onclick="javascript:window.open('introduce/introduce8.html','new','height=640,width=690,top=100,left=400');"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="32%" border="0" cellspacing="0" cellpadding="0" style="float:left; border: 1px solid #dadada; margin-right: 8px;margin-bottom: 8px">
        <tr>
            <td width="52%" align="center" valign="middle"><a href="javascript:void(0)"><img name="news" src="Production/P9.jpg" width="100%" height="260" alt="" border="0" style=" border-color:#CCCCCC; margin-top:0px; margin-left:0px; margin-bottom:0px; margin-right:0px;" /></a></td>
            <td align="left" valign="top">
                <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 14px">
                    <tr>
                        <td align="left" height="68" colspan="2" style="font-size:20px; padding-left: 0px;"><a href="javascript:void(0)">红富士苹果</a></td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">品牌：</td>
                        <td>果聚匠心</td>
                    </tr>
                    <tr>
                        <td width="50" height="35" align="left" valign="middle" style="">简介：</td>
                        <td >苹果鲜新10斤带箱水果新鲜丑苹果冰糖心当季陕西红富士苹果整箱</td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">价格：</td>
                        <td>RMB:29.00</td>
                    </tr>
                    <tr>
                        <td height="35" colspan="2" align="left" valign="middle" style="padding-left:2%;">
                            <!--加入购物车！！！！！！！！！！！！！！！-->
                            <a href="javascript:void(0)" onclick="
                                <%
                                if (username!=null&&!username.equals("null")&&!username.equals("")){
                                    %>
                                    production9();
                                    alert('您已将货物成功加入购物车！');
                                <%
                                }else {
                                    %>
                                    alert('请您先登录！')
                                <%
                                }
                            %>
                                    " ><img src="image/ShoppingCar.jpg"  border="0" alt="购买" style="width: 32px;height: 32px"/></a>

                            <!--jsp逻辑-->
                            <form method="post" name="buybuybuy" action="http://localhost:8080/ZY2018003011533/AddShoppingCarServlet" style="display: none">
                                <input type="text" value="<%=username%>" name="name">
                                <input type="text" value="9" name="ID">
                                <input type="submit" name="" id="production9">
                            </form>
                            &nbsp;
                            <!-- 宝贝的详细介绍 -->
                            <img src="images/show_icon.png" alt="介绍" border="0" style="cursor:pointer;" onclick="javascript:window.open('introduce/introduce9.html','new','height=640,width=690,top=100,left=400');"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="32%" border="0" cellspacing="0" cellpadding="0" style="float:left; border: 1px solid #dadada; margin-right: 8px;margin-bottom: 8px">
        <tr>
            <td width="52%" align="center" valign="middle"><a href="javascript:void(0)"><img name="news" src="Production/P10.jpg" width="100%" height="260" alt="" border="0" style=" border-color:#CCCCCC; margin-top:0px; margin-left:0px; margin-bottom:0px; margin-right:0px;" /></a></td>
            <td align="left" valign="top">
                <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 14px">
                    <tr>
                        <td align="left" height="68" colspan="2" style="font-size:20px; padding-left: 0px;"><a href="javascript:void(0)">新鲜驴肉</a></td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">品牌：</td>
                        <td>绝膳</td>
                    </tr>
                    <tr>
                        <td width="50" height="35" align="left" valign="middle" style="">简介：</td>
                        <td >新鲜驴肉现杀山东带皮生驴肉整只批500g五斤10斤真空包邮农家正宗</td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">价格：</td>
                        <td>RMB:208.00</td>
                    </tr>
                    <tr>
                        <td height="35" colspan="2" align="left" valign="middle" style="padding-left:2%;">
                            <!--加入购物车！！！！！！！！！！！！！！！-->
                            <a href="javascript:void(0)" onclick="
                                <%
                                if (username!=null&&!username.equals("null")&&!username.equals("")){
                                    %>
                                    production10();
                                    alert('您已将货物成功加入购物车！');
                                <%
                                }else {
                                    %>
                                    alert('请您先登录！')
                                <%
                                }
                            %>
                                    "><img src="image/ShoppingCar.jpg"  border="0" alt="购买" style="width: 32px;height: 32px"/></a>

                            <!--jsp逻辑-->
                            <form method="post" name="buybuybuy" action="http://localhost:8080/ZY2018003011533/AddShoppingCarServlet" style="display: none">
                                <input type="text" value="<%=username%>" name="name">
                                <input type="text" value="10" name="ID">
                                <input type="submit" name="" id="production10">
                            </form>&nbsp;

                            <!-- 宝贝的详细介绍 -->
                            <img src="images/show_icon.png" alt="介绍" border="0" style="cursor:pointer;" onclick="javascript:window.open('introduce/introduce10.html','new','height=640,width=690,top=100,left=400');"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="32%" border="0" cellspacing="0" cellpadding="0" style="float:left; border: 1px solid #dadada; margin-right: 8px;margin-bottom: 8px">
        <tr>
            <td width="52%" align="center" valign="middle"><a href="javascript:void(0)"><img name="news" src="Production/P11.jpg" width="100%" height="260" alt="" border="0" style=" border-color:#CCCCCC; margin-top:0px; margin-left:0px; margin-bottom:0px; margin-right:0px;" /></a></td>
            <td align="left" valign="top">
                <table width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 14px">
                    <tr>
                        <td align="left" height="68" colspan="2" style="font-size:20px; padding-left: 0px;"><a href="javascript:void(0)">小吃坚果</a></td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">品牌：</td>
                        <td>良品铺子</td>
                    </tr>
                    <tr>
                        <td width="50" height="35" align="left" valign="middle" style="">简介：</td>
                        <td >良品铺子-零食大礼包一箱整箱小吃坚果休闲食品充饥夜宵散装</td>
                    </tr>
                    <tr>
                        <td height="35" align="left" valign="middle">价格：</td>
                        <td>RMB:59.00</td>
                    </tr>
                    <tr>
                        <td height="35" colspan="2" align="left" valign="middle" style="padding-left:2%;">
                            <!--加入购物车！！！！！！！！！！！！！！！-->
                            <a href="javascript:void(0)" onclick="
                                <%
                                if (username!=null&&!username.equals("null")&&!username.equals("")){
                                    %>
                                    production11();
                                    alert('您已将货物成功加入购物车！');
                                <%
                                }else {
                                    %>
                                    alert('请您先登录！')
                                <%
                                }
                            %>
                                    " ><img src="image/ShoppingCar.jpg"  border="0" alt="购买" style="width: 32px;height: 32px"/></a>

                            <!--jsp逻辑-->
                            <form method="post" name="buybuybuy" action="http://localhost:8080/ZY2018003011533/AddShoppingCarServlet" style="display: none">
                                <input type="text" value="<%=username%>" name="name">
                                <input type="text" value="11" name="ID">
                                <input type="submit" name="" id="production11">
                            </form>
                            &nbsp;
                            <!-- 宝贝的详细介绍 -->
                            <img src="images/show_icon.png" alt="介绍" border="0" style="cursor:pointer;" onclick="javascript:window.open('introduce/introduce11.html','new','height=640,width=690,top=100,left=400');"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</div>


<div align="center">
    <img src="images/call2.png" border="0" usemap="#Map" />
    <!--图片的热键-->
    <map name="Map" id="Map"><area shape="rect" coords="5,7,60,26" href="javascript:void(0)"/>
    </map>
</div>

<script>
    function production6() {

        // alert("ok");

        $("#production6").click();



    }
    function production7() {
        $("#production7").click();
    }
    function production8() {
        $("#production8").click();
    }
    function production9() {
        $("#production9").click();
    }
    function production10() {
        $("#production10").click();
    }
    function production11() {
        $("#production11").click();
    }
</script>


</body>
</html>
