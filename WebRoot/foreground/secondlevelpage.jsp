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
<link href="foreground/css/secondstyle.css" rel="stylesheet"
	type="text/css" />
<!--商品分类侧边栏 -->
<link href="foreground/css/secondsider.css" rel="stylesheet" type="text/css" />
<!-- 首页header页面滚动图布局样式css -->
<link href="foreground/css/secondimageplay.css" rel="stylesheet" type="text/css" />
<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css"/>

<script type="text/javascript" src="common/js/imagePlay.js"></script>
<script type="text/javascript" src="foreground/js/secondlevelpage.js"></script>
<script type="text/javascript" src="foreground/js/productattributesearch.js"></script>
<script type="text/javascript" src="foreground/js/jsmap.js"></script>
<script type="text/javascript" src="foreground/js/jquery.json.js"></script>


<link href="jqladmin/product/commoditymanagement/pagination.css"
	rel="stylesheet" type="text/css" />
<link href="jqladmin/product/commoditymanagement/page-list.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/math.js"></script>
<script type="text/javascript" >
	var categoryid = ${categoryid};
	var totalNumber = ${totalNumber};
	var imageheight = ${categoryExhibitionSize.height};
	var imagewidth = ${categoryExhibitionSize.width};
</script>
<script type="text/javascript" src="foreground/js/pagelabelconstruct.js"></script>
<script type="text/javascript" src="foreground/js/page-list.js"></script>
<script type="text/javascript" src="foreground/js/pricerange.js"></script>
<script type="text/javascript" src="foreground/js/productsinfoservice.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		getNavigation(categoryid);
		getRollImage(categoryid);
		getAllAttribute(categoryid);
		registEvents(categoryid);//注册事件
	});
</script>
</head>

<body>

	<div id="header">
		<%@ include file="../common/header/headermenu.jsp"%>
		<%@ include file="../common/header/secondheader.jsp"%>

	</div>


	<!--！！！！！！！！！！！！！！！！！！！ 之下的代码是你需要真正使用的，需要到时候用js（切记：因为js的用户体验非常好）生成！！！！！！！！！！！！！！！！！！-->
	<div id="second-category-menu">

		<div id="lagout-three">

			<div class="lagout-three-r">
				<div class="category-image-paly">

					<div id="focus">
						<ul id="rollimg">

						</ul>
					</div>
				</div>

				<div class="play-image-bottom">

					<div id="image-bottom-list">
						<ul id="staticimg">


						</ul>
					</div>
				</div>
			</div>

			<div class="lagout-three-l">
				<!--<h2 class="menu-title">商品服务分类</h2>-->
				<div class="second-cateogry-list">
					<div class="m" id="sortlist">

						<div id="navigationdiv" class="mc"></div>
					</div>
					<!-- end of m -->
				</div>
				<!-- end of second-cateogry-list -->
			</div>
		</div>
		<!-- end of lagout-three -->
	</div>


	<div style="clear:both"></div>

	<div id="shopping">
		<div id="selectContainer">
			<h2 class="floor-title  ctr-track-a">Fashion &amp; Clothing
				（这里点击了什么就填写什么）</h2>
			<span id="selectAttrs">
				<ul class="crumbSlide-con clearfix" id="J_CrumbSlideCon">

				</ul> 
			</span>
		</div>
	</div>

	<div style="clear:both"></div>

	<div class="attrs j_NavAttrs" style="display:block" id="allatr">
		<!--  -->
		<div class="propAttrs" data-spm="a220m.1000858.1000722">
			<div class="j_Prop attr hotspot" data-mindiffrow="2">
				<div class="attrKey">选购热点</div>
				<div class="attrValues">
					<div class="av-options">
						<a class="j_More avo-more ui-more-drop-l"
							onclick="javascript:moreChange(this);" href="javascript:void(0);"
							atpanel="0,,,,spu-pro,20,prop," style="display: inline;"> <label
							class="opentiontext">更多</label><i class="ui-more-drop-l-arrow"></i>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="propAttrs" data-spm="a220m.1000858.1000722">
			<div class="j_Prop attr hotspot" data-mindiffrow="2"></div>
		</div>
	</div>



	<div id="priceSearch">
		<div class="fPrice" id="J_FPrice">
			<div class="fP-box">
				价格区间
				<input id="start_priceipt" type="text" name="start_price" maxlength="6" value="" class="j_FPInput"/>-
				<input id="end_priceipt" type="text" name="end_price" value="" maxlength="6" class="j_FPInput"/>
				<button id="pricebut" style="height: 22px;width: 40px">确定</button> 
			</div>
		</div>
	</div>
	<div style="clear:both"></div>
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
