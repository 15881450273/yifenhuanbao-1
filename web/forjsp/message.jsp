<%@ page import="com.nddmwdf.program.entity.invitation" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.nddmwdf.program.dao.UserDao" %>
<%@ page import="com.nddmwdf.program.entity.User" %>
<%@ page import="com.nddmwdf.program.entity.Message_port" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<html>
<head>
    <title>交流中心</title>
    <script src="../layui-v2.5.5/layui/layui.all.js"></script>
    <script src="../js/use.js"></script>
    <script src="../js/mesmove.js"></script>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/comment.css">
    <link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
    <link rel="stylesheet" href="../css/total.css">
    <link rel="stylesheet" href="../css/mes.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
    <script>
        $("#count").html("0");
        function OnInput(event, length, id) {

            if(event.srcElement.value.length <= length) {
                $("#" + id ).html(event.srcElement.value.length);
            } else {
                //$.toptip("内容过长，最多" + length + "字", 'warning');
                alert("字数最多为"+length+"个");
                /*获取输入框id值*/
                var id2 = event.srcElement.id;
                /*超出规定长度后禁止继续输入*/
                var value = event.srcElement.value.substring(0, length);
                $("#" + id2).val(value);
            }

        }
        // 此方法仅适用于IE浏览器
        function OnPropChanged(event, length, id) {

            if(event.srcElement.value.length <= length) {
                $("#" + event.srcElement.id).html(event.srcElement.value.length);
            } else {
                //$.toptip("内容过长，最多" + length + "字", 'warning');
                alert("字数最多为"+length+"个");
                /*获取输入框id值*/
                var id3 = event.srcElement.id;
                /*超出规定长度后禁止继续输入*/
                var value = event.srcElement.value.substring(0, length);
                $("#" + id3).val(value);
            }

        }
        //.replace(/&/g,"&amp;")
        //下面两方法用于转义，防代码注入
        function replaceStr(a) {
            a = a.replace(/(<[^>]*>| |\s*)/g, '')
                .replace(/"/g,"&quot;")
                .replace(/'/g,"&#39;")
                .replace(/</g,"&lt;")
                .replace(/>/g,"&gt;");
            return a;
        }
        function rpls(event,id) {
            var input_value=replaceStr(event.srcElement.value.toString());
            $("#"+id).val(input_value);
        }
    </script>
    <script>
        ;!function(){
            var layer = layui.layer
                ,form = layui.form;
        }();
    </script>
    <style>
        .layui-input-block{
            margin-left: 0px;
        }
        .article{
            border: 1px solid gainsboro;
        }
        .tit{
            color: #009688;
            padding-bottom: 15px;
        }
    </style>
</head>
<body>
<%
    //取出用户ID，并从帖子表中找出所有帖子
    ArrayList<invitation> inv_list;
    UserDao dao = new UserDao();
    User user =(User) session.getAttribute("user");
    String popname=user.getLoginName();
    inv_list = dao.post_invitation(user.getId(),-1);//帖子集合
    if(inv_list.isEmpty())
    {
        request.setAttribute("post_info","没有帖子或者显示失败");
    }
    else{
        request.setAttribute("post_info","显示成功");
        session.setAttribute("inv_list",inv_list);
    }
%>
<!--顶部导航栏-->
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-md8 layui-col-sm8 layui-col-xs-4"style="padding-left: 2px;">
            <ul class="layui-nav layui-bg-green">
                <li class="layui-nav-item">
                    <img src="../img/logo.png">
                </li>
                <li class="layui-nav-item">
                    <a href="#">易分环保网</a>
                </li>
            </ul>
        </div>
        <div class="layui-col-md4 layui-col-sm4">
            <ul class="layui-nav layui-bg-green">
                <li class="layui-nav-item">
                    <a href="../forjsp/index.jsp" >首页</a>
                </li>
                <li class="layui-nav-item">
                    <a href="../forjsp/garbage.jsp">分类指南</a>
                </li>
                <li class="layui-nav-item">
                    <a href="../forjsp/news_center.jsp">新闻中心</a>
                </li>
                <%
                    if (popname!=null) {
                        %>
                <li class="layui-nav-item" >
                    <a href = "../forjsp/Aboutme.jsp" > 与我相关 </a >
                </li >
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</div>

<div class="layui-container">
    <div class="layui-form layui-form-pane commentbox">
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    发表新帖
                </li>
            </ul>
            <div class="layui-form layui-tab-content" style="padding: 20px 0">
                <div class="layui-tab-item layui-show">
                    <form action="${pageContext.request.contextPath}/ReplyServlet" method="post" style="background: #fafafa" >
                        <div class="layui-row layui-col-space15 layui-form-item">
                            <div class="layui-col-md12">
                                <label class="layui-form-label">标题</label>
                                <div class="layui-input-block">
                                    <input id="title" type="text" name="post_topic" required layui-verify="txt" placeholder="请输入15字以内的标题" maxlength="15" onchange="rpls(event,'title')" class="layui-input" >
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <div class="layui-input-block">
                                <div class="layui-unselect">
                                    <textarea id="content" name="post_message" required layui-verify="required" placeholder="请输入100以内字的内容" maxlength="100" onchange="rpls(event,'content')" placeholder="请输入内容" class="layui-textarea" style="height:260px;" ></textarea>
                                    <% session.setAttribute("user_id",user.getId());%>
                                    <input class="layui-btn" id="commit" type="submit" lay-filter="commit"  style="float: right;margin-top: 20px;" value="发布" />
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    //循环输出帖子
    for(int i=0;i<inv_list.size();i++)
    {
        UserDao userDao=new UserDao();
        User usermother=userDao.getUser(inv_list.get(i).getUser_id());
        String name=usermother.getLoginName();
%>
<!-- 打印帖子 标题、时间、内容、作者-->
<div class="container">
    <!-- 打印文章标题，作者，时间-->
    <div class="comment-show-con-list pull-left clearfix">
        <div class="pl-text clearfix">
            <HR align=center width=1800 color=#987cb9 SIZE=50>
            <a href="#">标题：<%= inv_list.get(i).getPost_topic()%></a>
            <p >content：<%=inv_list.get(i).getPost_content()%></p>
        </div>
        <div class="pl-text clearfix">
            <a>作者：<%=name%></a>
        </div>
        <div class="pl-text clearfix">
            <p> <%=inv_list.get(i).getPost_time()%></p>
        </div>
    </div>

    <%
        //获取这个帖子的评论，并打印出来
        int t_id=inv_list.get(i).getPost_id();
        int u_id=inv_list.get(i).getUser_id();
        ArrayList<Message_port> message_list = dao.port_Message(t_id,u_id);
        //session.setAttribute("message_list",message_list);
        if(message_list.size()>0)
        {
            for(int j=0;j<message_list.size();j++)
            {
                User user1=userDao.getUser(message_list.get(j).getMessage_port_id());
                User user2=userDao.getUser(message_list.get(j).getB_id());
                String home=user1.getLoginName();
                String guess=user2.getLoginName();
    %>
    <!-- 打印输出这个帖子的评论信息-->
    <div class="comment-show-con-list pull-left clearfix">
        <%

            if(message_list.get(j).getMessage_port_id()==inv_list.get(i).getUser_id())
            {
        %>
        <div class="pl-text clearfix">
            <p><a><%=home%></a>回复<a><%=guess%></a>：<%=message_list.get(j).getMessage_content()%></p>
        </div>
        <%
        }else {
        %>
        <div class="pl-text clearfix">
            <p><a><%=home%></a>评论<a><%=guess%></a>：<%=message_list.get(j).getMessage_content()%></p>
        </div>
        <%
            }
        %>
        <div class="row">
            <p><%=message_list.get(j).getMessage_time()%></p>
        </div>
    </div>
    <%
            }
        }
    %>

    <!-- 表单传参，注意是在url后加的参数，如要该请注意-->
    <div class="row">
        <form action="${pageContext.request.contextPath}/CommentServlet?T_id=<%=inv_list.get(i).getPost_id()%>&U_id=<%=inv_list.get(i).getUser_id()%>&B_id=<%=inv_list.get(i).getUser_id()%>" method="post" >
            <div class="form-group">
                <textarea class="form-control" rows="3" name="comment_message"></textarea>
                <%
                    session.setAttribute("M_id",user.getId());
                %>
                <input type="submit" value="评论" style="text-align: right"/>
            </div>
        </form>
    </div>
</div>
<%
    }
%>


</body>
</html>
