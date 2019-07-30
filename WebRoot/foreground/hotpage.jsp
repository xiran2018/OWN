<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>


<!-- header以下布局 -->
<link href="foreground/css/secondstyle.css" rel="stylesheet"
	type="text/css" />

<!--商品分类侧边栏 -->
<link href="foreground/css/secondsider.css" rel="stylesheet"
	type="text/css" />

<!-- 首页header页面滚动图布局样式css -->
<link href="foreground/css/secondimageplay.css" rel="stylesheet"
	type="text/css" />

<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css"/>

<script type="text/javascript" src="common/js/imagePlay.js"></script>
<script type="text/javascript" src="foreground/js/jsmap.js"></script>
<script type="text/javascript" src="foreground/js/jquery.json.js"></script>


<link href="jqladmin/product/commoditymanagement/pagination.css"
	rel="stylesheet" type="text/css" />
<link href="jqladmin/product/commoditymanagement/page-list.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/math.js"></script>
<script type="text/javascript" src="foreground/js/pagelabelconstruct.js"></script>

<script type="text/javascript" src="foreground/js/pricerange.js"></script>
<script type="text/javascript" src="foreground/js/productsinfoservice.js"></script>
<script type="text/javascript" src="foreground/js/productattributesearch.js"></script>

<script type="text/javascript">
	var categoryid = ${categoryid};
	var totalNumber = ${totalNumber};
	$(document).ready(function() {
		
		getAllAttribute(categoryid);
		registEvents(categoryid);//注册事件
		getHotProducts(0,map,categoryid,0,2147483647);
		buildPageTable(totalNumber);
		registerEventLister();//左右条
		registerPriceLister(false);//价格区间
	});
	var imageheight = ${categoryExhibitionSize.height};
	var imagewidth = ${categoryExhibitionSize.width};
</script>
</head>

<body>

	<div id="header">
		<%@ include file="../common/header/headermenu.jsp"%>
		<%@ include file="../common/header/secondheader.jsp"%>
	</div>


	<div style="clear:both"></div>

	<div id="shopping">
	</div>

	<div style="clear:both"></div>


	<div id="priceSearch">
		<div class="fPrice" id="J_FPrice">
			<div class="fP-box">
				价格区间
				<input id="start_priceipt" type="text" name="start_price" maxlength="6" value="" class="j_FPInput"/>-<input type="text" id="end_priceipt" name="end_price" value="" maxlength="6" class="j_FPInput"/>
				<button id="pricebut" style="height: 22px;width: 40px">确定</button> 
			</div>
		</div>
	</div>

	<div id="seller">
		<ul id="sellerul">

		</ul>
		<div style="clear:both"></div>
		<div class="digg" id="diggId"></div>
	</div>
	<div style="clear:both"></div>
	<!-- ----------------------------------------------------------------------------------- -->
	<div id="footer">
		<%@ include file="../common/header/footer.jsp"%>

	</div>
	<!-- ----------------------------------------------------------------------------------- -->
</body>
</html>
