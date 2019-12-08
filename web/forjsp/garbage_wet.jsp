<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nddmwdf.program.dao.GarbageDao" %>
<%@ page import="com.nddmwdf.program.entity.Garbage" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nddmwdf.program.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/14
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<%
    GarbageDao garbageDao=new GarbageDao();
    String type=request.getParameter("type");
    List<Garbage> wet=garbageDao.typelist(type);
    request.setAttribute("gb", wet);
%>
<%
    User user =(User) session.getAttribute("user");
    String loginName=user.getLoginName();
%>
<link rel="stylesheet" href="../css/search_kitchen.css">
<link rel="stylesheet" href="../css/search.css">
<link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<!--导航栏部分-->
<div class="layui-fluid"style="padding: 0px;">
    <div class="layui-row">
        <div class="layui-col-md6 layui-col-sm3 layui-col-xs2">
            <ul class="layui-nav layui-bg-green">
                <li class="layui-nav-item">
                    <img src="../img/树叶.png">
                </li>
                <li class="layui-nav-item">
                    <a href="#">易分环保网</a>
                </li>
            </ul>
        </div>
        <div class="layui-col-md6 layui-col-xs3 layui-col-sm3">
            <ul class="layui-nav layui-bg-green">
                <li class="layui-nav-item">
                    <a href="../forjsp/index.jsp">
                        <span class="layui-icon layui-icon-home">首页</span>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="../forjsp/garbage.jsp">
                        <span class="layui-icon layui-icon-app">分类指南</span>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="../forjsp/news_center.jsp">
                        <span class="layui-icon layui-icon-read">新闻中心</span>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="../forjsp/message.jsp">
                        <span class="layui-icon layui-icon-read">交流中心</span>
                    </a>
                </li>
                <%
                    if(loginName==null)
                    {
                %>
                <li class="layui-nav-item">
                    <a href="../forjsp/login.jsp">
                        <span class="layui-icon layui-icon-user">登录</span>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="../forjsp/register.jsp">
                        <span class="layui-icon layui-icon-release">注册</span>
                    </a>
                </li>
                <%
                }
                else
                {
                %>
                <li class="layui-nav-item" id="user">
                    <a href="../forjsp/user_center.jsp?username=<%=user.getLoginName()%>">
                        <span class="layui-icon layui-icon-user"><%=user.getLoginName()%></span>
                    </a>
                </li>
                <li class="layui-nav-item" id="out">
                    <a href="/RemoveOut" class="out">
                        <span class="layui-icon layui-icon-release">退出</span>
                    </a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</div>
<!--<div class="search">-->
<!--<input type="text" class="search_box">-->
<!--<div class="search_img">-->
<!--<a href=""><img src="./img/搜索.png" alt=""></a>-->
<!--</div>-->
<!--</div>-->
<div class="rubbish_harmful">
    <div class="left_img">
        <img src="../img/shi.jpg" alt="">
    </div>
    <div class="right_info">
        <h2>湿垃圾</h2>
        <span>湿垃圾是指居民日常生活及食品加工、饮食服务、单位供餐等活动中产生的垃圾，包括丢弃不用的菜叶、剩菜、剩饭、果皮、蛋壳、茶渣、骨头等，其主要来源为家庭厨房、餐厅、饭店、食堂、市场及其他与食品加工有关的行业。</span>
    </div>
</div>
<table class="layui-table" style="width: 60%;margin:0 auto">
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>查询项</th>
        <th>垃圾分类</th>
        <th>注意事项</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${gb}" var="garbage">
        <tr>
            <td>${garbage.name}</td>
            <td>${garbage.type}</td>
            <td><a href="/GabageInfo?garbagename=${garbage.name}&garbagetype=${garbage.type}&garbagedes=${garbage.content}">详情</a></td>
        </tr>
    </c:forEach>

    </tbody>
</table>
</body>
</html>
