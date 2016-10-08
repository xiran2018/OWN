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
<link href="foreground/css/secondstyle.css" rel="stylesheet" type="text/css" />
<!--商品分类侧边栏 -->
<link href="foreground/css/secondsider.css" rel="stylesheet" type="text/css" />
<!-- 首页header页面滚动图布局样式css -->
<link href="foreground/css/secondimageplay.css" rel="stylesheet" type="text/css" />
<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css"/>
<script type="text/javascript" src="foreground/js/jquery.json.js"></script>


<link href="jqladmin/product/commoditymanagement/pagination.css" rel="stylesheet" type="text/css" />
<link href="jqladmin/product/commoditymanagement/page-list.css"	rel="stylesheet" type="text/css" />
	
	
<script type="text/javascript" src="js/math.js"></script>
<script type="text/javascript" >
	var categoryid = ${categoryid};
	var totalNumber = ${totalNumber};
	var imageheight = ${categoryExhibitionSize.height};
	var imagewidth = ${categoryExhibitionSize.width};
</script>

<script type="text/javascript" src="common/js/imagePlay.js"></script>
<script type="text/javascript" src="foreground/js/secondlevelpage.js"></script>
<script type="text/javascript" src="foreground/js/productattributesearch.js"></script>
<script type="text/javascript" src="foreground/js/jsmap.js"></script>

<script type="text/javascript" src="foreground/js/pagelabelconstruct.js"></script>
<script type="text/javascript" src="foreground/js/pricerange.js"></script>
<script type="text/javascript" src="foreground/js/productsinfoservice.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		getNavigation(categoryid);  // secondlevelpage.js
		getRollImage(categoryid);   //secondlevelpage.js
		getAllAttribute(categoryid);
		getExhibitionProducts(0,map,categoryid,0,2147483647);   //map is in productattributesearch.js
		registEvents(categoryid);//注册事件，productsinfoservice.js，主要注册的是点击属性 的事件
		buildPageTable(totalNumber);  // pagelabelconstruct.js
		registerEventLister();//上一页  下一页  的动作  pagelabelconstruct.js
		registerPriceLister(false);//价格区间  pricerange.js
	});
</script>
</head>

<body>

<div class="trunkOld">

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
				<!--  小图不再显示
				<div class="play-image-bottom">

					<div id="image-bottom-list">
						<ul id="staticimg">


						</ul>
					</div>
				</div>
				 -->
				 <div style="clear:both"></div>
				<div id="seller">
					<div class="categoryTips">
						<h2 class="floor-title  ctr-track-a">
								<c:out value="${route}"></c:out>
						</h2>
					</div>
					<center>
					<ul id="sellerul">
			
					</ul>
					</center>
					<div style="clear:both"></div>
					<div class="digg" id="diggId"></div>
				</div>
			</div>

			<div class="lagout-three-l">
				<div class="second-cateogry-list">
					<div class="m" id="sortlist">
						<div id="navigationdiv" class="mc">
							<ul class="sidemenu"> <!-- 商品分类 -->
							        <li class="selected hasnochild">
							    <a href="/catalog/zhenshchinam/odezhda"><i class="i"></i>Одежда</a>
							        <ul>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/platya">Платья</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/futbolki-i-topy">Футболки и топы</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/bryuki-i-shorty">Брюки и шорты</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/bluzki-i-rubashki">Блузки и рубашки</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/dzhempery-i-kardigany">Джемперы и кардиганы</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/yubki">Юбки</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/verhnyaya-odezhda">Верхняя одежда</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/dzhinsy-dzhegginsy">Джинсы</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/pidzhaki-i-zhakety">Пиджаки и жакеты</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/odezhda-dlya-doma">Одежда для дома</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/tuniki">Туники</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/kombinezony">Комбинезоны</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/kostyumy">Костюмы</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/zhilety">Жилеты</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/tolstovki">Толстовки</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/vodolazki">Водолазки</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/svitshoty">Свитшоты</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/odezhda/karnavalnye-kostyumy">Карнавальные костюмы</a>
							    </li>
							        </ul>
							    </li>
							        <li>
							    <a href="/catalog/obuv/zhenskaya">Обувь</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/bele-i-kupalniki">Белье и купальники</a>
							    </li>
							        <li>
							    <a href="/catalog/61/women.aspx">Большие размеры</a>
							    </li>
							        <li>
							    <a href="/catalog/139/child.aspx">Будущие мамы</a>
							    </li>
							        <li>
							    <a href="/catalog/1030/women.aspx">Подарки</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/premium">Премиум</a>
							    </li>
							        <li>
							    <a href="/catalog/zhenshchinam/spetsodezhda">Спецодежда</a>
							    </li>
							  </ul>
							  <!-- 商品过滤属性 -->
							  <div id="filterPanelLeft" class="filters" data-base-filter-url="/catalog/zhenshchinam/odezhda">
							  				<div class="filterblock wbsize show filter-active">
							  					<div class="filter-title">
							  						<i class="arrow-icon"></i> 
							  						Российский размер
							  						<a class="reset">Сбросить</a>
							  					</div>
							  					<div class="selectorsblock custom-scroll">
							  						<ul id="wbsize_list_left" style="opacity: 1;">
							  							<li class="">
							  								<a>
							  									<i class="pseudocheckbox"></i>2 <span>(5)</span>
							  								</a>
							  							</li>
							  							<li class="">
							  								<a><i class="pseudocheckbox"></i>3 <span>(4)</span></a>
							  							</li>
							  							<li class=""><a><i class="pseudocheckbox"></i>4 <span>(4)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>6 <span>(3)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>6,5 <span>(3)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>7 <span>(3)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>7,5 <span>(3)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>8 <span>(3)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>38 <span>(4597)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>40 <span>(36121)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>42 <span>(89311)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>44 <span>(101522)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>46 <span>(102431)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>46-48 <span>(12)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>48 <span>(91899)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>50 <span>(65927)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>50-52 <span>(3)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>52 <span>(40862)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>54 <span>(21224)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>56 <span>(13024)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>58 <span>(8748)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>60 <span>(5406)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>62 <span>(2741)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>64 <span>(1748)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>66 <span>(900)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>68 <span>(548)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>70 <span>(321)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>72 <span>(53)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>74 <span>(21)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>80 <span>(1)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>92-98 <span>(3)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>122-128 <span>(3)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>150-170 <span>(3)</span></a></li></ul><div class="progress" style="display: none;"></div></div>
							  							
							  				 </div>
							  				 
							  				 <!-- 没有展开的属性 -->
							  				 
							  				 <div class="filterblock season show"><div class="filter-title"><i class="arrow-icon arrow-icon-open"></i> Сезон<a class="reset">Сбросить</a></div><div class="selectorsblock custom-scroll" style="display: none;"><ul id="season_list_left" style="opacity: 1;"><li class=""><a><i class="pseudocheckbox"></i>демисезон <span>(113)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>зима <span>(4)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>круглогодичный <span>(92)</span></a></li><li class=""><a><i class="pseudocheckbox"></i>лето <span>(30)</span></a></li></ul><div class="progress" style="display: none;"></div></div></div>
							  </div>
						
						</div>
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
	<!-- ----------------------------------------------------------------------------------- -->
	<div id="footer">
		<%@ include file="../common/header/footer.jsp"%>

	</div>
	<!-- ----------------------------------------------------------------------------------- -->
	<!-- ----------------------------------防止用户在查询期间多次点击------------------------------------------------- -->
	<div id="catalog-overlay" style="display: none; "></div>
 </div>
</body>
</html>
