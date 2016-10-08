<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>京东</title>


<!-- header以下布局 -->
<link href="common/css/secondstyle.css" rel="stylesheet" type="text/css" />

<!-- 用户登录布局 -->
<link href="css/muiminiuserlogin.css" rel="stylesheet" type="text/css" />



<!--商品分类侧边栏 -->
<link href="common/css/secondsider.css" rel="stylesheet" type="text/css" />

<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css" />

<!--去小数点等-->
<script type="text/javascript" src="js/math.js"></script>
<!-- 商品图片展示css -->
<link rel="stylesheet" type="text/css" href="foregroundproductshow/css/productImageShow.css" />

<!-- 本页css -->
<link rel="stylesheet" type="text/css" href="foregroundproductshow/css/productShow.css" />

<!--商品图片放大镜 -->
<script type="text/javascript" src="foregroundproductshow/js/jquery.zoom.js"></script>

<!--商品图片展示，小图左右切换 -->
<script type="text/javascript" src="foregroundproductshow/js/product.image.js"></script>

<!--点击商品属性时的动作 -->
<script type="text/javascript" src="foregroundproductshow/js/product.select.js"></script>


<script  type="text/javascript" >
		//about the shipping country
        var defaultShippingCountryId=<%=session.getAttribute("defaultShippingCountryId")%>;

		//method 1  of tab menu
		var makeTabs = function(selector) {
		    $( selector )
		        .find( "ul a" ).each( function() {
		            var href = $( this ).attr( "href" ),
		                newHref = window.location.protocol + '//' + window.location.hostname +
	                    window.location.pathname + href;
		            if ( href.indexOf( "#" ) == 0 ) {
		                $( this ).attr( "href", newHref );
		            }
		        })
		    $( selector ).tabs();
		};
		
		//method 2 of tab menu
		$.fn.__tabs = $.fn.tabs;
		$.fn.tabs = function (a, b, c, d, e, f) {
			var base = window.location.href.replace(/#.*$/, '');
			$('ul>li>a[href^="#"]', this).each(function () {
				var href = $(this).attr('href');
				$(this).attr('href', base + href);
			});
			$(this).__tabs(a, b, c, d, e, f);
		};

		//mehthod 3(加入完整链接，此方法这里不再演示)
		
		
		
		$(document).ready(function(){
			
			$("#product-detail-tab").tabs();//评价tab
			
			//makeTabs( "#product-detail-tab" );
			
		});
</script>







</head>

<body class="root61">


	<div id="header">
        <%@ include file="../common/header/headermenu.jsp" %>
		<%@ include file="../common/header/secondheader.jsp"%>

	</div>
	
	<!-- ------------------------------和本网页相关--------------------------------------- -->
		<script type="text/javascript">
			var id='<s:property value="id"  escape="false" />';
		
		</script>
		<script type="text/javascript" src="common/js/product.ship.js"></script>
	    <script type="text/javascript" src="foregroundproductshow/js/productshow.js"></script>
	<!-- ------------------------------和本网页相关--------------------------------------- -->
	
	<!--！！！！！！！！！！！！！！！！！！！ 之下的代码是你需要真正使用的，需要到时候用js（切记：因为js的用户体验非常好）生成！！！！！！！！！！！！！！！！！！-->
	<div id="second-category-menu">

		<div id="lagout-three">
				<div class="w">
					<div id="product-intro" class="">
						<div id="name">
							<h1 class="mui-break-word"></h1>
							<strong><div id="product-desc" class="mui-break-word"></div></strong>
						</div><!--name end-->
						<div class="clearfix" clstag="">
				
							<ul id="summary">
							  <!-- 
							    <li id="pop-origin-price-li" style="margin: 5px 0px;">
			                        <div class="dt"><s:text name="Origin-Price"></s:text>:</div>
			                        <div class="dd mui-origin-price">
			                            <strong class="p-price">
			                                 <span id="pop-origin-price-symbol"></span>
			                                 <span id="pop-origin-price"></span>
			                            </strong>
			                            <a id="notice-downp" href="#none" clstag="shangpin|keycount|product|jiangjia">(降价通知)</a>
			                        </div>
			                    </li>  -->
								<li id="summary-price" style="margin: 0px 0px;">
									<div class="dt"><s:text name="Discount-Price"></s:text>:</div>
									<div class="dd">
										<strong class="origin-price">
			                                 <span id="pop-origin-price-symbol"></span>
			                                 <span id="pop-origin-price"></span>
			                            </strong>
										<strong class="p-price" id="jd-price">
											 <span id="pop-discount-price-symbol"></span>
											 <span id="sku-discount-price"></span>
										</strong>
										<!-- 
										<a id="notice-downp" href="#none" clstag="shangpin|keycount|product|jiangjia">(降价通知)</a>
										 -->
									</div>
								</li>
						<!-- 
								<div class="b5m-detail-page-wrap">
									<div class="b5m-wrapper b5m-tip-wrapper">
									<div class="b5m-uc-tip-wrap" style="display:none;">
									<div class="b5m-uc-tip-item">
									<span class="b5m-uc-tip-icon b5m-uc-tip-icon-2  b5m-uc-tip-item-notbind">&nbsp;</span>
									<a class="J_b5m-uc-goto-bind" data-text="短信提醒" href="http://ucenter.b5m.com/forward.htm?method=/user/account/security/mobile/bindMobile&amp;hmsr=b5t&amp;hmmd=button&amp;hmci=smsbind" target="_blank">短信提醒</a>
									</div>
									<div class="b5m-uc-tip-item"><span class="b5m-uc-tip-icon b5m-uc-tip-icon-1  b5m-uc-tip-item-notbind">&nbsp;</span>
									<a class="J_b5m-uc-goto-bind" data-text="邮件提醒" href="http://ucenter.b5m.com/forward.htm?method=/user/account/security/email/validateEmail&amp;hmsr=b5t&amp;hmmd=button&amp;hmci=mailbind" target="_blank">邮件提醒</a></div>
									</div></div><div class="b5m-wrapper b5m-his-wrapper">
									<div id="his_bar_wrap" class="b5m-his-bar-wrap">
									<span class="b5m-price-trend-flag-wrap b5m-price-status-3"></span>
									
									</div></div>
									
									<div class="b5m-wrapper b5m-col-wrapper">
									<div class="J_b5m-collect-add-wrap b5m-collect-add-wrap">
									<div class="J_b5m-collect-btn  b5m-collect-btn-beta ">
									</div>
									</div>
									</div>
								</div>
						 -->
						 <!-- 
								<li id="summary-grade">
									<div class="dt"><s:text name="Product-Rate"></s:text>：</div>
									<div class="dd">
										<span class="star sa5"></span>
										<a href="#comment" clstag="shangpin|keycount|product|pingjiabtn" style="float: left;">(已有451人评价)</a>
									</div>
								</li>
						-->

								
								<li id="summary-tips" class="hide">
									<div class="dt">温馨提示：</div>
									<div class="dd"></div>
								</li>
								<li id="summary-gifts" class="hide">
									<div class="dt">赠　　品：</div>
									<div class="dd"></div>
								</li>
							</ul><!--summary end-->
			
							<!--  
							<div id="brand-bar-pop" clstag="shangpin|keycount|product|btn-coll">
								<dl id="evaluate">
									<dt><s:text name="Overall-Rate"></s:text>：</dt>
									<dd>
										<span class="heart-white"><span class="heart-red h9">&nbsp;</span></span>
										<em class="evaluate-grade"><strong title="9.5266"><a href="http://mall.jd.com/shopLevel-42878.html" target="_blank">9.5</a></strong>分</em><s></s>
									</dd>
						
								</dl>
								<div id="evaluate-detail" class="m">        
									<div class="mt"><style type="text/css">#brand-bar-pop #evaluate{display:block;}</style>            
									<div class="fl"><s:text name="Rate-Detail"></s:text></div>                  </div>        
									<div class="mc">            <dl>                <dt>商品评分：</dt>                <dd>                    
									<span class="eva-grade" title="9.4936">9.49<b>分</b></span>                    
									
									</dd>            </dl>            <dl>                <dt>服务评分：</dt>                <dd>                
									<span class="eva-grade" title="9.3246">9.32<b>分</b></span>                   
									
								    </dd>            </dl>            <dl>                <dt>时效评分：</dt>                <dd>       
									<span class="eva-grade" title="9.7616">9.76<b>分</b></span>            </dd>            </dl>
									<div class="line"></div>        
									</div>
								</div>
								
							</div>
							-->
							<ul id="text-ul-attr" style="display: none;">
								<li  class='text-li myserialnumberli' style="display:none">
									<div class='dt'><s:text name="product.myserialnumber"></s:text>：</div>
									<div class='text-dd myserialnumber'></div>
								</li>
							</ul>
							<ul id="choose" clstag="shangpin|keycount|product|choose">
								<li id="product-attr-link"  class="pinfo" style="display: none;"></li>
								<li id="text-ul" style="display: none;"></li>
								<li id="summary-stock">
									<div class="dt"><s:text name="Shipping"></s:text>：</div>
									<div class="dd">
										<div id="store-selector" class="" clstag="shangpin|keycount|product|quyuxuanze">
											<div class="text">
												<div id="shipping-cost">
													<b class="shipping-real-cost"></b>
													<span class="shipping-to">to</span>
													<span id="store-prompt">
														<a id="shipping-link" class="shipping-link" rel="nofollow" href="javascript:void(0);" tabindex="-1" data-spm-anchor-id="0.0.0.0">
															<span id="shipping-country"></span>
															<span id="shipping-company-info">
																<span class="shipping-via">via</span> 
																<span id="shipping-company">Seller's Shipping Method</span>
															</span> 
														</a>
													</span>
												</div>
											</div>
										</div><!--store-selector end-->
										<!--
										<div id="store-prompt">
											<a id="shipping-link" class="shipping-link" rel="nofollow" href="javascript:void(0);" tabindex="-1" data-spm-anchor-id="0.0.0.0">
												<span id="shipping-country"></span>
												<span id="shipping-company-info">
													<span class="shipping-via">via</span> 
													<span id="shipping-company">Seller's Shipping Method</span>
												</span> 
											</a>
										
										</div>store-prompt end--->
										<div id="product-info-shipping-sub" class="sub-info" style="display: block;">
											Delivery: 
											<span id="shipping-delivery-day">39-49</span> days (ships out within 10 business days)
										</div>
									</div>
									<span class="clr"></span>
								</li>
								<li id="choose-amount">
									<div class="dt">购买数量：</div>
									<div class="dd">
										<div class="wrap-input">
												<a class="btn-reduce" href="javascript:;" onclick="muiSetAmount.reduce('#buy-num');calculateShipFeeInpage();"><s:text name="Reduce-Number"></s:text></a>
												<a class="btn-add" href="javascript:;" onclick="muiSetAmount.add('#buy-num');calculateShipFeeInpage();"><s:text name="Add-Number"></s:text></a>
												<input class="text" id="buy-num" value="1" onkeyup="muiSetAmount.modify('#buy-num');" onkeydown="muiSetAmount.modify('#buy-num');">
										</div>
									</div>
								</li>
								<li id="choose-service" class="hide"></li><li id="choose-result" style="display: list-item;"><div class="dt"></div><div class="dd"><em><s:text name="Already-Select"></s:text>:</em><strong><span id="mui-already-select"></span></strong></div></li>
								<li id="choose-btns">
									<div id="choose-btn-append" class="btn">
											<a class="btn-append " id="InitCartUrl" href="javascript:void(0)"  title="">加入购物车<b></b></a>
									</div>
									<div id="choose-btn-easybuy" class="btn" clstag="shangpin|keycount|product|btn-easybuy" style="display: block;"></div>
									<div id="choose-btn-divide" class="btn" style="display: block;"></div>
									<!-- 
									<div id="choose-btn-coll" class="btn">
											<a href="#none" id="coll1033364137" onclick="mark(1033364137,4);" class="btn-coll" clstag="shangpin|keycount|product|btn-guanzhu">加关注<b></b></a>
									</div>  -->
									<div id="Fqfk_Tip" class="Tip360" style="display:none;"></div>
								    <div class="b5m-duihuan-wrap b5m-duihuan-jd-com"  style="display:none;"><span class="b5m-icon b5m-duihuan-btn"></span></div>
								</li>
							</ul><!--choose end-->
							<span class="clr"></span>
						</div>
						
						<div id="preview">
							<div id="spec-n1" class="jqzoom" onclick="" clstag="shangpin|keycount|product|spec-n1">
								<img  id="product-big-img" data-img="1" width="350px" height="350px" src="" alt="" jqimg="">
							</div>
									
							<div id="spec-list" clstag="shangpin|keycount|product|spec-n5">
								<a href="javascript:;" class="spec-control  disabled" id="spec-forward"></a>
								<a href="javascript:;" class="spec-control disabled" id="spec-backward"></a>
								<div class="spec-items" style="position: absolute; width: 310px; height: 54px; overflow: hidden;">
									<ul class="lh" style="position: absolute; left: 0px; top: 0px;">                        
									</ul>
								</div>
							</div>
			
						</div><!--preview end-->
					</div><!--product-intro end-->
				</div>
			    

				<!-- detail of product And Evaluate -->
				<div id="product-detail-tab">
				  <ul>
				    <li><a href="#tabs-111">商品详情</a></li>
				    <li><a href="#tabs-211">累计评价</a></li>
				    <li><a href="#tabs-311">产品咨询</a></li>
				  </ul>
				  <div id="tabs-111">
				  	<div id="attributes" class="attributes"> 
				  		<ul id="attributes-list" class="attributes-list"> </ul>
				  	</div>
				  	<div id="product_detail_desc"> </div>
				  </div>
				  <div id="tabs-211">
				  </div>
				  <div id="tabs-311">
				  </div>
				</div><!--end of  detail of product And Evaluate -->
		
		</div>
		<!-- end of lagout-three -->
	</div>


	<div style="clear:both"></div>
<!-- ----------------------------------------------------------------------------------- -->
            <div id="footer">
                <%@ include file="../common/header/footer.jsp" %>
             
            </div>
<!-- ----------------------------------------------------------------------------------- -->


<!-- ----------------------------------------about shipping------------------------------------------- -->
<div id="mui-shipping" class="ui-widget">
    <label id="country-label" for="mui-shipping-country" style="margin: 0 0 0 0;">Ship my order(s) to:</label>
    <select name="mui-shipping-country" id="mui-shipping-country">
      
    </select>
	<div id="shipping-dialog-company-list"><div class="shipping-dialog-company-caption">Choose Shipping Method</div>
		<div class="shipping-dialog-company">
			<table>
			    <thead>
			        <tr>
			            <th></th>
			            <td>Shipping Company</td>
			            <td>Estimated Delivery Time</td>
			            <td>Shipping Cost</td>
			        </tr>
			    </thead>
			    <tbody id="mui-shipping-info">
			    </tbody>
			</table>
			

		</div>
	
	</div>
	<div style="display: none;" id="mui-No-Shipping-Info">
	            <strong><s:text name="No-Shipping-Info"></s:text></strong>
	</div>
</div>
<style>
   label {
   display: block;
   margin: 30px 0 0 0;
 }
 select {
   width: 200px;
 }
 .overflow {
   height: 200px;
 }
</style>
<!-- ----------------------------------------------------------------------------------- -->
<!-- ------------------------------------------about user login----------------------------------------- -->
<div id="minilogin-dialog" class="ui-widget" title="Please Login">
  <!-- <iframe class="j_minilogin_iframe" style="background: #FFF; margin:0 0 0 0;" width="320" scrolling="no" height="304" frameborder="no" src="userlogin/miniuserlogin.jsp">

	</iframe> --> 
	<%@ include file="../userlogin/miniuserlogin.jsp" %>
</div>
<!-- -------------------------------end of userLoing---------------------------------------------------- -->
<!-- ------------------------------------------about product attribute popshow----------------------------------------- -->
<div id="miniproductAttr-dialog" class="ui-widget">
  	    <div id="productAttrContent">
	    </div>
</div>
<!-- -------------------------------end of userLoing---------------------------------------------------- -->
</body>
</html>
