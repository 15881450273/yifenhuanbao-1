<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/21
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.nddmwdf.program.dao.NewsDao" %>
<%@ page import="com.nddmwdf.program.entity.News" %>
<%@ page import="java.util.List" %>
<html>
<%
    //打开浏览器时给pageno初始化，不然会报空指针异常
    NewsDao nd = new NewsDao();
    News n=new News();
    if(request.getAttribute("npageno") == null){
        request.setAttribute("npageno",1);
    }
    //给每条数据编序号
    int count = 5*(Integer)request.getAttribute("npageno")-5;
    if (request.getAttribute("news") == null) {
        List<News> newsList = nd.queryuserlimit(1);
        request.setAttribute("news", newsList);
        int pagenum = nd.getPage();
        request.setAttribute("npagenum", pagenum);
    }
%>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input type="text" name="username"  placeholder="请输入查询名称" autocomplete="off" class="layui-input">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <%--<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>--%>
        <button class="layui-btn" onclick="x_admin_show('添加用户','/jsp/news_add.jsp')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：<%= (Integer)request.getAttribute("nnum") %>条</span>
    </xblock>

    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>新闻编号</th>
            <th>新闻名称</th>
            <th>新闻内容</th>
            <th>新闻类别</th>
            <th>新闻发表时间</th>
            <th>新闻作者</th>
            <th >操作</th>
        </tr>
        </thead>
        <tbody>

        <tr>
            <c:forEach items="${news}" var="news">
            <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${news.id}</td>
            <td>${news.title}</td>
            <td>${news.text}</td>
            <td>${news.type}</td>
            <td>${news.time}</td>
            <td>${news.author}</td>

            <td class="td-manage">
                <a title=""  onclick="x_admin_show('编辑','')" href="/jsp/news_alter.jsp">
                    <i class="layui-icon">&#xe63c;</i>
                </a>
                <a title="删除" onclick="member_del(this,'要删除的id')" href="/NewsDelete?news_id=${news.id}">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>
            <td><button onclick="First()">首页</button></td>
            <td><button onclick="Last()">上一页</button></td>
            <td><button onclick="Next()">下一页</button></td>
            <td><button onclick="End()">尾页</button></td>
            <label>当前数据库中共有<%= (Integer)request.getAttribute("npagenum") %>页</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label>跳转至第</label>
            <input id="randompage" type="text"  />页
            <button onclick="random()">跳转</button>
            <label>当前是第<%= (Integer)request.getAttribute("npageno") %>页</label>
            <a class="next" href="">&gt;&gt;</a>
        </div>
    </div>

</div>
<script>
    function First(){
        location.href = "/NewsPage?npageno=1";
    }

    function Last(){
        var pageno =<%= (Integer)request.getAttribute("npageno")  %>
        if(pageno<=1){
            alert("这已经是最前面一页！");
            return;
        }else{
            pageno = pageno-1;
            location.href = "/NewsPage?npageno="+pageno;
        }
    }
    function Next(){
        var pageno =<%= (Integer)request.getAttribute("npageno")  %>
        var pagenum =<%= (Integer)request.getAttribute("npagenum") %>
        if(pageno>=pagenum){
            alert("没有下一页了！");
            return;
        }else{
            pageno++;
            location.href = "/NewsPage?npageno="+pageno;
        }
    }

    function End(){
        var pagenum =<%= (Integer)request.getAttribute("npagenum") %>
            location.href = "/NewsPage?npageno="+pagenum;
    }

    function random(){
        var spage=document.getElementById("randompage").value;
        var pagenum =<%= (Integer)request.getAttribute("npagenum") %>

        if((spage>=1) && (spage<=pagenum)){
            var pageno = spage;
            location.href = "/NewsPage?npageno="+pageno;
        }else{
            alert("超出页码范围！请重新输入");
        }
    }
</script>
</body>
</html>
