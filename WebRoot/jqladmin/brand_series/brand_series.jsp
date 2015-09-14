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
		<link rel="stylesheet" type="text/css" href="jqladmin/css/product_category.css">
		<link rel="stylesheet" type="text/css" href="css/admin_full.css">
		
		<link rel="stylesheet" href="jqladmin/css/add_product_attribute.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/inputstyle.css">
		
		<script type="text/javascript" src="jqladmin/js/json2.js"></script>
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
		<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
		<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
		
		<script src="jqladmin/js/left-right.js" type="text/javascript"></script>
		
		<!-- 加载多语言的js -->
        <script type="text/javascript" src="jqladmin/js/language.js"></script>
		
        <!--给添加的多语言添加事件的js函数 -->
		<script type="text/javascript" src="jqladmin/js/addrentclick.js"></script>
		
		<!-- 按照多语言增添相应内容的时候，展示的内容 -->
        <script type="text/javascript" src="jqladmin/js/multilang.js"></script>
		
        <!-- 添加品牌系列时的事件 -->
        <script type="text/javascript" src="jqladmin/js/iframe_add_brand_series.js"></script>
        

        
		
		<SCRIPT type="text/javascript">
		

		</SCRIPT>
		<style type="text/css">
		.ztree li span.button.add 
		{
			margin-left: 2px;
			margin-right: -1px;
			background-position: -144px 0;
			vertical-align: top; *
			vertical-align: middle
		}
		
		.panel
		{
		  width:90% !important;
		  left: 7px !important;
		}
		</style> 
        
	</head>
	<body>
		<div id="header">
		    
			 <%@ include file="../Header.jsp"%>
			 
		</div>

		

		<div id="container">
			<div id="content">
			   <div id="contentInnerWraper">
			<div class="picBox" onclick="switchSysBar()" id="switchPoint"  style="background-image: url(../images/right.gif);"></div>
					<div id="show_content_div" >
				   	
					  <div>
				       <center>
				         <div id="add_brand_series"  style="width: 100%; min-height: 500px; padding: 10px;">
				          <table style="width: 95%" border=0 cellspacing=0 cellpadding=3 align=center class="altrowstable">
						           <tr>
						            <td class="colume1" align=right>
		                                                                                          请选择添加品牌所属商品类别：
						            </td>
						            <td class="colume2" style="position: relative;">
						                    <input id="sel_brand_name" type="text" readonly value="" style="width:120px;"/>
		                                    <input id="sel_category_id" type="text" readonly value="" style="display:none;width:120px;"/>
		                                    <a id="menuBtn" href="#" onclick="showMenu(); return false;">选择</a>
		                                    <div id="menuContent" class="menuContent" style="display:none; position: absolute;z-index: 16000;">
                                            <ul id="category_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
                                            </div>  <!-- 显示商品分类 -->
						            </td>
						           </tr>
				                    <tr>
				                        <td valign=middle  align=right class="colume1">
				                                                                     品牌(系列)名称：
				                        </td>
				                        <td valign=middle class="colume2">
				                            <INPUT id=brand_name name=brand_name type=text type="width: 233;">
				                        </td>
				                    </tr> 
						            <tr >
						                <td class="colume1" valign=middle align=right>是否上架</td>
						                <td class="colume2">
						                   <input type="radio" name="status" value="1">
						                                                                             上架
						                   <input type="radio" name="status" value="0" checked="checked">
						                                                                            下架
						                </td>
						            </tr>              
				                    <tr >
				                        <td valign=middle  align=right class="colume1">
				                            <b>具体信息：</b>
				                        </td>
				                        <td id="addMultiLan" valign="top" class="colume2" style="height: 280px;">
				                            <div id="detailedcontainer">
				                                <ul id="navigation">
				                                </ul>
				                            </div>
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
					</div>
	<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->
					
			   </div>

			</div>
			
			
			<div id="side">					
                <center>
                    <%@ include file="Common.jsp"%>
                </center>


			</div>
			
			



		</div>
	</body>
</html>