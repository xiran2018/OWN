<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" type="text/css" href="jqladmin/css/iframe_add_brand_series.css">
		<script type="text/javascript" src="jqladmin/js/json2.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>
        <link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
		<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/iframe_add_brand_series.js"></script>
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
	<body >
		<div>
		 <center>
			<div>
	            <ul style="margin-top: 50px">
	                <li class="title">
	                                             请选择需要添加的品牌所属的商品类别：<input id="sel_brand_name" type="text" readonly value="" style="width:120px;"/>
	                  <input id="sel_category_id" type="text" readonly value="" style="display:none;width:120px;"/>
	                <a id="menuBtn" href="#" onclick="showMenu(); return false;">选择</a></li>
	            </ul>
	        </div>
	        

	        
	        <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
	            <ul id="category_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
	        </div>  <!-- 显示商品分类 -->


			<div id="add_brand_series"  title="添加商品品牌系列"
				style="width: 500px; height: 500px; padding: 10px;">
				<table style="width: 500" border=0 cellspacing=0 cellpadding=3 align=center>
					<tr>
						<td valign=middle  align=right>
							品牌(系列)名称：
						</td>
						<td valign=middle>
							<INPUT id=brand_name name=brand_name type=text type="width: 233;">
						</td>
					</tr>				
					<tr>
						<td valign=middle align=right>
							Title：
						</td>
						<td valign=middle>
							<textarea id=brand_title name=brand_title cols="30" rows="5" style="resize: none;"></textarea>
						</td>
					</tr>	
					
					<tr>
						<td valign=middle align=right>
							Keywords：
						</td>
						<td valign=middle>
							<textarea id=brand_keywords name=brand_keywords cols="30" rows="5" style="resize: none;"></textarea>
						</td>
					</tr>
					
					<tr>
						<td valign=middle align=right>
							Description：
						</td>
						<td valign=middle>
							<textarea id=brand_description name=brand_description cols="30" rows="5" style="resize: none;"></textarea>
						</td>
					</tr>
									
					<tr>
    					<td valign=middle colspan=2 align=center>
    					 	<button class="add_brand_button" onclick="javascript:save_product_brand()">添加 </button> 
    					</td>
 					</tr>	

				</table>
			</div>
			</center>
		</div>
	</body>
</html>