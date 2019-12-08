<%@ page import="com.nddmwdf.program.entity.Garbage" %>
<%@ page import="com.nddmwdf.program.dao.TypeDao" %>
<%@ page import="com.nddmwdf.program.entity.Type" %>
<%@ page import="com.nddmwdf.program.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/12
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    Garbage garbage=new Garbage();
    garbage=(Garbage) request.getAttribute("garbage");
    String name=garbage.getName();
    String type=garbage.getType();
    String des=garbage.getContent();
    TypeDao typeDao=new TypeDao();
    Type typeinfo=typeDao.getType(type);
%>
<%
    User user =(User) session.getAttribute("user");
    String loginName=user.getLoginName();
%>
<link rel="stylesheet" href="../css/search_info.css">
<link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
<head>
    <title>你要的垃圾</title>
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
<div class="center">
    <p class="p_class" style="white-space:nowrap;">"<%=name%>"属于[<%=type%>]</p>
    <br>
    <div class="search1">
        <h4><%=type%></h4><br>
        <%=typeinfo.getType_content()%>
    </div>
    <div class="search2">
        <h4><%=type%>主要包括</h4><br>
        <%=typeinfo.getType_clude()%>
    </div>
    <div class="search3">
        <h4><%=name%>投放要求</h4><br>
        <ul>
            <li><%=des%></li>
        </ul>
    </div>
</div>
</body>
</html>
