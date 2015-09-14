<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'imagePlay.jsp' starting page</title>
    
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
<link rel="stylesheet" type="text/css" href="styles.css">

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
-->
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(document).ready(function () {
        (new CenterImgPlay1()).Start();
    });
    function CenterImgPlay1() 
    {
        this.list = $(".imgbox").children(":first").children();
        this.indexs = [];
        this.length = this.list.length;
        //图片显示时间
        this.timer = 3000;
        this.showTitle = $(".title");

        var index = 0, self = this, pre = 0, handid, isPlay = false, isPagerClick = false;

        this.Start = function () 
        {
            this.Init();
            //计时器，用于定时轮播图片
            handid = setInterval(function(){self.Play()}, this.timer);
            
        };
        //初始化
        this.Init = function () 
        {
        	$(".imgbox").hover(
                    function(){ console.log("hover clearInterval+++index="+index+"  pre="+pre);clearInterval(handid);},
                    function(){ handid = setInterval(function () { self.Play() }, self.timer); });
        	 //$(".imgbox").mouseenter(function () { clearInterval(handid); }).mouseleave(function () { handid = setInterval(function () { self.Play() }, self.timer); });

        	
            var o = $(".pager ul li");

            for (var i = o.length - 1, n = 0; i >= 0; i--, n++) 
            {
                this.indexs[n] = o.eq(i).click(self.PagerClick);
            }
            
            
        };
        this.Play = function () 
        {
            isPlay = true;
            index++;
            if (index == self.length) 
            {//说明已经播放到了最后一个，从第一个重新开始播放
                index = 0;
            }
            
            console.log("Play+++index="+index);
            console.log("Play+++pre="+pre);
            //先淡出，在回调函数中执行下一张淡入
            self.list.eq(pre).fadeOut(300,function () { self.imageIn() });//end of fadeout
        };
        this.imageIn=function()
        {
                var info = self.list.eq(index).fadeIn(500, function () {
                    isPlay = false;
                  //此变量的作用是当点击了数字按钮之后，确保在play函数中重新进行setInterval的设置，但是因为我们添加了$(".imgbox").hover（）函数，所以此处可以去掉
                   //if (isPagerClick) { handid = setInterval(self.Play, self.timer); isPagerClick = false; }
                }).attr("title");
                
                //显示标题
                self.showTitle.text(info);
                //图片序号背景更换
                self.indexs[index].css("background-color", "#FF70Ad");
                self.indexs[pre].css("background-color", "#6f4f67");
                

                pre = index;
                console.log("imageIn+++pre="+pre);
            
        }
        //图片序号点击
        this.PagerClick = function () 
        {
        	//此变量的作用是在播放动画的时候，点击数字按钮，不改变动画的效果，播放完了再点击才可以生效
            //if (isPlay) { return; }
        	
        	//此变量的作用是当点击了数字按钮之后，确保在play函数中重新进行setInterval的设置，但是因为我们添加了$(".imgbox").hover（）函数，所以此处可以去掉
            //isPagerClick = true;

            clearInterval(handid);

            var oPager = $(this), i = parseInt(oPager.text()) - 1;

            if (i != pre) 
            {
                index = i - 1;
            }
            self.Play();
        };
    };
    //别人给修改的意见
    function CenterImgPlay() {
        this.list = $(".imgbox").children(":first").children();
        this.indexs = [];
        this.length = this.list.length;
        //图片显示时间
        this.timer = 3000;
        this.showTitle = $(".title");

        var index = 0, self = this, pre = 0, handid, isPlay = false, isPagerClick = false;

        this.Start = function () {
            this.Init();
            //计时器，用于定时轮播图片
            handid = setInterval(function(){self.Play()}, this.timer);//////////////////////////////////

        };
        //初始化
        this.Init = function () {
//////////////////////////////////
            $(".imgbox").mouseenter(function () { clearInterval(handid); }).mouseleave(function () { handid = setInterval(function () { self.Play() }, self.timer); });

            var o = $(".pager ul li");

            for (var i = o.length - 1, n = 0; i >= 0; i--, n++) {
                this.indexs[n] = o.eq(i).click(self.PagerClick);
            }


        };
        this.Play = function () {
            isPlay = true;
            index++;
            if (index == self.length) {//说明已经播放到了最后一个，从第一个重新开始播放
                index = 0;
            }

            console.log("Play+++index=" + index);
            console.log("Play+++pre=" + pre);
            //先淡出，在回调函数中执行下一张淡入
            self.list.eq(pre).fadeOut(300, function () { self.imageIn() }); //end of fadeout
        };
        this.imageIn = function () {
            var info = self.list.eq(index).fadeIn(500, function () {
                isPlay = false;
                //////////////////////////////////if (isPagerClick) { handid = setInterval(self.Play, self.timer); isPagerClick = false; }
            }).attr("title");

            //显示标题
            self.showTitle.text(info);
            //图片序号背景更换
            self.indexs[index].css("background-color", "#FF70Ad");
            self.indexs[pre].css("background-color", "#6f4f67");


            pre = index;
            console.log("imageIn+++pre=" + pre);

        }
        //图片序号点击
        this.PagerClick = function () {
            if (isPlay) { return; }
            isPagerClick = true;

            clearInterval(handid);

            var oPager = $(this), i = parseInt(oPager.text()) - 1;

            if (i != pre) {
                index = i - 1;
            }
            self.Play();
        };
    };
