<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript"
	src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>

<script type="text/javascript" src="jqladmin/js/product.js"></script>
<script src="jqladmin/js/left-right.js" type="text/javascript"></script>

<script type="text/javascript"
	src="jqladmin/js/addproductloadcategory.js"></script>
<script type="text/javascript" src="jqladmin/js/loadbrand.js"></script>

<!--  ueditor 编辑器需要的js -->
<script src="ueditor/ueditor.config.js"></script>
<script src="ueditor/ueditor.all.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="ueditor/themes/default/css/ueditor.css" />

<%--
		<script type="text/javascript" src="jqladmin/js/iframe_add_product.js"></script>
		<script src="jqladmin/js/mzone.cc.iframe.js" type="text/javascript"></script>
		--%>


<!-- 分页 -->
<script type="text/javascript">
		var totalNumber=${totalNumber};
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
												<label>Product Name： 
												</label>
												<input value="" id="productName" maxlength="128" name="productName" style="background-color: rgb(255, 255, 255);">
										     </span>
											<span class="search-option">
												<label>Order Number：
												</label>
											
												<input value="" id="orderNo" maxlength="20" name="orderNo" style="background-color: rgb(255, 255, 255);">
							                 </span>
										   	
							               <span class="search-option">
												<label>Buyer Name：
												</label>
											
												<input value="" id="buyerName" name="buyerName">
							                </span>
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
