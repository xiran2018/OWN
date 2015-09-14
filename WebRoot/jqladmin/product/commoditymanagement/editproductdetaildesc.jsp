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

<script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>


<script type="text/javascript" src="jqladmin/js/product.js"></script>
<script src="jqladmin/js/left-right.js" type="text/javascript"></script>
<script src="ckeditor/ckeditor.js"></script>
<script src="ckeditor/assets/uilanguages/languages.js"></script>

</head>
<body>
	<div id="header">
		<%@ include file="../../Header.jsp"%>
	</div>
	<div id="container">
		<div id="content">
			<div id="contentInnerWraper" style="min-height: 100%;">
				<div class="picBox" onclick="switchSysBar()" id="switchPoint"></div>
				<div id="show_content_div" >
					<div>
						<center>
							<form action="cm/multilanguage_updateProductDetailDesc" method="post">
							<input type="hidden" name="entity.id" value="${plentity.id}">
							<table border="1"  class="altrowstable">
							<tr>
							<td>
								<textarea id="editor1" name="entity.product_detail_desc" rows="10" cols="80">
								${plentity.product_detail_desc}
						        </textarea>
								<script>
									var editor;
									function createEditor(languageCode) {
										if (editor)
											editor.destroy();
										editor = CKEDITOR.replace('editor1', {
											language : languageCode,
											uiColor : '#14B8C4',
											on : {
												instanceReady : function() {
												}
											}
										});
									}

									createEditor('');
								</script>
								</td>
								</tr>
								
								<tr>
								<td>
									<center>
									<input type="submit">
									</center>
								</td>
								</tr>
								</table>
							</form>
						</center>
					</div>
				</div>

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
