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
		<title>Full Layout - jQuery EasyUI Demo</title>
		<link rel="stylesheet" type="text/css" href="css/easyui.css">
		<link rel="stylesheet" type="text/css" href="css/icon.css">
		<link rel="stylesheet" type="text/css" href="css/demo.css">
		
		<link rel="stylesheet" type="text/css" href="jqladmin/css/product_attribute.css">
		<link rel="stylesheet" type="text/css" href="css/admin_full.css">
		
		<script type="text/javascript" src="jqladmin/js/json2.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
		<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
		<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/product.js"></script>	
		<script src="jqladmin/js/left-right.js" type="text/javascript"></script>
		
		<%--<script src="jqladmin/js/mzone.cc.iframe.js" type="text/javascript"></script>--%>
		
		<SCRIPT type="text/javascript">


		
		function setIframeHeight() 
		{
	           var iframe = document.getElementById("show_content");
	           try 
	           {
	               var bHeight = iframe.contentWindow.document.body.scrollHeight;
	               var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
	               var height = Math.min(bHeight, dHeight);
	               //var height = Math.max(bHeight, dHeight);
	               iframe.height = height;
	           } 
	           catch (ex)
	            { }
	     }
	 
		   function setAreaSize() 
		   {
	            var iframe = document.getElementById("show_content");
	            var bHeight = iframe.contentWindow.document.body.scrollHeight;
	            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
	            var innerHeight = Math.min(bHeight, dHeight);
	            //var height = Math.max(bHeight, dHeight);
	            iframe.height = Math.max(innerHeight, outerHeight);
	       }
		    $(document).ready(function () {
		        setAreaSize();
		    });
		
		    $(window).resize(function () {
		        setAreaSize();
		    });
		</SCRIPT>
		<style type="text/css">
		.ztree li span.button.add {
			margin-left: 2px;
			margin-right: -1px;
			background-position: -144px 0;
			vertical-align: top; *
			vertical-align: middle
		}
		</style> 
        
	</head>
	<body>
		<div id="header">
			<%@ include file="Header.jsp"%>
		</div>

		

		<div id="container">
			<div id="content">
			   <div id="contentInnerWraper">
				   	<div class="picBox" onclick="switchSysBar()" id="switchPoint"></div>
					<div id="show_content_div" >
						<iframe id="show_content"  src="jqladmin/iframe/add_product.jsp" name="show_content" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes">
						</iframe>
					</div>
	
					<div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div>
			   </div>

			</div>
			
			
			<div id="side">					

							<center>
								<button class="sel_button" id="add_product"> 
									商品批量上传
								</button>
								
								<button class="sel_button" id="manger_product">
									商品管理
								</button>
							</center>

			</div>
			
			
			<div id="rightSide">					

			</div>

		</div>
	</body>
</html>