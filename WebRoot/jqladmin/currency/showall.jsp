<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
	var isSuccess=${isSuccess};
	$().ready(function() {
		if(isSuccess){
			alert("修改成功");
		}
	});
</script>
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
							<table border="1">
								<tr>
									<td>货币名称</td>
									<td>货币符号</td>
									<td>货币汇率</td>
									<td>默认货币</td>
									<td>是否使用</td>
									<td>操作</td>
								</tr>
								<c:forEach items="${list}" var="v" >
								<form action="cm/currency_update" method="post">
									<input type="hidden" value="${v.idcurrency}" name="c.idcurrency"/>
									<tr>
										<td><input type="text" value="${v.currencyname}" name="c.currencyname"/></td>
										<td><input type="text" value="${v.currencysymbol}" name="c.currencysymbol"/></td>
										<td><input type="text" value="${v.currencyrate}" name="c.currencyrate"/></td>
										<td>
											<input type="radio" value="1" <c:if test="${v.defaultcurrency==1}">checked="checked"</c:if> name="c.defaultcurrency">是</input>
											<input type="radio" value="0" <c:if test="${v.defaultcurrency==0}">checked="checked"</c:if> name="c.defaultcurrency">否</input>
										</td>
										<td>
											<input type="radio" value="1" <c:if test="${v.status==1}">checked="checked"</c:if> name="c.status">是</input>
											<input type="radio" value="0" <c:if test="${v.status==0}">checked="checked"</c:if> name="c.status">否</input>
										</td>
										<td><input type="submit" value="改"/>|<a href="cm/currency_delete?c.idcurrency=${v.idcurrency}">删</a></td>
									</tr>
								</form>
								</c:forEach>
							</table>
							
							
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
