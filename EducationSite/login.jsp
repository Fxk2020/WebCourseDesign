<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/21
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>登陆验证</title>

    <style>
        /*登陆部分*/
        #loginmodal {

            margin-left: 560px;

            width: 300px;
            padding: 15px 20px;
            background: #f3f6fa;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
            -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
            box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
        }

        #loginform label { display: block; font-size: 1.1em; font-weight: bold; color: #7c8291; margin-bottom: 3px; }

        .txtfield {
            display: block;
            width: 100%;
            padding: 6px 5px;
            margin-bottom: 15px;
            font-family: 'Helvetica Neue', Helvetica, Verdana, sans-serif;
            color: #7988a3;
            font-size: 1.4em;
            text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.8);
            background-color: #fff;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#edf3f9), to(#fff));
            background-image: -webkit-linear-gradient(top, #edf3f9, #fff);
            background-image: -moz-linear-gradient(top, #edf3f9, #fff);
            background-image: -ms-linear-gradient(top, #edf3f9, #fff);
            background-image: -o-linear-gradient(top, #edf3f9, #fff);
            background-image: linear-gradient(top, #edf3f9, #fff);
            border: 1px solid;
            border-color: #abbce8 #c3cae0 #b9c8ef;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
            -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
            -webkit-transition: all 0.25s linear;
            -moz-transition: all 0.25s linear;
            transition: all 0.25s linear;
        }

        .txtfield:focus {
            outline: none;
            color: #525864;
            border-color: #84c0ee;
            -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
            -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
        }

        .flatbtn-blu {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            display: inline-block;
            outline: 0;
            border: 0;
            color: #edf4f9;
            text-decoration: none;
            background-color: #4f94cf;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            font-size: 1.3em;
            font-weight: bold;
            padding: 12px 26px 12px 26px;
            line-height: normal;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
            text-transform: uppercase;
            text-shadow: 0 1px 0 rgba(0,0,0,0.3);
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
            -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
        }
        .flatbtn-blu:hover {
            color: #fff;
            background-color: #519dde;
        }
        .flatbtn-blu:active {
            -webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
            -moz-box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
            box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
        }

        .center { display: block; text-align: center; }

    </style>

</head>
<body style="background-image: url('imgs/login_background.png')">

<!--jsp逻辑-->
<%
    String username = request.getParameter("username");
%>

<div id="left" style="margin-left: 240px">
    <img src="imgs/mooc.png" style="width: 1050px;height: 350px">
</div>

<div id="loginmodal" style="margin-left: 600px;margin-top: 10px">
    <h1 align="center">用户登陆</h1>

    <!-- 登陆提交的表单 -->
    <form id="loginform" style="align-self: center" name="loginform" method="post" action="http://localhost:8080/EducationSite_war/login_check.jsp">
        <label for="userName">Username（用户名）:</label>
        <input type="text" name="userName" id="username" class="txtfield" tabindex="1">

        <label for="password">Password（密码）:</label>
        <input type="password" name="password" id="password" class="txtfield" tabindex="2">

        <div class="center">
            <input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="登陆" tabindex="3" align="center" >
        </div>
    </form>

</div>

<%
    if (username!=null&&username.equals("null")){
        %>

<script>
    alert('对不起您的账号或密码错误！请重新登录！');
</script>

<%
    }
%>

</body>
</html>
