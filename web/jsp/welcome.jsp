<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/21
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.nddmwdf.program.dao.UserDao" %>
<%@ page import="com.nddmwdf.program.dao.GarbageDao" %>
<%@ page import="com.nddmwdf.program.dao.NewsDao" %>
<%
    Date date = new Date();
    SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :HH:mm:ss");
    String time=dateFormat.format(date);
%>

<%
    UserDao userDao=new UserDao();
    int usernum=userDao.getPage();
%>

<%
    GarbageDao garbageDao=new GarbageDao();
    int garbagenum=garbageDao.getPage();
%>

<%
    NewsDao newsDao=new NewsDao();
    int newsnum=newsDao.getPage();
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
</head>
<body>
<div class="x-body layui-anim layui-anim-up">
    <%
        boolean isLogin = false;
        String loginName = (String)request.getSession().getAttribute("loginName");
        if(loginName != null && !"".equals(loginName)){
            isLogin = true;
        }
        request.setAttribute("isLogin",isLogin);
        request.setAttribute("loginName",loginName);
    %>
    <blockquote class="layui-elem-quote">欢迎管理员：
        <span class="x-red">${loginName}</span>！登录时间:<%=time%>></blockquote>
    <fieldset class="layui-elem-field">
        <legend>数据统计</legend>
        <div class="layui-field-box">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 90px;">
                            <div carousel-item="">
                                <ul class="layui-row layui-col-space10 layui-this">
                                    <li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>文章数</h3>
                                            <p>
                                                <cite><%=newsnum%></cite></p>
                                        </a>
                                    </li>
                                    <li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>会员数</h3>
                                            <p>
                                                <cite><%=usernum%></cite></p>
                                        </a>
                                    </li>

                                    <li class="layui-col-xs2">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>垃圾数</h3>
                                            <p>
                                                <cite><%=garbagenum%></cite></p>
                                        </a>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>

    <fieldset class="layui-elem-field">
        <legend>系统通知</legend>
        <div class="layui-field-box">
            <table class="layui-table" lay-skin="line">
                <tbody>
                <tr>
                    <td >
                        <a class="x-a" href="#" target="_blank">交流qq:1016939850</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </fieldset>


    <fieldset class="layui-elem-field">
        <legend>开发团队</legend>
        <div class="layui-field-box">
            <table class="layui-table">
                <tbody>
                <tr>
                    <th>版权所有</th>
                    <td>你的代码我的发
                    <td>
                </tr>
                <tr>
                    <th>开发者</th>
                    <td>你的代码我的发</td></tr>
                </tbody>
            </table>
        </div>
    </fieldset>
</div>
</body>
</html>
