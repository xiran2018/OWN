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
		
		<link rel="stylesheet" href="jqladmin/css/add_product_attribute.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/inputstyle.css">
		
		<script type="text/javascript" src="jqladmin/js/json2.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
		<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
		<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
		<script src="jqladmin/js/left-right.js" type="text/javascript"></script>
	
	<!--	
		<script type="text/javascript" src="jqladmin/js/product.js"></script>	
		<script type="text/javascript" src="jqladmin/js/iframe_add_product.js"></script>
         <script type="text/javascript" src="jqladmin/js/loadcategory.js"></script>  --> 
        <script type="text/javascript" src="jqladmin/js/language.js"></script>
        <script src="jqladmin/storemange/js/common.js" type="text/javascript"></script>
		
		
		<SCRIPT type="text/javascript">
		

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
		    
			 <%@ include file="../Header.jsp"%>
			 
		</div>

		

		<div id="container">
			<div id="content">
			   <div id="contentInnerWraper" style=" min-height: 100%;">
			<div class="picBox" onclick="switchSysBar()" id="switchPoint"  style="background-image: url(../images/right.gif);"></div>
					<div id="show_content_div" >
				   	
						<div>
				         <center>
				            <table class="altrowstable" id="alternatecolor" >
				            <tr class="oddrowcolor">
				                <th colspan="2" class="colume1" valign=middle align=middle>添加语言</th>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>语言名称</td>
				                <td class="colume2">
				                
				                <INPUT id="languagename" name="languagename"  type=text type="width: 233px;">
				                "语言名称是在后台显示的语言名称"
				                </td>
				            </tr>
				            <tr class="categorytr evenrowcolor">
				                <td class="colume1" valign=middle align=right>相应的外国语言名称</td>
				                <td class="colume2">
				                 <INPUT id="foreignername" name="foreignername"  type=text type="width: 233px;">
			                   "该名称是在前台显示的语言名称"
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>语言代码</td>
				                <td class="colume2"><INPUT id="languagecode" name="languagecode" type=text type="width: 233px;">
				                "语言代码可以在网上查找，为小写，比如英语为en"
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>国家代码</td>
				                <td class="colume2">
				                <INPUT id="countrycode" name="countrycode" type=text type="width: 233px;">
				                "语言代码所属的国家代码，为大写，比如美国US"
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>是否显示</td>
				                <td class="colume2">
				                	<input type="radio" name="show" value="1">
				                                                                             是
				                   <input type="radio" name="show" value="0" checked="checked">
				                                                                            否
				                </td>
				            </tr>
				  
				                  
		                   <tr class="evenrowcolor">
		                        <td valign=middle colspan=2 align=center>
		                            <button class="add_button" onclick="javascript:add_language()">添加 </button> 
		                        </td>
		                   </tr>   
				            </table>

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