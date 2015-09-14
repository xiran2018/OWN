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
		<link rel="stylesheet" type="text/css"
			href="jqladmin/css/brand_series.css">

		<link rel="stylesheet" type="text/css" href="css/demo.css">

		<link rel="stylesheet" type="text/css" href="css/admin_full.css">

		<script type="text/javascript" src="jqladmin/js/json2.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>


		<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
		<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css"
			type="text/css">
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript"
			src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript"
			src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>

		<script type="text/javascript" src="jqladmin/js/brand-series.js"></script>

		<SCRIPT type="text/javascript">
	//-->
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
				<iframe id="show_content"  height=100% name="show_content" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes">
				</iframe>
			</div>
			<div id="side" style="height: 100%;">

					<center>
						<button class="sel_button" id="add_brand_series"> 
							添加品牌
						</button>
						
						<button class="sel_button" id="manger_brand_series">
							品牌管理
						</button>
					</center>
			</div>

		</div>
	</body>
</html>