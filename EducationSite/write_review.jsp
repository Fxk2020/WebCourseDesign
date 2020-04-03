<%@ page import="com.education.dao.ReviewDao" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/1/30
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = (String) session.getAttribute("username_msg");
    String review = request.getParameter("review_what");

    if (ReviewDao.writeView(name,review)){
        response.sendRedirect("http://localhost:8080/EducationSite_war/index.jsp?pinglun=yes&name="+name);
    }else {

    }

%>
