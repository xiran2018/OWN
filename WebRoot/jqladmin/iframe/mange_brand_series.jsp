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
		<link rel="stylesheet" type="text/css" href="css/easyui.css">
		<link rel="stylesheet" type="text/css" href="css/icon.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/iframe_brand_series.css">

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
			
		<script type="text/javascript" src="jqladmin/js/iframe_mange_brand-series.js"></script>

		<SCRIPT type="text/javascript">
        <!--
            
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
	<body >
		<div>
		
			<div>
	            <ul>
	                <li class="title">
	                                             请选择需要显示的品牌所属的商品类别：<input id="sel_brand_name" type="text" readonly value="" style="width:120px;"/>
	                  <input id="sel_category_id" type="text" readonly value="" style="display:none;width:120px;"/>
	                <a id="menuBtn" href="#" onclick="showMenu(); return false;">选择</a></li>
	            </ul>
	        </div>
	        

	        
	        <div id="brand_series_show">
	           <table id="brand_series_show_table" style="width:1000px"></table>
	        </div> <!-- 显示商品品牌 -->
	        

	        
	        <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
	            <ul id="category_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
	        </div>  <!-- 显示商品分类 -->


			<div id="add_brand_series" class="easyui-window" title="添加商品品牌系列"
				data-options="modal:true,closed:true,iconCls:'icon-save'"
				style="width: 500px; height: 500px; padding: 10px;">
				<table style="width: 500" border=0 cellspacing=0 cellpadding=3 align=center>
					<tr>
						<td valign=middle  align=right>
							所属品牌:
						</td>
						<td valign=middle>
							<span id="belong_brand"></span>
						</td>
					</tr>
					<tr style="display: none">
						<td valign=middle  align=right>
							父元素值id:
						</td>
						<td valign=middle>
							<input id="parent_id" type=text>
						</td>
					</tr>
					<tr>
						<td valign=middle  align=right>
							品牌(系列)名称：
						</td>
						<td valign=middle>
							<INPUT id=brand_name name=brand_name type=text>
						</td>
					</tr>				
					<tr>
						<td valign=middle align=right>
							Title：
						</td>
						<td valign=middle>
							<textarea id=brand_title name=brand_title cols="30" rows="5"></textarea>
						</td>
					</tr>	
					
					<tr>
						<td valign=middle align=right>
							Keywords：
						</td>
						<td valign=middle>
							<textarea id=brand_keywords name=brand_keywords cols="30" rows="5"></textarea>
						</td>
					</tr>
					
					<tr>
						<td valign=middle align=right>
							Description：
						</td>
						<td valign=middle>
							<textarea id=brand_description name=brand_description cols="30" rows="5"></textarea>
						</td>
					</tr>
									
					<tr>
    					<td valign=middle colspan=2 align=center>
    					 	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:save_product_brand()">保存</a>
							<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#add_brand_series').window('close')">取消</a>
    					</td>
 					</tr>	

				</table>
			</div>
			
			<div id="modify_brand_series" class="easyui-window" title="修改商品类目"
                data-options="modal:true,closed:true,iconCls:'icon-save'"
                style="width: 500px; height: 450px; padding: 10px;">
                <table style="width: 500" border=0 cellspacing=0 cellpadding=3 align=center>
                    <tr style="display: none">
                        <td valign=middle  align=right>
                                                                        本元素值id:
                        </td>
                        <td valign=middle>
                            <input id="self_id" type=text>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td valign=middle  align=right>
                                                                          父元素值id:
                        </td>
                        <td valign=middle>
                            <input id="modify_father_id" type=text>
                        </td>
                    </tr>
                    <tr>
                        <td valign=middle  align=right>
                                                                        品牌（系列）名称：
                        </td>
                        <td valign=middle>
                            <INPUT id=modify_brand_name name=modify_brand_name type=text>
                        </td>
                    </tr>               
                    <tr>
                        <td valign=middle align=right>
                            Title：
                        </td>
                        <td valign=middle>
                            <textarea id=modify_brand_title name=modify_brand_title cols="30" rows="5"></textarea>
                        </td>
                    </tr>   
                    
                    <tr>
                        <td valign=middle align=right>
                            Keywords：
                        </td>
                        <td valign=middle>
                            <textarea id=modify_brand_keywords name=modify_brand_keywords cols="30" rows="5"></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <td valign=middle align=right>
                            Description：
                        </td>
                        <td valign=middle>
                            <textarea id=modify_brand_description name=modify_brand_description cols="30" rows="5"></textarea>
                        </td>
                    </tr>
                                    
                    <tr>
                        <td valign=middle colspan=2 align=center>
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:modify_product_brand()">保存</a>
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#modify_brand_series').window('close')">取消</a>
                        </td>
                    </tr>   

                </table>
            </div>
			
		</div>
	</body>
</html>