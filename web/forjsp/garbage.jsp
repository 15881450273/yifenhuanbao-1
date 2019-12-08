<%@ page import="com.nddmwdf.program.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/26
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    User user =(User) session.getAttribute("user");
    String loginName=user.getLoginName();
%>
<link rel="stylesheet" href="../css/garbage.css">
<link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
<head>
    <meta charset="UTF-8">
    <title>垃圾分类指南</title>
    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
    <script src="../js/garbage.js"></script>
</head>
<body>
<!--顶部导航栏部分-->
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
                <li class="layui-nav-item">
                    <a href="../forjsp/user_center.jsp?username=<%=user.getLoginName()%>">
                        <span class="layui-icon layui-icon-user"><%=user.getLoginName()%></span>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="/RemoveOut" >
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
<!--视频部分-->
<div class="video">
    <video src="../video/垃圾分类.mp4" width="1000px" height="300px" autoplay="autoplay"  loop="loop"
           muted="muted"></video>
    <div class="search">
        <form class="layui-form" action="/GarbageSearch" method="post">
            <input type="text" class="search_box" name="garbage_name">
            <div class="search_img">
                <button style="margin-top: -5px"><img src="../img/搜索.png" alt=""></button>
            </div>
        </form>
    </div>
</div>
<!--垃圾分类部分-->
<div class="garbage">
    <div class="garbage_left">
        <ul class="garbage_name">
            <li class="current">干垃圾</li>
            <li>湿垃圾</li>
            <li>有害垃圾</li>
            <li>可回收垃圾</li>
        </ul>

        <ul class="garbage_img">
            <li class="show">
                <ul>
                    <li><img src="../img/q-一次性餐具.jpg" alt="一次性餐具">
                        <span>一次性餐具</span></li>
                    <li><img src="../img/q-废旧陶瓷品.jpg" alt="废旧陶瓷品">
                        <span>废旧陶瓷品</span></li>
                    <li><img src="../img/q-污染纸张.jpg" alt="污染纸张">
                        <span>污染纸张</span></li>
                    <li><img src="../img/q-灰土.jpg" alt="灰土">
                        <span>灰土</span></li>
                    <li><img src="../img/q-烟头.jpg" alt="烟头">
                        <span>烟头</span></li>
                    <li><img src="../img/q-砖.jpg" alt="砖头">
                        <span>砖头</span></li>
                </ul>
            </li>
            <li>
                <ul >
                    <li><a href=""><img src="../img/c-剩菜.jpg" alt=""></a>
                        <span>剩菜</span></li>
                    <li><img src="../img/c-果皮.jpg" alt=""> <span>果皮</span></li>
.
                    <li><img src="../img/c-茶叶渣.jpg" alt=""><span>茶叶渣</span></li>
.
                    <li><img src="../img/c-菜叶.jpg" alt=""> <span>菜叶</span></li>
.
                    <li><img src="../img/c-蛋壳.jpg" alt=""><span>蛋壳</span></li>
.
                    <li><img src="../img/c-骨头.jpg" alt=""><span>骨头</span></li>

                </ul>
            </li>
            <li>
                <ul >
                    <li><img src="../img/y-废杀虫喷雾罐.jpg" alt=""><span>废杀虫喷雾罐</span></li>
                    <li><img src="../img/y-废油漆桶.jpg" alt=""><span>废油漆桶</span></li>
                    <li><img src="../img/y-废温度计.jpg" alt=""><span>废温度计</span></li>
                    <li><img src="../img/y-废灯管.jpg" alt=""><span>废灯管</span></li>
                    <li><img src="../img/y-废药品.jpg" alt=""><span>废药品</span></li>
                    <li><img src="../img/y-电池.jpg" alt=""><span>废电池</span></li>
                </ul>.
            </li>
            <li>
                <ul >
                    <li><img src="../img/k-塑料.jpg" alt=""><span>塑料</span></li>
                    <li><img src="../img/k-布料.jpg" alt=""><span>废布料</span></li>
                    <li><img src="../img/k-玻璃.jpg" alt=""><span>废玻璃</span></li>
                    <li><img src="../img/k-硬纸板.jpg" alt=""><span>废硬纸板</span></li>
                    <li><img src="../img/k-纸.jpg" alt=""><span>废纸</span></li>
                    <li><img src="../img/k-金属器材.jpg" alt=""><span>废金属器材</span></li>
                </ul>
            </li>
        </ul>
        <a href="#" id="more" >更多>></a>
    </div>
    <div class="location">
        <p style="font-size: 16px;font-weight: 800">投放位置:</p>
        <iframe src="map.jsp" frameborder="0" width="100%" height="400px"></iframe>
    </div>
</div>
<div class="bottom">
    <ul class="about">
        <li>关于</li>
        <li>关于我们</li>
        <li>加入我们</li>
        <li>使用条款</li>
        <li>隐私协议</li>
    </ul>
    <ul class="contact">
        <li>联系我们</li>
        <li>发送邮箱至1016939850@qq.com</li>
    </ul>
    <ul class="more">
        <li>更多</li>
    </ul>
    <ul class="business">
        <li>商业合作</li>
    </ul>
</div>
</body>
</html>
