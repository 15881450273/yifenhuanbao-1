$(function(){
    $("#more").click(function(){
        window.location.href="../forjsp/garbage_dry.jsp?type=干垃圾";
        event.preventDefault()
    });
    $(".garbage_name>li").mouseover(function(){
        $(this).addClass("current");
        $(this).siblings().removeClass("current");
        var index=$(this).index();
        $li=$(".garbage_img>li").eq(index);
        ($li).addClass("show");
        ($li).siblings().removeClass("show");
        //console.log(index);
        if(index==0){
            $("#more").click(function(){
                window.location.href="../forjsp/garbage_dry.jsp?type=干垃圾";
            });
        }
        else if(index==1){
            $("#more").click(function(){
                window.location.href="../forjsp/garbage_wet.jsp?type=湿垃圾";
            });
        }
        else if(index==2){
            $("#more").click(function(){
                window.location.href="../forjsp/garbage_harmful.jsp?type=有害垃圾";
            });
        }
        else if(index==3){
            $("#more").click(function(){
                window.location.href="../forjsp/garbage_cycle.jsp?type=可回收物";
            });
        }
    });
});