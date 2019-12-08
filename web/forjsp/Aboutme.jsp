<%@ page import="com.nddmwdf.program.entity.User" %>
<%@ page import="com.nddmwdf.program.dao.UserDao" %>
<%@ page import="com.nddmwdf.program.entity.Message_port" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.nddmwdf.program.entity.invitation" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/27
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    User user = (User)session.getAttribute("user");
    UserDao userDao=new UserDao();
    int U_id= user.getId();//得到登录用户ID
    ArrayList<Message_port> m_list = userDao.port_Message(-1,U_id);
    String loginName=user.getLoginName();
    String sex=user.getSex();
%>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
    <link rel="script" href="../bootstrap-3.3.7/dist/js/bootstrap.min.js">
    <link rel="stylesheet" href="../bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet" href="../css/user_center.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/comment.css">
</head>
<style>
    .layui-col-md-offset1 {
        margin-left: 6.033333%;
    }
</style>
<body>
<div class="layui-fluid" style="background: url(../img/houndstooth-pattern.png)">
    <div class="row">
        <div class="layui-col-md5" style="background: #009688;width: 14.666667%;height: 100vh;  box-shadow: #b0b0b0 10px 10px 30px 5px;">
            <div class="layui-col-md10" style="margin-left: 20px; padding-top: 80px;">
                <div class="thumbnail" style="margin-top: 0px;">
                    <img src="../img/vator.jpeg" class="img-circle">
                </div>
            </div>
            <div class="layui-col-md10 text-center" id="tab">
                <div class="layui-col-md-offset1">
                    <h3 class="style-right"><%=loginName%></h3>
                    <h4 class="style-right"><%=sex%></h4>
                </div>
            </div>
            <div class="layui-col-md10 text-center"style="margin-top: 30%;padding: 10px;">
                <span class="layui-icon layui-icon-login-wechat icon-size"></span>
                <span class="layui-icon layui-icon-login-qq icon-size"></span>
                <span class="layui-icon layui-icon-login-weibo icon-size"></span>
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
                    <a href="../forjsp/message.jsp">返回</a>
                </li>
            </ul>
        </div>
        <div  class="layui-col-md9 layui-col-xs4 layui-xol-sm3 layui-col-md-offset1" id="tab-content">
            <div class="commentAll">
                <h5>与我相关</h5>
            </div>
            <%
            if(m_list.size()>0)
            {
                for (int j=0;j<m_list.size();j++)//从取出的评论信息中，然后根据这条评论信息涉及的用户ID和帖子ID来找到帖子和相关的评论
                {
                ArrayList<invitation> list1 = userDao.post_invitation(m_list.get(j).getUser_id(),m_list.get(j).getPost_id());//帖子
                if(list1.size()>0)
                {
                    User guess=userDao.getUser(m_list.get(j).getMessage_port_id());
                    String guessname=guess.getLoginName();
                    ArrayList<Message_port> R_list = userDao.port_Message1(list1.get(0).getPost_id(),list1.get(0).getUser_id(),m_list.get(j).getMessage_port_id());
                    if(R_list.size()>0)
                    for(int k=0;k<R_list.size();k++)
                    {
                        if(R_list.get(k).getMessage_port_id()==m_list.get(j).getMessage_port_id())
                        {
            %>
            <div class="commentAll grid-demo">
                <div class="comment-show">
                    <div class="comment-show-con clearfix">
                        <div class="comment-show-con-img layui-col-md1 layui-col-xs4 pull-left thumbnail">
                            <img src="../img/vator.jpeg" class="img-circle" alt="">
                        </div>
                        <div class="comment-show-con-list pull-left clearfix layui-col-md9">
                            <div class="pl-text clearfix">
                                <a href="#" class="comment-size-name"><%=guessname%> : </a>
                                <span class="my-pl-con">&nbsp;<%=R_list.get(k).getMessage_content()%></span>
                            </div>
                            <div class="date-dz">
                                <span class="date-dz-left pull-left comment-time"><%= m_list.get(j).getMessage_time()%></span>
                                <div class="date-dz-right pull-right comment-pl-block">
                                    <%--<a href="javascript:;" class="removeBlock layui-icon layui-icon-delete">删除</a>--%>
                                    <%--<a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left"><span class="layui-icon layui-icon-dialogue">回复</span></a>--%>
                                    <%--<span class="pull-left date-dz-line">|</span>--%>
                                    <%--<a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red layui-icon layui-icon-praise"></i>赞 (<i class="z-num">666</i>)</a>--%>
                                </div>
                            </div>
                            <div class="hf-list-con"></div>
                        </div>
                    </div>
                </div>
                <!--回复区域 end-->
            </div>
            <%
                                }
                            }
                        }
                    }
                }
            %>
            <script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script>
            <script type="text/javascript" src="../js/jquery.flexText.js"></script>
            <!--textarea高度自适应-->
            <script type="text/javascript">
                $(function () {
                    $('.content').flexText();
                });
            </script>
            <!--textarea限制字数-->
            <script type="text/javascript">
                function keyUP(t){
                    var len = $(t).val().length;
                    if(len > 139){
                        $(t).val($(t).val().substring(0,140));
                    }
                }
            </script>
            <!--点击评论创建评论条-->
            <!--点击回复动态创建回复块-->
            <script type="text/javascript">
                $('.comment-show').on('click','.pl-hf',function(){
                    //获取回复人的名字
                    var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
                    //回复@
                    var fhN = '回复@'+fhName;
                    //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
                    var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl layui-btn">评论</a></div>';
                    //显示回复
                    if($(this).is('.hf-con-block')){
                        $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
                        $(this).removeClass('hf-con-block');
                        $('.content').flexText();
                        $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
                        //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
                        //input框自动聚焦
                        $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
                    }else {
                        $(this).addClass('hf-con-block');
                        $(this).parents('.date-dz-right').siblings('.hf-con').remove();
                    }
                });
            </script>
            <!--评论回复块创建-->
            <script type="text/javascript">
                $('.comment-show').on('click','.hf-pl',function(){
                    var oThis = $(this);
                    var myDate = new Date();
                    //获取当前年
                    var year=myDate.getFullYear();
                    //获取当前月
                    var month=myDate.getMonth()+1;
                    //获取当前日
                    var date=myDate.getDate();
                    var h=myDate.getHours();       //获取当前小时数(0-23)
                    var m=myDate.getMinutes();     //获取当前分钟数(0-59)
                    if(m<10) m = '0' + m;
                    var s=myDate.getSeconds();
                    if(s<10) s = '0' + s;
                    var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;

                    //获取输入内容
                    var oHfVal = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
                    var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
                    var oAllVal = '回复@'+oHfName;
                    //动态创建评论模块
                    var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 </a><span class="my-pl-con">'+oHfVal+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock layui-icon layui-icon-delete">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left layui-icon layui-icon-dialogue">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red layui-icon layui-icon-praise"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>';
                    oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();

                });
            </script>
            <!--删除评论块-->
            <script type="text/javascript">
                $('.commentAll').on('click','.removeBlock',function(){
                    var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
                    if(oT.siblings('.all-pl-con').length >= 1){
                        oT.remove();
                    }else {
                        $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
                        oT.remove();
                    }
                    $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').parents('.commentAll').remove();

                })
            </script>
            <!--点赞-->
            <script type="text/javascript">
                $('.comment-show').on('click','.date-dz-z',function(){
                    var zNum = $(this).find('.z-num').html();
                    if($(this).is('.date-dz-z-click')){
                        zNum--;
                        $(this).removeClass('date-dz-z-click-red');
                        $(this).find('.z-num').html(zNum);
                        $(this).find('.date-dz-z-click').removeClass('red');
                    }else {
                        zNum++;
                        $(this).addClass('date-dz-z-click');
                        $(this).find('.z-num').html(zNum);
                        $(this).find('.date-dz-z-click-red').addClass('red');
                    }
                })
            </script>
            <script type="text/javascript">
                $('.comment-show').on('click','.date-dz-z',function(){
                    var zNum = $(this).find('.z-num').html();
                    if($(this).is('.date-dz-z-click')){
                        zNum--;
                        $(this).removeClass('date-dz-z-click red');
                        $(this).find('.z-num').html(zNum);
                        $(this).find('.date-dz-z-click-red').removeClass('red');
                    }else {
                        zNum++;
                        $(this).addClass('date-dz-z-click');
                        $(this).find('.z-num').html(zNum);
                        $(this).find('.date-dz-z-click-red').addClass('red');
                    }
                })
            </script>
        </div>
    </div>
</div>


<!--<script type="text/javascript" src="js/jquery-1.12.0.min.js"></script>-->
<script type="text/javascript" src="../js/jquery.flexText.js"></script>
<script src="../layui-v2.5.5/layui/layui.all.js" charset="utf-8"></script>

<script>
    layui.use(['table','jquery'], function(){
        var table = layui.table
            ,jquery=layui.jquery;

        table.on('edit(test3)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            layer.msg('修改成功');
        });
    });
</script>
<!--点赞-->

<script src="../js/user_center.js"></script>
</body>
</html>
