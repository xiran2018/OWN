<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		      <!-- 按照多语言增添相应内容的时候，展示的内容,修改时需要呈现时需要的css -->
		<link rel="stylesheet" type="text/css" href="jqladmin/css/editrentclick.css">
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
		
        <script type="text/javascript" src="jqladmin/product/commoditymanagement/product_category.js"></script>
        <script type="text/javascript" src="jqladmin/js/modify_product_category.js"></script>
        <script type="text/javascript" src="jqladmin/js/language.js"></script>
         <script type="text/javascript" src="js/jquery.form.js"></script>

<!--  ueditor 编辑器需要的js -->
<script src="ueditor/ueditor.config.js"></script>
<script src="ueditor/ueditor.all.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="ueditor/themes/default/css/ueditor.css" />

<%--
		<script type="text/javascript" src="jqladmin/js/iframe_add_product.js"></script>
		<script src="jqladmin/js/mzone.cc.iframe.js" type="text/javascript"></script>
		--%>

<SCRIPT type="text/javascript">
	$(document).ready(function() {

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
		<%@ include file="../../Header.jsp"%>
	</div>

	<div id="container">
		<div id="content">
			<div id="contentInnerWraper">
				<div class="picBox" onclick="switchSysBar()" id="switchPoint"></div>
				<div id="show_content_div">
					<div>
						<center>
						<form action="cm/sku_creatSKU" method="post">
							<input type="hidden" name="product.p_id" value="${product.p_id}">
							<input type="hidden" name="product.p_name" value="${product.p_name}">
							<table border="1" class="altrowstable">
							<tr>
								<td>属性名</td><td>属性值</td><td>是否SKU</td>
							</tr>
							<c:forEach items="${atrmap}" var="atr">
								<tr>
									<td>${atr.value.attr_name}</td>
									<td>
									<!-- 在相应的属性名下显示所对应的属性值 -->
										<c:forEach items="${pbavlist}" var="pbav">
											<c:if test="${pbav.pba.attr_name_id==atr.key}">
												${pbav.attr_value_name}
											</c:if>
										</c:forEach>
									</td>
									<td>
										<center>
										<input type="checkbox" name="skuatr" value="${atr.value.pba.attr_name_id}" checked="checked"/>
										</center>
									</td>
								</tr>
							</c:forEach>
								<tr>
								<td colspan="3">
								<center>
								<input type="submit"/>
								</center>
								</td>
								</tr>
							</table>
						</form>
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
