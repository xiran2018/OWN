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
	-->
	
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript">
	   (function($){
	        var silde = {
	            init:function(){
	                this.auto();
	            },
	            auto:function(){
	                var _root = this,
	                    $ul = $("#sidle").find("ul"),
	                    $lis = $ul.children("li"),
	                    width = $lis.eq(0).width();
	                setInterval(function(){
	                    $ul.animate({
	                            'margin-left':'-'+ width +'px'
	                        },
	                        'slow',
	                        function(){
	                            //此处保证能循环轮播
	                            //将已经轮播过的节点的第一张图片添加到末尾的位置
	                            //再将margin-left重置为0px;
	                            //这样就能一直的循环下去.
	                            $ul.css({'margin-left':0}).
	                                children('li').
	                                last().
	                                after(
	                                    $ul.children('li').first()
	                                );
	                        });
	                    },2000
	                );
	            }
	        };
	        $(function(){silde.init();})
	    })(jQuery);
	</script>
	
	<style type="text/css">
	.list{
    width:538px;
    height:198px;
    overflow:hidden;
    margin:50px auto;
}
.list ul{
    width:2152px;
    height:198px;
    margin:0;
    padding:0;
}
.list ul li{
    float:left;
    width:538px;
}</style>

  </head>
  
  <body>
        <div class="list" id = "sidle">
        <ul>
            <li><img src="http://litbimg.rightinthebox.com/images/wholesale/201411/20141107fangkuaitu.jpg" width="538" height="198" /></li>
            <li><img src="http://litbimg.rightinthebox.com/images/wholesale/201411/20141107fangkuaitu.jpg" width="538" height="198" /></li>
            <li><img src="http://litbimg.rightinthebox.com/images/wholesale/201411/20141107fangkuaitu.jpg" width="538" height="198" /></li>
            <li><img src="http://litbimg.rightinthebox.com/images/wholesale/201411/20141107fangkuaitu.jpg" width="538" height="198" /></li>
        </ul>
    </div>
  </body>
</html>
