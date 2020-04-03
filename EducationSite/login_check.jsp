<%@ page import="com.education.User.User" %>
<%@ page import="com.education.dao.Login" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/1/29
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //1.设置编码
    //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
    request.setCharacterEncoding("utf-8");
    //终极版简单的方式设置编码，解决乱码问题  告诉浏览器你用的字符编码方式
    response.setContentType("text/html;charset=utf-8");



    //2.获取用户的登录信息并验证是否存在
    String username = request.getParameter("userName");
    String password = request.getParameter("password");

    User login_user = new User();
    login_user.setUserName(username);
    login_user.setPassword(password);

    Login login_check = new Login();
    User return_user = login_check.login(login_user);

    //3.根据验证结果确定返回的页面
    if (return_user==null){
        //登陆失败
        response.sendRedirect("http://localhost:8080/EducationSite_war/login.jsp?username=null");
    }else {
        System.out.println(return_user.getName());

        //登陆成功
        response.sendRedirect("http://localhost:8080/EducationSite_war/index.jsp?name="+return_user.getName());
        System.out.println(return_user.getName());

        //登录成功时，把真实姓名存储到session中
        request.getSession(true).setAttribute("username_msg",return_user.getName());
    }
%>
