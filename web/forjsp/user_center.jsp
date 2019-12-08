<%@ page import="com.nddmwdf.program.entity.User" %>
<%@ page import="com.nddmwdf.program.dao.UserDao" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/2
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user=new User();
    UserDao userDao=new UserDao();
    String username=request.getParameter("username");
    if (username=="")
    {
        PrintWriter out1 = response.getWriter();
        out1.print("<script>alert('！请登录');</script>");
        out1.print("<script>window.location='/forjsp/login.jsp'; </script>");
        out1.close();
    }
    else if (username!=null)
    {
        try {
            user=userDao.getUser(username);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    else
    {
        try {
            String name=(String)request.getSession().getAttribute("username");
            user=userDao.getUser(name);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

//    user=(User)request.getAttribute("user");
%>
<html>
<head>
    <meta charset="utf-8">
    <title>用户中心</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
    <link rel="script" href="../bootstrap-3.3.7/dist/js/bootstrap.min.js">
    <link rel="stylesheet" href="../bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet" href="../css/user_center.css">
</head>
<body>
<div class="layui-fluid" style="background: url(../img/User-bg.jpg);background-size: cover">
    <div class="row">
        <div class="layui-col-md2" style="background: white;width: 14.666667%;height: 100vh;  box-shadow: #b9b9b9 10px 10px 30px 5px;">
            <div class="layui-col-md8" style="margin-left: 25px;">
                <div class="thumbnail">
                    <img src="../img/apple.jpg" class="img-responsive img-circle"onload="DrawImage(this)">
                </div>
            </div>
            <div class="layui-col-md10 text-center" id="tab">
                <input type="button" class="tab-btn" value="个人信息">
                <input type="button" class="tab-btn" value="修改密码">
            </div>
            <div class="layui-col-md10 text-center"style="margin-top: 30%;padding: 10px">
                <span class="layui-icon layui-icon-login-wechat "></span>
                <span class="layui-icon layui-icon-login-qq "></span>
                <span class="layui-icon layui-icon-login-weibo "></span>
            </div>

        </div>
        <div class="layui-col-md10 layui-col-xs3 layui-col-sm3">
            <ul class="layui-nav  layui-col-md-offset7">
                <li class="layui-nav-item">
                    <a href="../forjsp/index.jsp" >首页</a>
                </li>
                <li class="layui-nav-item">
                    <a href="../forjsp/garbage.jsp">分类指南</a>
                </li>
                <li class="layui-nav-item">
                    <a href="../forjsp/news_center.jsp">新闻中心</a>
                </li>
                <li class="layui-nav-item">
                    <a href="../forjsp/message.jsp">交流中心</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/RemoveOut">退出</a>
                </li>
            </ul>
        </div>
        <div  class="layui-col-md7 layui-col-xs4 layui-xol-sm3" id="tab-content">
            <form class="layui-form layui-col-md-offset5" action="/UserAlter" method="post">
                <!--用户名-->
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block ">
                        <input type="text" name="username" value="<%=user.getLoginName()%>" readonly required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-block ">
                        <input type="text" name="akaname" value="<%=user.getName()%>" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <%--<!--电话-->--%>
                <%--<div class="layui-form-item">--%>
                    <%--<label class="layui-form-label">电话</label>--%>
                    <%--<div class="layui-input-block ">--%>
                        <%--<input type="text" name="" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<!--邮箱-->--%>
                <%--<div class="layui-form-item">--%>
                    <%--<label class="layui-form-label">邮箱</label>--%>
                    <%--<div class="layui-input-block">--%>
                        <%--<input type="text" name="t" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">--%>
                    <%--</div>--%>
                <%--</div>--%>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block" style="color: black">
                        <input type="radio" <%=user.getSex().equals("男")?"checked":""%> name="sex" value="男" title="男">
                        <input type="radio" <%=user.getSex().equals("女")?"checked":""%> name="sex" value="女" title="女">
                    </div>
                </div>
                <div class="layui-form-item text-center layui-col-md-offset3">
                    <button class="layui-btn" lay-submit >修改</button>
                </div>
            </form>

            <form class="layui-form layui-col-md-offset5"style="display: none;" action="/userAlterpass" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" readonly value="<%=user.getLoginName()%>" required  lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="newpassword" required  lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="" required  lay-verify="required" placeholder="请再次确认密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item text-center layui-col-md-offset3">
                    <button class="layui-btn" lay-submit >修改</button>
                </div>
            </form>

        </div>
    </div>
</div>



<script src="../layui-v2.5.5/layui/layui.all.js" charset="utf-8"></script>

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.on('edit(test3)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            layer.msg('修改成功');
        });
    });
</script>
<script src="../js/user_center.js"></script>
</body>
</html>