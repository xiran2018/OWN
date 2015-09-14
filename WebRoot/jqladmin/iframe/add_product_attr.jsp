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
        <link rel="stylesheet" href="jqladmin/css/add_product_attribute.css" type="text/css">
		<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/iframe_add_product_attr.js"></script>
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
	                                             请选择需要添加的属性所属的商品类别：<input id="sel_category_name" type="text" readonly value="" style="width:120px;"/>
	                  <input id="sel_category_id" type="text" readonly value="" style="display:none;width:120px;"/>
	                <a id="menuBtn" href="#" onclick="showMenu(); return false;">选择</a></li>
	            </ul>
	        </div>
	        

	        
	        <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
	            <ul id="category_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
	        </div>  <!-- 显示商品分类 -->


			<div id="add_product_attr"  title="添加商品属性"
				style="width: 900px; height: 700px; padding: 10px;">
				<table style="width: 900" border=0 cellspacing=0 cellpadding=3 align=center>
					<tr>
						<td valign=middle  align=right>
							属性名称：
						</td>
						<td valign=middle>
							<INPUT id=name name=name type=text type="width: 233;">
						</td>
					</tr>
					<tr>
                        <td valign=middle  align=right>
                                                                           属性別名：
                        </td>
                        <td valign=middle>
                            <INPUT id=other_name name=other_name type=text type="width: 233;">
                        </td>
                    </tr>	
                    <tr>
                        <td valign=middle  align=right>
                                                                           能否进行检索：
                        </td>
                        <td valign=middle>
							<input type="radio" name="search" value="1" checked="checked">
                                                                             是
							<input type="radio" name="search" value="0">
							  否
                        </td>
                    </tr>	
                    <tr>
                        <td valign=middle  align=right>
                                                                           状态：
                        </td>
                        <td valign=middle>
							<input type="radio" name="status" value="1" checked="checked">
                                                                             可用 
							<input type="radio" name="status" value="0">
							  不可用 
                        </td>
                    </tr>	
                    <tr>
                        <td valign=middle  align=right>
                                                                           该属性值的录入方式：   
                        </td>
                        <td valign=middle>
                            <input type="radio" name="input_style" value="1" checked="checked">
                                                                                         手工录入 
                            <input type="radio" name="input_style" value="2">
                                                                                        从下面的列表中选择（一行代表一个可选值）
                            <input type="radio" name="input_style" value="3">
                                                                                        多行文本框
                        </td>
                    </tr>  
                   <tr>
                        <td valign=middle  align=right>
                                                                         可选值列表：   
                        </td>
                        <td valign=middle style="width: 700px;">
                            <div id="attr_values">
                                <span id="attr_value_span">
                                    <input type="text"  id="attr_value_input" value="请输入" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999"/>
                                    <a id="add_value" href="javascript:void(0);" onclick="addAttrValues(this)" class="" id="add_but"></a>
                                </span>
                            </div>
                            
                           <div id="input_attr_values">

                           </div>
                            
                            <!-- 
                            <textarea id=attr_values name=attr_values cols="30" rows="5" style="resize: none;"></textarea>   
                             -->
                                                                     
                        </td> 
                    </tr>   
                    <!--  
                    <tr>
                        <td valign=middle  align=right>
                             Test：   
                        </td>
                        <td valign=middle>
                                                                                         手工录入: 
                            <input type="checkbox" name="style" value="1" checked="checked">
                                                                                        从下面的列表中选择: 
                            <input type="checkbox" name="style" value="2">
                                                                                        多行文本框: 
                            <input type="checkbox" name="style" value="3">
                        </td>
                    </tr>   
                    -->
					<tr>
						<td valign=middle align=right>
							Title：
						</td>
						<td valign=middle>
							<textarea id=title name=title cols="30" rows="5" style="resize: none;"></textarea>
						</td>
					</tr>	
					
					<tr>
						<td valign=middle align=right>
							Keywords：
						</td>
						<td valign=middle>
							<textarea id=keywords name=keywords cols="30" rows="5" style="resize: none;"></textarea>
						</td>
					</tr>
					
					<tr>
						<td valign=middle align=right>
							Description：
						</td>
						<td valign=middle>
							<textarea id=description name=description cols="30" rows="5" style="resize: none;"></textarea>
						</td>
					</tr>
									
					<tr>
    					<td valign=middle colspan=2 align=center>
    					 	<button class="add_button" onclick="javascript:save_product_attr()">添加 </button> 
    					</td>
 					</tr>	

				</table>
			</div>
			</center>
		</div>
	</body>
</html>