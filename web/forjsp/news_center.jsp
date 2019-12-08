<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nddmwdf.program.dao.NewsDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nddmwdf.program.entity.News" %>
<%@ page import="com.nddmwdf.program.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/26
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<%
    NewsDao newsDao=new NewsDao();
    List<News> inform=newsDao.typenews("通知");
    request.setAttribute("inform", inform);
    List<News> hotspot=newsDao.typenews("热点");
    request.setAttribute("hotspot",hotspot);
    List<News> home=newsDao.typenews("国内要闻");
    request.setAttribute("home",home);
    List<News> inter=newsDao.typenews("国际资讯");
    request.setAttribute("inter",inter);
%>
<%
    User user =(User) session.getAttribute("user");
    String loginName=user.getLoginName();
%>
<link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet" href="../css/new_center.css">
<head>
    <meta charset="UTF-8">
    <title>新闻中心</title>
</head>
<!--新闻中心导航栏-->
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
<div class="span1"><span>环保要闻>></span></div>
<div class="layui-carousel" id="test1">
    <div carousel-item>
        <div>
            <img src="../img/changfu.png" alt="">
        </div>
    </div>
</div>
<!-- 条目中可以是任意内容，如：<img src=""> -->
<!--新闻中心左边新闻部分-->
<div class="new_center-left">
    <div class="new_list">
        <ul>
            <c:forEach items="${hotspot}" var="news">
            <li><span></span><a href="/NewsInfo?title=${news.title}"><p>${news.title}</p></a></li>
            </c:forEach>
        </ul>
    </div>
    <div class="footer">
        <div class="notice">
            <div class="span2"><span>公告栏>></span></div>
            <ul>
            <c:forEach items="${inform}" var="news">
                <li><span><img src="../img/手指示.png" alt=""></span><a href="/NewsInfo?title=${news.title}">${news.title}</a></li>
            </c:forEach>
            </ul>
        </div>
        <!--政策法规部分-->
        <div class="new_center-policy">
            <div class="span3"><span>国内新闻>></span></div>
            <ul>
            <c:forEach items="${home}" var="news">
                <li><span><img src="../img/双箭头%20右.png" alt=""></span><a href="/NewsInfo?title=${news.title}">${news.title}</a></li>
            </c:forEach>
            </ul>
        </div>
    </div>
</div>
<!--新闻中心右边其他新闻列表部分-->
<div class="new_center-right">
    <div class="new_center-title">
        <span>国际资讯</span>
        <div class="change">
            <span>放眼看世界</span>
            <%--<span><a href=""><img src="../img/换一换.png" alt=""></a></span>--%>
        </div>
    </div>
    <ul class="new_list">
        <c:forEach items="${inter}" var="news">
            <li><a href="/NewsInfo?title=${news.title}"><p>${news.title}</p></a></li>
        </c:forEach>

    </ul>
</div>
<!--公告栏部分-->
</body>
<script src="../layui-v2.5.5/layui/layui.js"></script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '70%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
</script>
</html>


