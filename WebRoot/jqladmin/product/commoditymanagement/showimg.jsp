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
	var isSuccess=${success};
	$().ready(function() {
		if(isSuccess){
			alert("修改成功");
		}
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
							<table border="1" class="altrowstable">
								<tr>
									<td>PID</td>
									<td>名称</td>
									<td>重量</td>
									<td>采购价格</td>
									<td>原始价格</td>
									<td>现价</td>
									<td>品牌ID</td>
									<td>商品分类ID</td>
									<td>产品来源厂家</td>
									
									<td>自编号</td>
								
								</tr>
								<tr>
									<td>${pvo.products.p_id}</td>
									<td>${pvo.products.p_name}</td>
									<td>${pvo.products.p_weight}</td>
									<td>${pvo.products.p_purchaprice}</td>
									<td>${pvo.products.p_originprice}</td>
									<td>${pvo.products.p_nowprice}</td>
									<td>${pvo.brand}</td>
									<td>${pvo.category}</td>
									<td>${pvo.products.p_fromcompany}</td>
									<td>${pvo.products.p_myserialnumber}</td>
								</tr>
								<tr>
									<td>厂家编号</td>
									<td>厂家网址</td>
									<td>库存数目</td>
									<td>最少购买数量</td>
									<td>是否免邮</td>
									<td>积分</td>
									<td>是否热销</td>
									<td>是否推荐</td>
									<td>是否新品</td>
									<td>产品状态</td>
								</tr>
								<tr>
									<td>${pvo.products.p_companyserinum}</td>
									<td>${pvo.products.p_fromnetaddress}</td>
									<td>${pvo.products.p_storenumber}</td>
									<td>${pvo.products.p_storenumber}</td>
									<td>${pvo.products.p_freemail}</td>
									<td>${pvo.products.p_jifen}</td>
									<td>${pvo.products.p_hot}</td>
									<td>${pvo.products.p_recommend}</td>
									<td>${pvo.products.p_new}</td>
									<td>${pvo.products.p_status}</td>
								</tr>
							</table>
							<hr>
							
								<span id="showImage"  style="width:100px;height:100px"  style="display: none"></span>  <!-- 图片预览 -->
	                            <input id="image" name="image" type="text"   style="display: none" value=""/>
	                            <form id="form2" method="post" enctype="multipart/form-data">
	                                <input name="p_id" type="hidden" value="${pvo.products.p_id}"/>
		                        	<input id="fileupload" name="fileupload"  type="file"  onchange="javascript:uploadImage()"/>
		                        </form>
		                        <span  id="tipDiv" style="display: none"></span>
		                        
		                        
							<table border="1" id='productImage' class="altrowstable">
								<tr>
									<td>展示图片</td>
									<td>是否封面</td>
									<td>操作</td>
									<td>展示图片</td>
									<td>是否封面</td>
									<td>操作</td>
								</tr>
								<c:forEach items="${pvo.imageURLs}" var="img" varStatus="status">
									<c:if test="${status.index%2==0}">
										<tr>
											<td>
												<img alt="" src="${img.imageAddr}" height="70px" width="70px">
											</td>
											<form action="cm/managementimg_updateImage" method="post">
												<input type="hidden" name="image.id" value="${img.id}">
												<input type="hidden" name="image.productId" value="${img.productId}">
												<td>
													<input type="radio" name="image.imageSort" value="1" <c:if test="${img.imageSort==1}">checked="checked"</c:if>/>是
													<input type="radio" name="image.imageSort" value="0" <c:if test="${img.imageSort!=1}">checked="checked"</c:if>/>否
												</td>
												<td><input type="submit" value="修改">|<a href="cm/managementimg_deleteImage?image.productId=${img.productId}&image.id=${img.id}">删除</a></td></td>
											</form>
									</c:if>
									
									<c:if test="${status.index%2!=0}">
											<td>
												<img alt="" src="${img.imageAddr}" height="70px" width="70px">
											</td>
											<form action="cm/managementimg_updateImage" method="post">
											<input type="hidden" name="image.id" value="${img.id}">
											<input type="hidden" name="image.productId" value="${img.productId}">
											<td>
												<input type="radio" name="image.imageSort" value="1" <c:if test="${img.imageSort==1}">checked="checked"</c:if>/>是
												<input type="radio" name="image.imageSort" value="0" <c:if test="${img.imageSort!=1}">checked="checked"</c:if>/>否
											</td>
											<td><input type="submit" value="修改">|<a href="cm/managementimg_deleteImage?image.productId=${img.productId}&image.id=${img.id}">删除</a></td>
											</form>
									</c:if>
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


</body>
</html>
