<%@ page import="java.sql.*" %>
<%@ page import="com.fxk.util_my.JDBCTest" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/22
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--完全充当servlet--%>

<%
    /**
     * 直接在jsp文件中调用数据库
     */

    //装载MySQL5.5的JDBC驱动
    Class.forName("com.mysql.cj.jdbc.Driver");
    //建立数据库连接
    //建立数据库连接
    String url ="jdbc:mysql://202.194.14.120:3306/webteach?&useSSL=false&serverTimezone=UTC";
    //输入还包含用户名和密码
    Connection conn= DriverManager.getConnection(url,"webteach","webteach");
    ResultSet rs = null;

    String sql = null;
    String op = request.getParameter("op");

    String people_name = request.getParameter("username");

    int prize = 0;

    //将商品退回到商品架(将商品从购物车中删除)
    if (op.equals("del")){
        try{
            int id = Integer.parseInt(request.getParameter("id"));
            sql = "delete from web201800301153_shoppingcar where ProducationID="+id;
            JDBCTest.executeUpdate(sql);

            //关闭数据库连接
            conn.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }


        //重定向到购物车页面
        response.sendRedirect("ShowCar.jsp?username="+people_name);
    }

    //清空购物车
    if (op.equals("clear")){

        try {




            //清空之前算钱
            prize = Integer.parseInt(request.getParameter("prize"));

            if(prize!=0){
                System.out.println(prize);

                //清除购物车的操作
                sql = "delete from web201800301153_shoppingcar";
                JDBCTest.executeUpdate(sql);

                //加入订单的操作
                sql = "INSERT INTO web_201800301153_OderForm (name, money) VALUES ('"+people_name+"', '"+prize+"')";
                JDBCTest.executeUpdate(sql);
            }else {




            }



            //关闭数据库连接
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }


        //重定向到购物车页面
        response.sendRedirect("ShowCar.jsp?username="+people_name);
    }
%>
