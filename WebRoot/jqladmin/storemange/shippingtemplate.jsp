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
		<!-- 分页需要的css -->
		<link rel="stylesheet" type="text/css" href="jqladmin/storemange/css/pagination.css">
		
		<link rel="stylesheet" type="text/css" href="jqladmin/css/product_attribute.css">
		<link rel="stylesheet" type="text/css" href="css/admin_full.css">
		
		<link rel="stylesheet" href="jqladmin/css/add_product_attribute.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/storemange/css/common.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/inputstyle.css">
		
		<script type="text/javascript" src="jqladmin/js/json2.js"></script>
		
		<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
		<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
	
		

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
		
		<script src="jqladmin/storemange/js/shiptemplate.js" type="text/javascript"></script>
		
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
				            <div id="listshowID">

				            </div><!-- 按照表格的形式，显示信息 -->
				            <div class="digg" id="diggId">  </div>  <!-- 显示分页按钮时需要的div -->
				            
				            <div id="shipTemplate" class="ui-widget;">
				            	<div id="shipTemplateInPage">
				            	
				            	<ul id="logistic-groups" class="list-skin-a">
				            	<!-- 模板示例
					            	<li style="z-index:9999;" class="logistic-li-tpl new-row standards">
					            	<span class="index serial">1</span>
					            	<span class="title">
					            		<span class="title-content">Hong Kong 香港,Macau 澳门,Taiwan 台湾,J...</span>
					            	</span>
					            	<span class="logistic_info remark">标准运费(折扣率1%)</span>
					            	<span class="actions">
					            		<a href="javascript:void(0);" class="remove-group" type="standard" key="1">删除</a>
					            	</span>
					            	<span class="actions">
					            		<a href="javascript:void(0);" class="edit-group" type="standard" key="1"> 编辑</a>
					            	</span>
					            	</li>
				            	 -->
				            	</ul>
				            	</div>  <!-- 每一次点击的时候，显示已经设置的信息 -->
				            	<fieldset class='fieldset-a'>
				            		 <legend>请选择国家信息</legend>
				            		<div id="showCountryInfo" style="margin: 20px;"></div> <!-- 显示国家信息 -->
				            	</fieldset>
				            	<fieldset class='fieldset-a'>
				            		<legend>请选择相应的物流信息</legend>
					            	<div id="showShipInfo" style="margin: 20px;">
					            		<select id="selectMode" onchange="javascript:selectModeChange()">
					            			<option value="1" selected >标准运费</option>
					            			<option value="2">自定义运费</option>
					            		</select id="selectMy">
					            		<select id="selectQWPattern" style="display:none" onchange="javascript:selectQWPatternChange()">
					            			<option value="1" selected >按照数量</option>
					            			<option value="2">按照重量</option>
					            		</select>
					            	</div>
					            	<div id="xiangxiInfo" style="margin: 20px;">
					            	  <div id="standardInfo">运费:<input id="standardFee" maxlength="15" size="3" value=""/>$</div>
					           
					            	  <div id="quanaityInfo" style="display:none">
					            	  	<table width="600" class="freight" >
												<tbody> 
													<tr class="t-define-title">
															<td width="120">首重最低采购量</td>
															<td width="120">首重最高采购量</td>
															<td width="120">首重运费</td>
															<td width="120">每增加产品数</td>
															<td width="120">续加运费</td>
													</tr>
													<tr>
															<td><input value="1" maxlength="8" size="3" id="cl_min" readonly></td>
															<td><input value="" maxlength="8" size="3" id="cl_max"></td>
															<td>US$ <input value="" maxlength="15" size="3" id="cl_price"></td>
															<td><input value="" maxlength="8" size="3" id="cl_add_num"></td>
															<td>US$ <input value="" maxlength="15" size="3" id="cl_add_price"></td>
													</tr>
												</tbody>
										</table>
					            	  
					            	  </div>
					            	  
					            	  <div id="weightInfo" style="display:none">
					            	  	<table style="" width="500" class="freight" >
								        <tbody>
								            <tr class="t-define-title">
								                <td width="100">首重</td>
								                <td width="40"></td>
								                <td width="120">首重运费</td>
								                <td width="120"></td>
								                <td width="120"></td>
								            </tr>
								            <tr class="weight-value">
								                <td colspan="2"><input value="" maxlength="8" size="3" onKeyUp="changeValue(this)" class="weight-end" id="weight-end-0"> Kg</td>
								                <td><input value="" maxlength="15" size="3" id="weight-price-0"> $</td>
								            </tr>
								            <tr class="t-define-title">
								                <td colspan="2">续重范围</td>
								                <td></td>
								                <td>此区间每增加重量</td>
								                <td colspan="2">续加运费</td>
								            </tr>
								            <tr class="weight-value">
								                <td><input value="" maxlength="8" size="3" disabled="disabled" id="weight-start-1"></td>
								                <td> ~ </td>
								                <td><input value="" maxlength="8" size="3" class="weight-end" id="weight-end-1"> kg</td>
								                <td><input value="" maxlength="8" size="3" id="weight-interval-1"> kg</td>
								                <td><input value="" maxlength="8" size="3" id="weight-price-1"> $</td>
								            </tr>
								        </tbody>
								    	</table>
					            	  </div>
					            	  
					            	</div>
				            	</fieldset>
				            
				            </div>
				            
				            <div id="shipTimeTemplate" class="ui-widget;">
				                <div id="shipTimeTemplateInPage">
                                
	                                <ul id="logistic-time-groups" class="list-skin-a">
	                                </ul>
                                </div>  <!-- 每一次点击的时候，显示已经设置的信息 -->
                                <fieldset class='fieldset-a'>
                                     <legend>请选择国家信息</legend>
                                    <div id="showTimeCountryInfo" style="margin: 20px;"></div> <!-- 显示国家信息 -->
                                </fieldset>
                                <fieldset class='fieldset-a'>
                                    <legend>请选择相应的时间信息</legend>
                                    <div id="showTimeShipInfo" style="margin: 20px;">
                                        <input value="" maxlength="8" size="3" id="shipping-time"> 天
                                    </div>
                                </fieldset>
				            </div>
				            

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