<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css"
	href="jqladmin/css/product_category.css">
<link rel="stylesheet" type="text/css" href="css/admin_full.css">

<link rel="stylesheet" href="jqladmin/css/add_product_attribute.css"
	type="text/css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script src="jqladmin/js/left-right.js" type="text/javascript"></script>


<script type="text/javascript" src="jqladmin/product_category/uploadcategoryimg.js"></script>

<SCRIPT type="text/javascript">
	$(document).ready(function() {

	});
</SCRIPT>
</head>
<body>
	<div id="header">
		<%@ include file="../Header.jsp"%>
	</div>

	<div id="container">
		<div id="content">
			<div id="contentInnerWraper">
				<div class="picBox" onclick="switchSysBar()" id="switchPoint"  style="background-image: url(../images/right.gif);"></div>
				<div id="show_content_div">
					<div>
						<center>
								<table border="1"  class="altrowstable">
									<tr>
										<td>图片地址</td>
										<td>
										<center>
										<img src="${fimg.imgsrc}" id="showImage"  style="width:100px;height:100px" >
									 	<form id="form2" method="post" enctype="multipart/form-data">
									 		<input id="preimage" name="preimage" type="hidden" /> 
									 		<input name="foregroundimgid" type="hidden" value="${fimg.id}" /> 
											<input id="fileupload" name="fileupload"  type="file"  onchange="javascript:uploadCategoryImage()"/>
				                     	</form>
									 	<span  id="tipDiv" style="display: none"></span>
									</center>
										</td>
									</tr>
								<form action="categoryimage_update.action" method="post" target="_blank">
								<input type="hidden" name="img.id" value="${fimg.id}">
									<tr>
										<td>图片类型</td>
										<td>
											<input type="radio" name="img.type" value="0" <c:if test="${fimg.type==0}">checked="checked"</c:if>/>轮播图
											<input type="radio" name="img.type" value="1" <c:if test="${fimg.type==1}">checked="checked"</c:if>/>下方小图
										</td>
									</tr>
									
                                    <tr style="display: none">
                                        <td>所属商品分类</td>
                                        <td><input type="text" name="img.categoryid" value="${fimg.categoryid}" readonly="readonly"></input></td>
                                    </tr>
                                    
                                     
									<tr>
										<td>图片链接</td>
										<td><input type="text" name="img.imghref" value="${fimg.imghref}"></input></td>
									</tr>
									<tr>
										<td>是否使用</td>
										<td>
											<input type="radio" name="img.used" value="0" <c:if test="${fimg.used==0}">checked="checked"</c:if>/>弃用
											<input type="radio" name="img.used" value="1" <c:if test="${fimg.used==1}">checked="checked"</c:if>/>使用
										</td>
									</tr>
									<tr>
										<td colspan="3"><center><input type="submit" /></center></td>
									</tr>
							</form>
								</table>
						</center>
					</div>
				</div>
			</div>
		</div>
		<div id="side">
			<center>
				<%@ include file="productCategoryCommon.jsp"%>
			</center>
		</div>
		<div id="rightSide"></div>
		<div id="rightSide"></div>
	</div>
</body>
</html>
