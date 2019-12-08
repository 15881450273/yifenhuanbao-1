<%@ page import="com.nddmwdf.program.entity.News" %>
<%@ page import="com.nddmwdf.program.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/26
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<%
    News news=new News();
    news=(News)request.getAttribute("news");
%>
<%
    User user =(User) session.getAttribute("user");
    String loginName=user.getLoginName();
%>
<link rel="stylesheet" href="../css/newinfo.css">
<link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<<div class="layui-fluid"style="padding: 0px;">
    <div class="layui-row">
        <div class="layui-col-md7 layui-col-sm3 layui-col-xs2">
            <ul class="layui-nav layui-bg-green">
                <li class="layui-nav-item">
                    <img src="../img/树叶.png">
                </li>
                <li class="layui-nav-item">
                    <a href="#">易分环保网</a>
                </li>
            </ul>
        </div>
        <div class="layui-col-md5 layui-col-xs3 layui-col-sm3">
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
<div class="newinfo_center">
    <h2><%=news.getTitle()%></h2>
    <div class="newinfo_new">
        <%=news.getText()%>
    </div>
    <div class="newinfo_bottom">
        <span class="date"><%=news.getTime()%> | 作者: <%=news.getAuthor()%></span>
        <span class="return"><a href="../forjsp/news_center.jsp">返回>></a></span>
    </div>

</div>

<!--<div class="new_center-right">-->
<!--<img src="./img/蒲公英.png" alt="">-->
<!--</div>-->
</body>
</html>
