<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>商店页脚信息管理</title>
		
 		<!-- 网页整体布局样式 ，，超链接样式-->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/product_attribute.css">
        <!-- header导航栏样式 -->
        <link rel="stylesheet" type="text/css" href="css/admin_full.css">

        
        
        <!-- 表格和字体 -->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">

        <!-- 点击之后，隐藏左右两边的导航窗口 -->
        <script src="jqladmin/js/left-right.js" type="text/javascript"></script>
        
        <!-- js和jquery相关 -->
        <script type="text/javascript" src="jqladmin/js/json2.js"></script>
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script> 
        <!-- <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>-->
        <script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
        
        
        <!-- ueditor相关 -->
        <script src="ueditor/ueditor.config.js"></script>
		<script src="ueditor/ueditor.all.min.js"></script>
		<link rel="stylesheet" type="text/css" href="ueditor/themes/default/css/ueditor.css"/>
        
        <!-- 左边导航栏点击之后隐藏动作 -->
        <script src="jqladmin/usermanage/js/common.js" type="text/javascript"></script>
        
        
        <!-- ------------------------------和本网页相关--------------------------------------- -->
        <!-- 添加用户信息操作等 -->
		<script src="jqladmin/usermanage/js/user.js" type="text/javascript"></script>
		<!-- 生成验证码 -->
		<script type="text/javascript" src="js/util.js"></script>
        <!-- ------------------------------和本网页相关--------------------------------------- -->
		
		
		<SCRIPT type="text/javascript">

		</SCRIPT>
		<style type="text/css">

		</style> 
        
	</head>
	<body>
		<div id="header">
		    
			 <%@ include file="../Header.jsp"%>
			 
		</div>

		

		<div id="container">
			<div id="content">
			   <div id="contentInnerWraper" style=" min-height: 100%;">
			        <div class="picBox" onclick="switchSysBar()" id="switchPoint"  style="background-image: url(../images/right.gif);"></div>
					<div id="show_content_div" >
				   	
						<div>
				         <center>
				            <div style="width:90%;height:70%">
				            <textarea name="content" id="myEditor" style="width:100%;height:60%"></textarea>
				            </div>
							<script type="text/javascript">
							    //var editor = new UE.ui.Editor();
							    //editor.render("myEditor",{
						        //    initialFrameWidth: 800,
						        //    initialFrameHeight: 500,
						        //	});
							    
							    //1.2.4以后可以使用一下代码实例化编辑器
							    //UE.getEditor('myEditor',{
						        //    initialFrameWidth: 800,
						        //    initialFrameHeight: 500,
						        //	});
							    
							    var editor=UE.getEditor('myEditor');
							</script>
							
							<div style="clear:both"></div>
							
							<div>
				            <input id="submitB" type="button" value="提交"/>
				            </div>
						    <script type="text/javascript">
						    
						    function loadStoreFooterInfo()
						    {
						    	var actionUrl = "getStoreFooter.action"
						    	$.ajax( { //获取页脚信息
			    		       		url : actionUrl,
			    		       		type : "post",
			    		       		dataType : "json",
			    		       		error : function(data) 
			    		       		{
			    		       			if(data.status=="200")
			    		    			{
			    		    				alert("请再刷新一次!!!!");
			    		    			}
			    		    			else if(data.status=="500")
			    		    			{	
			    		    				alert("由于服务器原因，加载信息失败!!!!");
			    		    			}
			    		       		},
			    		       		success : function(data) 
			    		       		{
			    		       			//alert(data);
			    		       			if(data!=null)
			    		       			{
				    		       			editor.setContent(data);
			    		       			}
			    		       			
			    		       		}
			    		       	});// end of ajax
						    }
						    
						    $(function(){
						    		
						    	  editor.ready(function(){loadStoreFooterInfo();});	
						    	
						    	   $("#submitB").click(function()
						    		        {
						    		            var ue1=UE.getEditor('myEditor'); 
						    		            var html = ue1.getContent();
						    		            //alert(html);
						    		            //插入数据至后台文件
						    		        	var actionUrl = "setStoreFooter.action"
							    		       	 
							    		       	 var params=
							    		       	 {
							    		       		   "info":html
							    		       	 };
							    		       	 
							    		       	$.ajax( { //登录
							    		       		url : actionUrl,
							    		       		type : "post",
							    		       		data:params,
							    		       		dataType : "json",
							    		       		error : function(data) 
							    		       		{
							    		       			if(data.status=="200")
							    		    			{
							    		    				alert("请再试一次!!!!");
							    		    			}
							    		    			else if(data.status=="500")
							    		    			{	
							    		    				alert("由于服务器原因，添加失败!!!!");
							    		    			}
							    		       		},
							    		       		success : function(data) 
							    		       		{
							    		       			alert("保存成功");
							    		       			
							    		       		}
							    		       	});// end of ajax
							    		    }        
						    		     
						    		     );
						    });
						    </script>

				            </center>
				        </div>
					</div>
	<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->
					
			   </div>

			</div>
			
			
			<div id="side">					
                <center>
                    <%@ include file="storeCommon.jsp"%>
                </center>


			</div>
			
			
			<div id="rightSide">					

			</div>

		</div>
	</body>
	<!-- <script type="text/javascript" src="jqladmin/js/rentclick.js"></script> -->
</html>