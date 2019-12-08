<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/26
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.nddmwdf.program.entity.Garbage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.nddmwdf.program.entity.User" %>
<!DOCTYPE html>
<html lang="en">
<%
    User user =(User) session.getAttribute("user");
    String loginName=user.getLoginName();
%>
<link rel="stylesheet" href="../css/search_result2.css">
<link rel="stylesheet" href="../css/search.css">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
    <meta charset="UTF-8">
    <title>查询结果</title>
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
<%--<div class="search">--%>
    <%--<form method="post" action="/GarbageSearch">--%>
    <%--<input type="text" class="search_box" name="garbage_name">--%>
    <%--</form>--%>
<%--</div>--%>
    <%--<div class="layui-row">--%>
        <%--<div class="layui-col-md1"style="margin-top: 130px;">--%>
        <%--</div>--%>
        <%--<div class="layui-col-md10">--%>
        <%--<form class="layui-form" action="/GS" method="post">--%>
            <%--<div class="layui-form-item"></div>--%>
            <%--<div class="layui-input-block" style="border-radius: 0px;">--%>
                <%--<input type="text" name="garbage_name" required  lay-verify="required" placeholder="请输入要搜索的垃圾" autocomplete="off" class="layui-input">--%>
                <%--<button type="submit" class="layui-btn layui-btn-primary layui-btn-md" lay-filter="search">--%>
                    <%--<i class="layui-icon layui-icon-search"></i>--%>
                <%--</button>--%>
            <%--</div>--%>
        <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>
<table class="layui-table" style="width: 60%;margin:20px auto"  >
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>#</th>
        <th>查询项</th>
        <th>垃圾分类</th>
        <th>注意事项</th>
    </tr>
    </thead>
    <tbody>
    <%
        ArrayList<Garbage> garbageList = (ArrayList<Garbage>)request.getAttribute("user_list");
        session.setAttribute("detail_garbage",garbageList);
        int len = (int)request.getAttribute("list_size");
        for(int i=0;i<len;i++){
    %>
    <tr>
        <td><%= i%></td>
        <td><%=garbageList.get(i).getName()%></td>
        <td><%=garbageList.get(i).getType()%></td>
        <td><a href="../forjsp/search_info.jsp?id=<%=i%>&name=id">详情</a></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
