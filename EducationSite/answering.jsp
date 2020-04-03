<%@ page import="java.util.List" %>
<%@ page import="com.education.User.Reply_content" %>
<%@ page import="com.education.dao.ReviewDao" %>
<%@ page import="com.education.dao.ReplyDao" %>
<%@ page import="com.education.User.ReviewInformation" pageEncoding="UTF-8" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/1/30
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String name = (String) session.getAttribute("username_msg");

    System.out.println("留言的是"+name);

    if (name==null){
        %>
<script>
    alert("请您先登陆！")
</script>

<%
    }else {

//        System.out.println("fuck!");


        %>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>留言板</title>
    <link type="text/css" href="CSS文件/Liuyan.css" rel="stylesheet">
    <style type="text/css">
        #Di0{
            width: 100%;
            height: 560px;
            background-color: #FF9900;
        }
        #Di1{
            width: 25%;
            height: 560px;
            float: left;
            background-color: #cad9ea;
            background-image: url("imgs/back00.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        #Di2{
            width: 75%;
            height: 560px;
            background-color: #cad9ea;
            float: right;
            background-image: url("CSS文件/Photos/liuyan.jpg");
            background-size: 100% 560px;/* 第一个值指定图片的宽度，第二个值指定图片的高度 */


            overflow:auto;/*使div出现下拉框*/
        }

        #result{
            font-weight: bold;
            font-family: 隶书;
            font-size: 20px;

            text-align: center;

            background-color:transparent;/*background-color设置为透明的方法*/
            padding: 0;
            margin: 0;

            /*//不能改变大小*/
            resize:none;

        }

    </style>
    <!--引入jQuery-->
    <script language="JavaScript"  src="Jquery/jquery-3.4.1.js"></script>
    <style>
        .font1 {
            font-size: 12px;
            text-shadow: 5px 5px 5px black, 0px 0px 2px black; /* 没错这里设置了两个 shadow */
            color: white;

            font-weight: bolder;
            font-family: "宋体", "隶书";

        }
    </style>
</head>
<body>

<div id="Di0" >
    <!--左侧提交留言的区域-->
    <div id="Di1">
        <h2 class="hh">温馨提示：</h2>
        <p class="ppp">请勿发布涉及政治、广告、营销、翻墙、违反国家法律法规等内容.请认真对待以上内容，如有违反必遭严处。 </p>

        <h2 class="hh">留言板：</h2>
        <!-- 多行文本输入框 -->
        <form class="forms">
            <textarea class="text_write" name="what" rows="9" cols="22px" id="message" style="margin-top: 0" ></textarea><br>
            <input  id="yes" type="button" onclick="f()" name="button" value="提交留言" class="new_button">
            <input id="yes3" type="reset" value="重新输入" class="new_button"/>
        </form>

        <form style="display: none" method="get" action="write_review.jsp?name=<%=name%>">
            <input id="review_what" name="review_what" type="text" value="">
            <input id="sumbittttt" type="submit">
        </form>

    </div>

    <!--右侧回复留言的区域-->
    <div id="Di2">
        <!---->
        <div id="white">
            <font id="this" style="text-align: left"></font>
            <%
                List<ReviewInformation> reviewInformations = ReviewDao.reviewWhat();
                List<Reply_content> replyInformations = ReplyDao.replyWhat();

                if (reviewInformations != null && reviewInformations.size() > 0) {
                    for (int i = reviewInformations.size() - 1; i >= 0; i--) {
                        ReviewInformation message = reviewInformations.get(i);
            %>

            <p class="font4" style="font-size: 18px">发布人：<%=message.getName()%>时间：<%=message.getTime()%></p>
            <textarea  readonly="readonly" style='text-shadow: 5px 5px 5px black, 0px 0px 2px red, 2px 2px 3px green;font-size: 20px;text-align: center; resize:none;background:transparent'><%=message.getReview()%></textarea>
            <input type='button' onclick='write_reply(<%=message.getID()%>)' value='回复' class='new_button' name='ss' id='<%=message.getID()%>'><br>
            <%
            for (int j =0;j<replyInformations.size();j++){
                Reply_content reply_content = replyInformations.get(j);
                if (reply_content.getId()==message.getID()){
                    %>
                    <p class="font1" style="font-size: 15px"><%=reply_content.getReply_name()%>评论:<%=reply_content.getReply_review()%></p>
            <%
                }
            }
            %>

            <br><br>

            <%
                }}
            %>
        </div>

        <form style="display: none" method="get" action="write_sql.jsp?name=<%=name%>">
            <input id="reply_id" name="reply_id" type="text" value="">
            <input id="reply_what" name="reply_what" type="text" value="">
            <input id="sumbittt" type="submit">
        </form>

    </div>
</div>

<!--    对键盘回车键的监听！   -->
<script type="text/javascript" language=JavaScript>
    document.onkeydown=function(event){
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode==13){ // enter 键
            //要做的事情
            f();
        }
    };

    /*
    提交留言
    */
    function f() {

        var yes;

        yes = confirm("你确定要提交留言吗？");

        if (yes){

            var message = document.getElementById('message');//获得留言内容
            var result = message.value.replace(/\s+/g,"");
            message.value = "";

            if (result!=null&&result!==""){

                document.getElementById("review_what").value = result;

                $("#sumbittttt").click();

            }else {

                alert("您的留言是空的，留言失败！");

            }
        }else {
            alert("留言失败！");
        }

    }


    /*
    书写回复
     */
    function write_reply(id){//小心重名

        var message=prompt("请写入您回复的内容","");

        if (message!=null && message!=="") {

            document.getElementById("reply_what").value = message;

            document.getElementById("reply_id").value = id;//js给文本框赋值,不要使用jQuery不好使，使用js的document



            $("#sumbittt").click();

            // alert(message);

        }else {
            alert("请输入正确的内容！");
        }
    }

</script>

</body>
</html>


<%
    }

%>


