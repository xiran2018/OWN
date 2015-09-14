<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>


<!-- header以下布局 -->
<link href="foreground/css/secondstyle.css" rel="stylesheet" type="text/css" />
<link href="foreground/css/secondsider.css" rel="stylesheet" type="text/css" />
<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css"/>


<link href="jqladmin/product/commoditymanagement/pagination.css"
	rel="stylesheet" type="text/css" />
	
	
<script type="text/javascript">
	var totalNumber = ${totalNumber};
	var searchMsg = '${searchMsg}';
	var imageheight = ${imgsize.height};
	var imagewidth = ${imgsize.width};
</script>
<script type="text/javascript" src="foreground/js/pagelabelconstruct.js"></script>
<script type="text/javascript" src="foreground/js/productsinfoservice.js"></script>
<script type="text/javascript" src="foreground/js/pricerange.js"></script>

<script type="text/javascript" src="foreground/js/searchpage-list.js"></script>
<script type="text/javascript" src="js/math.js"></script>

</head>

<body>
	<div id="header">
		<%@ include file="../common/header/headermenu.jsp"%>
		<%@ include file="../common/header/secondheader.jsp"%>
	</div>
	<div style="clear:both"></div>

	<div id="shopping">
		<div id="selectContainer">
			<h2 class="floor-title  ctr-track-a">Fashion &amp; Clothing
				（这里点击了什么就填写什么）</h2>
		</div>
	</div>

	<div style="clear:both"></div>
	<div id="priceSearch">
		<div class="fPrice" id="J_FPrice">
			<div class="fP-box">
				价格区间
				<input type="text" id="start_priceipt" name="start_price" maxlength="6" value="" class="j_FPInput"/>-<input id="end_priceipt" type="text" name="end_price" value="" maxlength="6" class="j_FPInput"/>
				<button id="pricebut" style="height: 22px;width: 40px">确定</button> 
			</div>
		</div>
	</div>

	<div id="seller">
		<ul id="sellerul">

		</ul>
	</div>
	<div class="digg" id="diggId"></div>
	<div style="clear:both"></div>
	<!-- ----------------------------------------------------------------------------------- -->
	<div id="footer">
		<%@ include file="../common/header/footer.jsp"%>
	</div>
	<!-- ----------------------------------------------------------------------------------- -->
</body>
</html>
