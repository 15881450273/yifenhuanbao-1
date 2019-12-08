<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/14
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
    <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
    <title>百度地图API自定义地图</title>
    <!--引用百度地图API-->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ilNYTsT3wVM6QYeA4N3G3Rz0nlK0GXjc"></script>
</head>

<body>
<!--百度地图容器-->
<div style="width:100%;height:550px;border:#ccc solid 1px;font-size:12px" id="map"></div>
<p style="color:red;font-weight:600">地图生成工具基于百度地图JS api v2.0版本开发，使用请申请密匙。
    <a href="http://developer.baidu.com/map/index.php?title=jspopular/guide/introduction" style="color:#2f83c7" target="_blank">了解如何申请密匙</a>
    <a href="http://lbsyun.baidu.com/apiconsole/key?application=key" style="color:#2f83c7" target="_blank">申请密匙</a>
</p>
</body>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMapOverlay();//向地图添加覆盖物
    }
    function createMap(){
        map = new BMap.Map("map");
        map.centerAndZoom(new BMap.Point(104.195045,30.838071),19);
    }
    function setMapEvent(){
        map.enableScrollWheelZoom();
        map.enableKeyboard();
        map.enableDragging();
        map.enableDoubleClickZoom()
    }
    function addClickHandler(target,window){
        target.addEventListener("click",function(){
            target.openInfoWindow(window);
        });
    }
    function addMapOverlay(){
        var markers = [
            {content:"我的备注",title:"垃圾分类桶位置",imageOffset: {width:0,height:3},position:{lat:30.830075,lng:104.192404}},
            {content:"我的备注",title:"垃圾分类桶位置",imageOffset: {width:0,height:3},position:{lat:30.83106,lng:104.193149}},
            {content:"我的备注",title:"垃圾分类桶位置",imageOffset: {width:0,height:3},position:{lat:30.831753,lng:104.19301}},
            {content:"我的备注",title:"垃圾分类桶位置",imageOffset: {width:0,height:3},position:{lat:30.831637,lng:104.193706}},
            {content:"我的备注",title:"垃圾分类桶位置",imageOffset: {width:0,height:3},position:{lat:30.832862,lng:104.193756}},
            {content:"我的备注",title:"垃圾分类桶位置",imageOffset: {width:0,height:3},position:{lat:30.834943,lng:104.19336}},
            {content:"我的备注",title:"垃圾分类桶位置",imageOffset: {width:0,height:3},position:{lat:30.836629,lng:104.193441}},
            {content:"我的备注",title:"垃圾分类桶位置",imageOffset: {width:0,height:3},position:{lat:30.837757,lng:104.194771}}
        ];
        for(var index = 0; index < markers.length; index++ ){
            var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
            var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
                    imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
                })});
            var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
            var opts = {
                width: 200,
                title: markers[index].title,
                enableMessage: false
            };
            var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
            marker.setLabel(label);
            addClickHandler(marker,infoWindow);
            map.addOverlay(marker);
        };
    }
    //向地图添加控件
    function addMapControl(){
        var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
        map.addControl(scaleControl);
        var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(navControl);
        var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
        map.addControl(overviewControl);
    }
    var map;
    initMap();
</script>
</html>
