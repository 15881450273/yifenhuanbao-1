<%@ page import="com.nddmwdf.program.dao.UserDao" %>
<%@ page import="com.nddmwdf.program.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/25
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<%
    boolean isLogin = false;
    String loginName = (String)request.getSession().getAttribute("username");
    if(loginName != null && !"".equals(loginName)){
        isLogin = true;
    }
    request.setAttribute("isLogin",isLogin);
    request.setAttribute("username",loginName);
    UserDao userDao=new UserDao();
    if(loginName!=null)
    {
        User user=userDao.getUser(loginName);
        session.setAttribute("user",user);
    }
    else
    {
        User user=new User();
        user.setId(0);
        session.setAttribute("user",user);
    }
%>
<head>
    <meta charset="UTF-8">
    <title>易分环保网</title>
    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../js/jqthumb.js"></script>
    <script type="text/javascript" src="../layui-v2.5.5/layui/layui.all.js"></script>
    <script type="text/javascript" src="../js/index.js"></script>

    <link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
    <link rel="script" href="../bootstrap-3.3.7/dist/js/bootstrap.min.js">
    <link rel="stylesheet" href="../bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/total.css">
</head>
<script>
    ;!function(){
        var layer = layui.layer
            ,form = layui.form;
    }();
</script>
<style>
    .layui-nav{
        border-radius: 0px;
    }
    .layui-nav-tree {
        /* width: 200px; */
        padding: 0;
        width: auto;
    }
    .imgc{
        margin-right: 10px;
    }
    .title{
        size: 15px;
    }
</style>
<body  style="background:url(../img/houndstooth-pattern.png)">
<!--顶部导航-->
<div class="layui-fluid"style="padding: 0px;">
    <div class="layui-row">
        <div class="layui-col-md6 layui-col-sm3 layui-col-xs2">
            <ul class="layui-nav layui-bg-green">
                <li class="layui-nav-item">
                    <img src="../img/logo.png">
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
                    <a href="../forjsp/user_center.jsp?username=${username}">
                        <span class="layui-icon layui-icon-user">${username}</span>
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

<!--搜索-->
<div class="layui-container" style="height: 500px;background-image: url(../img/bg.jpg);padding-left: 0px;">
    <div class="layui-row">
        <div class="layui-col-md1"style="margin-top: 130px;">
        </div>
        <div class="layui-col-md10">
            <!--文字-->
            <div class="text-center"style="padding-top: 150px;">
                <h2 class="font">
                    易分垃圾网
                </h2>
            </div>
            <!--搜索框-->
            <form class="layui-form" action="/GarbageSearch" method="post">
                <div class="layui-form-item"></div>
                <div class="layui-input-block" style="border-radius: 0px;">
                    <input type="text" name="garbage_name" required  lay-verify="required" placeholder="请输入要搜索的垃圾" autocomplete="off" class="layui-input">
                    <button type="submit" class="layui-btn layui-btn-primary layui-btn-md" lay-filter="search">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!--新闻与交流中心--->
<div class="layui-container">
    <div class="row">
        <div class="layui-col-md8 layui-col-sm3 layui-col-xs2">
            <div class="layui-col-md-offset5">
                <h3>新闻中心</h3>
            </div>
            <div class="layui-col-xs2  layui-col-md4">
                <a href="/NewsInfo?title=生产岸线退生活岸线进" class="thumbnail">
                    <img src="../img/indexnews.jpg" class="img-responsive"onload="DrawImage(this)">
                    <h4>生产岸线退生活岸线进</h4>
                    <p>江苏南通搬迁沿江污染企业，大规模增绿</p>
                </a>
            </div>
            <div class="layui-col-xs2  layui-col-md4">
                <a href="/NewsInfo?title=夏收夏种从南到北全启动" class="thumbnail">
                    <img src="../img/indexnew2.jpg" class="img-responsive"onload="DrawImage(this)">
                    <h4>夏收夏种从南到北全启动</h4>
                    <p>麦浪翻滚，满目金黄</p>
                </a>
            </div>
            <div class="layui-col-xs2  layui-col-md4">
                <a href="/NewsInfo?title=吉林洮南市万顷草原破坏严重" class="thumbnail">
                    <img src="../img/indexnew3.jpg" class="img-responsive"onload="DrawImage(this)">
                    <h4>吉林洮南市万顷草原破坏严重</h4>
                    <p>雏鹰公司征用草场违规改变草原用途用作鱼塘</p>
                </a>
            </div>
        </div>
        <div class="layui-col-md3 layui-col-sm2 layui-col-xs1 layui-col-md-offset1">
            <div class="layui-col-md-offset3">
                <h3>交流中心</h3>
            </div>
            <div class="layui-col-md11 layui-col-xs2">
                <a href="../forjsp/message.jsp" class="thumbnail">
                    <img src="../img/mes.jpeg" class="img-responsive"onload="DrawImage(this)">
                </a>
            </div>
        </div>
    </div>
</div>

<!--关于我们-->
<div class="container-fluid">
    <fieldset class="layui-elem-field title" style="margin-bottom: 0px;">
        <legend>关于我们</legend>
    </fieldset>
</div>
<div class="text-center footer">
    <a href="https://weibo.com/"><span class="layui-icon layui-icon-login-weibo" style="font-size: 30px;padding: 20px;"></span></a>
    <a href="https://weixin.qq.com/"><span class="layui-icon layui-icon-login-wechat" style="font-size: 30px; padding: 20px;"></span></a>
    <a href="tencent://AddContact/?fromId=45&fromSubId=1&subcmd=all&uin=1016939850&website=www.oicqzone.com"><span class="layui-icon layui-icon-login-qq" style="font-size: 30px; padding: 20px"></span></a>
</div>
</div>
</body>
</html>