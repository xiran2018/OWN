<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
	   
	    <!-- header布局 -->
        <link  href="common/header/css/header.css" rel="stylesheet" type="text/css"/>
        
        <!-- 商品分类 -->
        <script type="text/javascript" src="common/js/category.js"></script>
        
	</head>
	<body>
			<div style="">
				  <div id="lagout-two">
				      <ul class="lagout-two-l">
				        <li class="menu-title headeritem">
				        
				            <a class="oneitem" href="#"><s:text name="www.product.category"></s:text></a>
				            <b></b>
				            <div class="category-list">                                                 
				                    <div id="sidebar-menu"> 
				                        <ul class="catgoryContainerUL"> 
				                        
				                        </ul> 
				                        </div> <!--  end of menu sidebar-menu-->
				           </div><!-- end of product-list -->
				        </li>
				        <li class="headeritem"><a class="oneitem" href="#"><s:text name="www.web.home"></s:text></a></li>
				        <li class="headeritem"><a class="oneitem" href="fg/thirdforegroundpage_findNewProducts.action"><s:text name="www.product.new"></s:text></a></li>
				        <li class="headeritem"><a class="oneitem" href="fg/thirdforegroundpage_findHotProducts.action"><s:text name="www.product.hot"></s:text></a></li>
				        <li class="headeritem"><a class="oneitem" href="fg/thirdforegroundpage_findRecommendProducts.action"><s:text name="www.product.recommand"></s:text></a></li>
				        <li class="headeritem"><a class="oneitem" href="#"><s:text name="www.brand.all"></s:text></a></li>
				      </ul>
				      <div class="lagout-two-r">
				        <!-- 
				         <a href="#"><img src="images/new.gif" width="70" height="40" /></a>
				         <a href="#" class="txt"><s:text name="www.brand.all"></s:text></a>
				         <a href="#" class="txt"><s:text name="www.brand.all"></s:text></a>
				          -->
				      </div>
				  </div>
				  
				  <!-- 之上的代码，到时候由我做的header生成，到时候你只要包含即可-->
			</div>

	</body>
</html>