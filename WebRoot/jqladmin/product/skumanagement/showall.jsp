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

<link rel="stylesheet" type="text/css"
	href="jqladmin/css/product_attribute.css">
<link rel="stylesheet" type="text/css"
	href="jqladmin/css/product_category.css">
<link rel="stylesheet" type="text/css" href="css/admin_full.css">

<link rel="stylesheet" href="jqladmin/css/add_product_attribute.css"
	type="text/css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">

<script type="text/javascript" src="jqladmin/product/image-picker-master/image-picker/jquery.min.js"></script>

<script src="jqladmin/js/left-right.js" type="text/javascript"></script>

<script type="text/javascript"
	src="jqladmin/product/commoditymanagement/product_category.js"></script>
<script type="text/javascript"
	src="jqladmin/js/modify_product_category.js"></script>
<script type="text/javascript" src="jqladmin/js/language.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript"
	src="jqladmin/product/image-picker-master/image-picker/image-picker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="jqladmin/product/image-picker-master/image-picker/image-picker.css" />

<style type="text/css">
.thumbnail img {
width: 30px !important;
height: 30px !important;
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
								<table border="1" class="altrowstable">
									<tr>
										<td>商品ID</td>
										<td>商品数量</td>
										<td>商品价格</td>
										<td>SKU状态</td>
										<td>SKU名称</td>
										<c:forEach items="${atrNames}" var="atr">
											<td>${atr.attrName}</td>
										</c:forEach>
										<td>SKU图片</td>
										<td>操作</td>
									</tr>
									<c:forEach items="${SKUVO}" var="vo">
							<form action="cm/sku_updateSKU" method="post">
										<tr>
											<td>${vo.sku.product_id } <input type="hidden"
												name="sku.product_id" value="${vo.sku.product_id }"> 
												<input type="hidden" name="sku.sku_id" value="${vo.sku.sku_id }">
											</td>
											<td><input type="text" name="sku.count"
												value="${vo.sku.count}"></td>
											<td><input type="text" name="sku.price"
												value="${vo.sku.price}">
											</td>

											<td>
												<input type="radio" name="sku.status" value="1" <c:if test="${vo.sku.status==1}">checked="checked"</c:if>>可用
												<input type="radio" name="sku.status" value="0" <c:if test="${vo.sku.status==0}">checked="checked"</c:if>>不可用
											</td>
											<td><input type="text" name="sku.sku_name"
												value="${vo.sku.sku_name}">
											</td>
											<c:forEach items="${vo.atrValues}" var="aValue">
												<td>${aValue.attrValueName}</td>
											</c:forEach>
											<td>
											<select class="image-picker show-html" style="width: 150px" name="sku.image">
												<option> </option>
													<c:forEach items="${imgs}" var="img">
														<option data-img-src="${img.imageAddr}" value="${img.id}"  <c:if test="${vo.sku.image==img.id}">selected="selected"</c:if>>${img.id}</option>
													</c:forEach>
											</select>
											</td>
											<td><input type="submit" />||<a
												href="cm/sku_deleteSKU?sku.product_id=${vo.sku.product_id }&sku.sku_id=${vo.sku.sku_id }">删</a>
											</td>
										</tr>
							</form>
									</c:forEach>

								</table>

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

	<script type="text/javascript">
		jQuery("select.image-picker").imagepicker({
			hide_select : false,
		});
	</script>
</body>
</html>
