<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="../extremecomponents/extremecomponents.tld" prefix="ec"%>
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
<!-- 按照多语言增添相应内容的时候，展示的内容,修改时需要呈现时需要的css -->
<link rel="stylesheet" type="text/css"
	href="jqladmin/css/editrentclick.css">
<link rel="stylesheet" type="text/css"
	href="jqladmin/css/inputstyle.css">

<script type="text/javascript" src="jqladmin/js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
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

<script src="jqladmin/js/left-right.js" type="text/javascript"></script>

<script type="text/javascript"
	src="jqladmin/product/commoditymanagement/product_category.js"></script>
<script type="text/javascript"
	src="jqladmin/js/modify_product_category.js"></script>
<script type="text/javascript" src="jqladmin/js/language.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>

<!--  ueditor 编辑器需要的js -->
<script src="ueditor/ueditor.config.js"></script>
<script src="ueditor/ueditor.all.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="ueditor/themes/default/css/ueditor.css" />

<link rel="stylesheet"
	href="jqladmin/extremecomponents/extremecomponents.css" type="text/css" />
<%--
		<script type="text/javascript" src="jqladmin/js/iframe_add_product.js"></script>
		<script src="jqladmin/js/mzone.cc.iframe.js" type="text/javascript"></script>
		--%>

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
			<div id="contentInnerWraper">
				<div class="picBox" onclick="switchSysBar()" id="switchPoint"  style="background-image: url(../images/right.gif);"></div>
				<div id="show_content_div">
					<div>
						<center>

							<ec:table items="list"
								action="cm/foregroundimage_showAll"
								imagePath="jqladmin/extremecomponents/images/table/*.gif"
								title="图片列表" rowsDisplayed="20" var="img">
								<ec:row>
									<ec:column property="类别" filterable="false" sortable="false">
										<c:if test="${img.type==0}">
											大图
										</c:if>
										<c:if test="${img.type==1}">
											小图
										</c:if>
										
									</ec:column>
									<ec:column filterable="false" sortable="false" property="图片" >
										<img style='width:100px;height:160px;' src='${img.imgsrc}'>
									</ec:column>
									<ec:column property="图片链接" filterable="false" sortable="false">
										${img.imghref}
									</ec:column>
									<ec:column property="rightcolor" filterable="false" sortable="false"></ec:column>
									<ec:column property="leftcolor" filterable="false" sortable="false"></ec:column>
									
									<ec:column property="used" title="是否使用" filterable="false" sortable="false">
									   <c:if test="${img.used==1}">
                                            使用
                                        </c:if>
                                        <c:if test="${img.used==0}">
                                            弃用
                                        </c:if>
                                        
									   
									</ec:column>
									<ec:column sortable="false" filterable="false" property="操作">
										<a href="cm/foregroundimage_showInfo?img.id=${img.id}">详细</a>
										<a href="cm/foregroundimage_delete?img.id=${img.id}">删除</a>
									</ec:column>
								</ec:row>
							</ec:table>
						</center>
					</div>
				</div>
			</div>
		</div>
		<div id="side">
			<center>
				<%@ include file="../storemange/storeCommon.jsp"%>
			</center>
		</div>
		<div id="rightSide"></div>
		<div id="rightSide"></div>
	</div>
</body>
</html>
