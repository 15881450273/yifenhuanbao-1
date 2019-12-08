<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/21
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.nddmwdf.program.entity.Admin" %>
<%@ page import="java.io.PrintWriter" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/xadmin.css">

    <script src="js/jquery.min.js"></script>
    <script src="lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>

</head>
<body>
<%
    boolean isLogin = false;
    String Name = (String)request.getSession().getAttribute("loginName");
    if(Name == null){
        PrintWriter out1 = response.getWriter();
        out1.print("<script>alert('！请重新登录');</script>");
        out1.print("<script>window.location='/login.jsp'; </script>");
        out1.close();
    }
    else
        {
            isLogin=true;
        }
%>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="forjsp/index.jsp">易分环保网</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="#">${loginName}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <!--               <dd><a onClick="x_admin_show('个人信息','http://www.baidu.com')">个人信息</a></dd> -->
                <dd><a href="login.jsp">切换帐号</a></dd>
                <dd><a href="login.jsp">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="forjsp/index.jsp">前台首页</a></li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li >
                <a href="javascript:;">
                    <i class="iconfont">&#xe6eb;</i>
                    <cite>主页</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li><a href="jsp/welcome.jsp"><i class="iconfont">&#xe6a7;</i><cite>控制台</cite></a></li >
                </ul>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe69e;</i>
                    <cite>垃圾管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="jsp/garbage_list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>垃圾列表</cite>
                        </a>
                    </li >
                </ul>
            </li>

            <!--  <li>
                 <a href="javascript:;">
                     <i class="iconfont">&#xe726;</i>
                     <cite>管理员管理</cite>
                     <i class="iconfont nav_right">&#xe6a7;</i>
                 </a>
                 <ul class="sub-menu">
                     <li>
                         <a _href="html/admin-list.html">
                             <i class="iconfont">&#xe6a7;</i>
                             <cite>管理员列表</cite>
                         </a>
                     </li >
                     <li>
                         <a _href="html/admin-role.html">
                             <i class="iconfont">&#xe6a7;</i>
                             <cite>角色管理</cite>
                         </a>
                     </li >
                     <li>
                         <a _href="html/admin-cate.html">
                             <i class="iconfont">&#xe6a7;</i>
                             <cite>权限分类</cite>
                         </a>
                     </li >
                     <li>
                         <a _href="html/admin-rule.html">
                             <i class="iconfont">&#xe6a7;</i>
                             <cite>权限管理</cite>
                         </a>
                     </li >
                 </ul>
             </li>             -->
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>用户管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="jsp/member_list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>会员列表</cite>

                        </a>
                    </li >

                </ul>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe69e;</i>
                    <cite>新闻管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="jsp/news_list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>新闻列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='jsp/welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<!--     <div class="footer">
        <div class="copyright">Copyright ©2019 L-admin v2.3 All Rights Reserved</div>
    </div> -->
<!-- 底部结束 -->
</body>
</html>
