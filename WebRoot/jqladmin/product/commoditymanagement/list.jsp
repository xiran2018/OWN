<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>商品管理</title>
<link rel="stylesheet" type="text/css" href="css/easyui.css">
<link rel="stylesheet" type="text/css" href="css/icon.css">
<link rel="stylesheet" type="text/css" href="css/demo.css">

<link rel="stylesheet" type="text/css"
	href="jqladmin/css/product_attribute.css">
<link rel="stylesheet" type="text/css" href="css/admin_full.css">

<link rel="stylesheet" href="jqladmin/css/add_product_attribute.css"
	type="text/css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
<link rel="stylesheet" type="text/css"
	href="jqladmin/css/inputstyle.css">

<script type="text/javascript" src="jqladmin/js/json2.js"></script>
<script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">

<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript"	src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"	src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript"	src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>

<script type="text/javascript" src="jqladmin/js/product.js"></script>
<script src="jqladmin/js/left-right.js" type="text/javascript"></script>

<script type="text/javascript" src="jqladmin/js/addproductloadcategory.js"></script>
<script type="text/javascript" src="jqladmin/js/loadbrand.js"></script>

<!--  ueditor 编辑器需要的js -->
<script src="ueditor/ueditor.config.js"></script>
<script src="ueditor/ueditor.all.min.js"></script>
<link rel="stylesheet" type="text/css"	href="ueditor/themes/default/css/ueditor.css" />

<!-- 日历控件 -->
<link href="order/css/canlander.css" rel="stylesheet" type="text/css" />



<!-- 分页 -->
<script type="text/javascript">
		
		
		$(function() { //日历控件

			
		    $( "#gmtBeginDate" ).datepicker({
		        //showOn: "button",
		        dateFormat:"yy-mm-dd",
		        buttonImage: "images/calendar.gif",
		        buttonImageOnly: true,
		        changeMonth: true,
		        changeYear: true,
		        buttonText: "Select date"
		    });
		    
		    $( "#gmtEndDate" ).datepicker({
		        //showOn: "button",
		        dateFormat:"yy-mm-dd",
		        buttonImage: "images/calendar.gif",
		        buttonImageOnly: true,
		        changeMonth: true,
		        changeYear: true,
		        buttonText: "Select date"
		    });
		    

		  });
		var totalNumber=${totalNumber}; //从 context中读取
</script>
<link href="jqladmin/product/commoditymanagement/pagination.css" rel="stylesheet" type="text/css" />
<link href="jqladmin/product/commoditymanagement/page-list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jqladmin/product/commoditymanagement/page-list.js"></script>
</head>
<body>
	<div id="header">
		<%@ include file="../../Header.jsp"%>
	</div>

	<div id="container">
		<div id="content">
			<div id="contentInnerWraper">
				<div class="picBox" onclick="switchSysBar()" id="switchPoint" style="background-image: url(../../images/right.gif);"></div>
				<div id="show_content_div">
					<div>
						<center>
 
 							<div class="order-list-search">
								        <div id="simple-search">
											<span class="search-option">
												<label>商品名称： 
												</label>
												<input value="" id="productName" maxlength="128" name="productName" style="background-color: rgb(255, 255, 255);">
										     </span>
											<span class="search-option">
												<label>品牌名称：
												</label>
											
												<input value="" id="brandName" maxlength="20" name="brandName" style="background-color: rgb(255, 255, 255);">
							                 </span>
							                 <span class="search-option">
												<label>自编号：
												</label>
											
												<input value="" id="p_myserialnumber" maxlength="20" name="p_myserialnumber" style="background-color: rgb(255, 255, 255);">
							                 </span>
										   	
							               <span class="search-option">
												<label>Status：</label>
												<select id="productStatus" name="productStatus">&nbsp;
														<option selected="" value=""></option>
											            <option value="0"> 下架 </option>
											            <option value="1"> 上架 </option>
											    </select>
											       <script type="text/javascript">
														$(function() {
														     var productStatus=<s:property value="productStatus" escape="false" default='-1'/>;
														  
															 if(productStatus!=-1)
															 {
																 $('#productStatus').prop('value',productStatus);
															 }
														});
													
													
												   </script>
							               </span>
							               <div style="display: block;float: left; " id="advanced-search">
												<label>添加时间：    </label>
							                    <div class="calendarItem" today="">
													 <input size="10" id="gmtBeginDate"  name="gmtBeginDate" value='<s:property value="gmtBeginDate" escape="false"/>' class="sourceData" type="text">
							                    </div>
							                         <span>-</span>
							                    <div class="calendarItem" today="">
													<input size="10" id="gmtEndDate" name="gmtEndDate" value='<s:property value="gmtEndDate" escape="false"/>' class="sourceData" type="text">
							                    </div>
							                    <button id="search-btn" class="ui-button ui-button-primary search-btn" type="submit">搜索</button>
									                    
								           </div>
								        </div>
								       
								</div>
 
							<table data-spm="7" id="TP_BoughtTable" class="bought-table">
								<tbody id="listshowID" class="ae-order" data-isarchive="false">


								</tbody>
							</table>

							<div class="digg" id="diggId"></div>
							<!-- 显示分页按钮时需要的div -->


						</center>
					</div>
				</div>
				<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->

			</div>

		</div>


		<div id="side">
			<center>
				<%@ include file="../productCommon.jsp"%>
			</center>
		</div>
		<div id="rightSide"></div>
	</div>


</body>
</html>