</script>

<style type="text/css">
 img{border-style:none;}
.imgbox{width:530px;margin:100px;height:350px;}
.imgbox img{width:530px;height:350px;}
.imgbox ul{list-style-type:none;margin:0px;padding:0px;}
.imgbox ul li{display:none;}
.title_bg{z-index:1;background-color:#000;filter:alpha(opacity=30);-moz-opacity:0.3;opacity:0.3;}
.title{z-index:2;color:#FFF;text-indent:10px;font-size:14px;line-height:40px;}
.pager{z-index:3;}
.common{position:relative;height:40px;margin-top:-43px;}
.pager ul{margin-top:5px;}
.pager ul li{float:right;color:#FFF;font-size:15px;display:block;border:2px solid #e5eaff;width:25px;height:25px;margin-right:4px;margin-top:5px;text-align:center;line-height:25px;background-color:#6f4f67;cursor:pointer;}
</style>

  </head>
  
  <body>
  <center>
    <!--整体容器-->
    <div class="imgbox">
        <!--图片列表，除第一张显示外，其余隐藏-->
        <ul>
            <li style="display: block;" title="清灵少女宛如梦境仙女"><a href="#" target="_blank">
                <img src="http://litbimg.rightinthebox.com/images/wholesale/201411/20141107fangkuaitu.jpg" /></a></li>
            <li title="美女海边性感透视装诱惑"><a href="#" target="_blank">
                <img src="http://images.cnblogs.com/cnblogs_com/babyzone2004/256463/o_p4.jpg" /></a></li>
            <li title="夏小薇：百变小魔女变身性感数码宝贝"><a href="#" target="_blank">
                <img src="http://litbimg.rightinthebox.com/images/wholesale/201411/20141107fangkuaitu.jpg" /></a></li>
            <li title="夏小薇化身《杀破狼》粉色妖姬鲜嫩欲滴"><a href="#" target="_blank">
                <img src="http://images.cnblogs.com/cnblogs_com/babyzone2004/256463/o_p4.jpg" /></a></li>
        </ul>
        <div class="title_bg common"><!--图片标题背景-->
        </div>
        <!--图片显示标题-->
        <div class="title common">titletitletitletitletitletitle</div>
        <!--图片序号-->
        <div class="pager common">
            <ul>
                <li>4</li>
                <li>3</li>
                <li>2</li>
                <li style="background: #FF70Ad;">1</li>
            </ul>
        </div>
    </div>
 </center>
  </body>
</html>