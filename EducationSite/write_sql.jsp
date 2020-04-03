<%@ page import="com.education.dao.ReplyDao" %>
<%@ page import="com.education.User.Reply_content" pageEncoding="UTF-8" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/1/30
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
<%
    String name = (String) session.getAttribute("username_msg");
    String review = request.getParameter("reply_what");
    String id0 = request.getParameter("reply_id");

    System.out.println("传来的是："+name);
    System.out.println("传来的是："+review);
    System.out.println("传来的是："+id0);

    int id = Integer.parseInt(id0);

    Reply_content reply = new Reply_content(id,name,review);
    if (ReplyDao.addReply(reply)){

        response.sendRedirect("http://localhost:8080/EducationSite_war/index.jsp?pinglun=yes&name="+name);

    }else {

    }

%>
</head>

