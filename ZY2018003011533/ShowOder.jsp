<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/22
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看历史订单</title>
</head>
<%

    /**
     * 直接在jsp文件中调用数据库
     */

    //装载MySQL5.5的JDBC驱动
    Class.forName("com.mysql.cj.jdbc.Driver");
    //建立数据库连接
    String url ="jdbc:mysql://202.194.14.120:3306/webteach?&useSSL=false&serverTimezone=UTC";
    //输入还包含用户名和密码
    Connection conn= DriverManager.getConnection(url,"webteach","webteach");
    //建立一个Statement对象，用于执行SQL语句
    Statement stat = conn.createStatement();
    //执行查询并得到查询结果

    String people_name = request.getParameter("username");

    String sql = "select * from web_201800301153_OderForm where name = '"+people_name+"'";
    ResultSet rs = stat.executeQuery(sql);

%>

<body style="background-size: 100% 100%;background-repeat: no-repeat;background-image: url('image/order.jpg')">

<!-- CSS goes in the document HEAD or added to your external stylesheet -->
<style type="text/css">
    table.gridtable {
        font-family: verdana,arial,sans-serif;
        font-size:11px;
        color:#333333;
        border-width: 1px;
        border-color: #666666;
        border-collapse: collapse;
    }
    table.gridtable th {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #666666;
        background-color: #dedede;
    }
    table.gridtable td {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #666666;
        background-color: #ffffff;
    }

    /*隔行换色*/
    table tr:nth-child(2n) td{
        background:#F8F8F8;
    }


    a.hello{
        display: block;
        width: 120px;
        height: 40px;
        text-decoration: none;
        background-color: yellowgreen;
        color:white;
    }
    a:hover.hello{
        background-color: purple;
        font-weight: bold;
        color:yellow;
    }

</style>

<h2 align="center">我的历史订单：</h2>
<hr>
<table align="center" border="1" width="600" class="gridtable">
    <tr bgcolor="#dddddd">
        <td align="center" width="80">姓名</td>
        <td align="center">订单号</td>
        <td align="center" width="100">金额</td>
    </tr>
    <%
        String id,name;
        int prize_count = 0,price;
        //将查询结果集中的记录输出到页面上
        while (rs.next()){
            //从当前记录中读取各字段的值
            id = rs.getString("id").trim();
            //商品名称
            name = rs.getString("name").trim();
            price = rs.getInt("money");

            out.println("<tr>");
            out.println("<td>"+ name +"</td>");
            out.println("<td>"+ id +"</td>");
            out.println("<td>"+ price +"</td>");
            out.println("</tr>");
            prize_count+=price;
        }
    %>
    <tr>
        <td>亲爱的<%=people_name%>到目前为止，您总计消费人民币￥<%=prize_count%>感谢您对淘宝的贡献！</td>
    </tr>
</table>
<br>
<div align="center">
    <a class="hello" href="index.jsp?username=<%=people_name%>">继续购物</a>  
</div>

</body>

</html>
