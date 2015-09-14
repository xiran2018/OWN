<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>京东</title>


<!-- header以下布局 -->
<link href="common/css/secondstyle.css" rel="stylesheet" type="text/css" />

<!--商品分类侧边栏 -->
<link href="common/css/secondsider.css" rel="stylesheet" type="text/css" />

<!--购物车布局 -->
<link href="order/css/order.css" rel="stylesheet" type="text/css" />

<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css" /> 

<!--去小数点等-->
<script type="text/javascript" src="js/math.js"></script>

<script type="text/javascript">
	//about the shipping country
	var defaultShippingCountryId=<%=session.getAttribute("defaultShippingCountryId")%>;
	
	//about country info
	var countryList=<s:property value="returnCountryJsonString"  escape="false" />;
	//countryList = eval('(' + countryList + ')');
	
	//about select ShopCartItem
	var selectShopCartItemList=<s:property value="returnJsonString"  escape="false" />;
	
	
	//about mail-address
	var mailAddressList=<s:property value="returnMailAddressJsonString"  escape="false" />;
	//mailAddressList = eval('(' + mailAddressList + ')');
	
	//default mail-address-id
	var defaultMailAddressId='<s:property value="mailAddressId"  escape="false" />';
	
	//用户积分信息
	var jifen='<s:property value="usejifen"  escape="false" />';
	
	//在订单确认页面，改变购物车数量和货运信息时，需要返回的页面
	var redirctURL='<s:property value="redirctURL"  escape="false" />';
	
	var availableProductShopcartIds='<s:property value="availableProductShopcartIds"  escape="false" />';
</script>


</head>

<body>

	<div id="header">
        <%@ include file="../common/header/headermenu.jsp" %>
		<%@ include file="../common/header/secondheader.jsp"%>

	</div>


	<!--！！！！！！！！！！！！！！！！！！！ 之下的代码是你需要真正使用的，需要到时候用js（切记：因为js的用户体验非常好）生成！！！！！！！！！！！！！！！！！！-->
	<div id="second-category-menu">
		<div id="lagout-three">
			<div id="page" class="multiple-lan" data-widget-cid="widget-7">
				<!-- 付款进度条 -->
				<div class="process-min">
					<div class="ui-step ui-step-normal"> 
						<ol class="col4">
							<li class="current"><span class="state">Review your Order</span></li>
							<li class=""><span class="state">Payment</span></li>
							<li class="last"><span class="state">Done</span></li>
						</ol>
					</div>
				</div>
				  
				<!-- tips info -->
				<div class="order-warn-tips">
					<p class="ui-notice ui-notice-normal ui-notice-prompt">
						<span class="ui-notice-body">You have changed your shipping information. The shipping cost may change accordingly.</span>
					</p>
				</div>
				
				<!-- all select product items -->
				
				<form name="orderForm" id="place-order-form" method="post" action='/shopcart/place-order.action?availableProductShopcartIds=<s:property value="availableProductShopcartIds"  escape="false" />'>
				
					<!-- 邮寄地址相关 -->
					<input id="place-order-change-address" type="hidden" name="changeAddressPage" value="false">
					<input name="_csrf_token_" type="hidden" value="4u7op37ow0sy"><input type="hidden" id="edit-address-id" name="modifyId" value="">
					<input type="hidden" id="edit-address-statue" name="addressOperateFlag" value="info">
				
				  
					<div id="address-main">
						<a name="anchor-address"></a>
					
					
						<!-- 编辑邮寄地址 -->
						<div class="add-address-box hide" id="edit-address">
							<div class="edit-address-title">
								1. Please fill in your shipping address. Don't forget to save! 
							</div>
						    <div class="order-address-item">
								<div class="order-address-manage">
									<div id="address-edit-box" class="address-info-box notranslate">
										<dl class="address-info-item ui-form-item">
											<dt class="ui-form-label">Contact Name:</dt>
											<dd class="ui-form-control util-clearfix" id="ui-contactName-item">
											<input type="text" data-type="contactName" maxlength="128" class="ui-textfield ui-textfield-system" id="contact-name" name="contact-name" value="">
											<p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="contact-name-tips" style="display:none;">Please enter a Contact Name.</p>
											</dd>
										</dl>
										<dl class="address-info-item ui-form-item">
											<dt class="ui-form-label">Country/Region:</dt>
											<dd class="ui-form-control util-clearfix">
												<select data-type="countryRegion" id="country-region-select" class="select-txt" name="_fmo.m._0.co">
													<option value="">Select an option...</option>
												 </select>
												 <p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="country-id-tips" style="display:none;">Please select a country.</p>
											</dd>
										  </dl>
									<dl class="address-info-item ui-form-item">
										<dt class="ui-form-label">Street Address:</dt>
										<dd>
											<div class="address-info-line ui-form-control util-clearfix">
												<input type="text" class="ui-textfield ui-textfield-system" maxlength="256" id="street-address" data-type="streetAddress" name="street-address" value="" placeholder="Street address">
												<p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="street-address-tips" style="display:none;">Please enter an Address</p>
											</div>
											<div class="address-info-line ui-form-control util-clearfix">
												<input type="text" class="ui-textfield ui-textfield-system" maxlength="256" id="streetAddressOther" data-type="streetAddressOther" name="streetAddressOther" value="" placeholder="Apartment, suite, unit etc. (optional)">
											</div>
										</dd>
									</dl>
									 
									<dl class="address-info-item city-address-item ui-form-item" id="city-address-item">
										<dt class="ui-form-label">City:</dt>
										<dd class="ui-form-control util-clearfix">
											<input type="text" class="ui-textfield ui-textfield-system" maxlength="64" data-type="addressCity" name="addressCity" id="addressCity" value="">
											</input>
											<p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="address-city-tips" style="display:none;">Please enter a City</p>
										</dd>
									</dl>
									 
									 
									<dl class="address-info-item ui-form-item">
										<dt class="ui-form-label">Zip/Postal Code:</dt>
										<dd class="ui-form-control util-clearfix">
											<input type="text" class="ui-textfield ui-textfield-system" maxlength="9" data-type="adressPostalCode" id="adressPostalCode" name="adressPostalCode" value="">
											<p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="address-postal-tips" style="display:none;">Please enter a ZIP/Postal Code</p>
										</dd>
										<dd>
											<p class="tips-txt">If you don't have a zip code in your country, input "None".</p>
										</dd>
									 </dl>
									
									
									<dl class="address-info-item ui-form-item" id="telphone-info-item">
										<dt class="ui-form-label">Tel:</dt>
										<dd class="ui-form-control util-clearfix">
											<input type="text" class="ui-textfield ui-textfield-system ui-countryNumber" data-type="numberCountry" maxlength="8" name="countryNumber" id="countryNumber" value="">
											<input type="text" class="ui-textfield ui-textfield-system ui-areaNumber" data-type="numberArea" maxlength="8" name="areaNumber"  id="areaNumber"  value="">
											<input type="text" class="ui-textfield ui-textfield-system ui-localNumber" data-type="numberPhone" maxlength="36" name="localNumber"  id="localNumber"  value="">
										</dd>
										<dd>
											<p class="tips-txt">Country Code - City Code - Tel Number</p>
										</dd>
									</dl>
									<dl class="address-info-item ui-form-item" id="mobile-info-item">
										<dt class="ui-form-label">Mobile:</dt>
										<dd class="ui-form-control util-clearfix">
											<input type="text" class="ui-textfield ui-textfield-system" data-type="phoneNumber" id="mobile-input-ele" maxlength="16" name="mobile-input-ele" value="">
											<p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="mobile-tips" style="display:none;">You must include a  Mobile number</p>
										</dd>
									</dl>
									<div class="address-field-buttons">
										<a class="ui-button ui-button-primary ui-button-medium address-btn-enter" data-action="submitAddress" href="javascript:;">Save and ship to this address</a>
										<a class="ui-button ui-button-normal ui-button-medium address-btn-cancel" data-action="cancelAddress" href="javascript:;">Cancel</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="order-address-show  notranslate" id="all-address-list">
						<div class="address-title">1. Select your shipping information:</div>
						<div class="address-list-main util-clearfix">
							
						</div>
						<div class="operation-address">
							<a class="add-address-btn" href="javascript:;" data-action="add-adress">Add a new address</a>
							<a class="select-address-btn" href="javascript:;" data-action="select-adress">Select other addresses</a>
						</div>
					</div>
					
				</div>
				
				 <!-- order info [start] -->
				
				<!-- Order Container -->
				<div class="order-container" id="orders-main" data-widget-cid="widget-5">
				<div class="order-container-mask hide" id="orders-mask"><iframe class="hack-iframe" src="about:blank" frameborder="no"></iframe></div>
				<!-- Order Title -->
				<div class="order-title">
				 <h2>2. Review and confirm your order (2 items):</h2>
				</div>
				
				 <!-- seller foreach -->
				   <!-- Order Item -->
				 <div class="order-table-wrapper">
					 <table class="order-table">
						 <thead>
						 <tr>
						 <th width="740">Seller: SHENZHEN MOONAR TECH. CO.,LTD</th>
						 <th></th>
						 </tr>
						 </thead>
						 
						 <!-- order foreach -->
						 <tbody id="shopCartItems">
							 <tr>
							 <th colspan="2">Product Name &amp; Details</th>
							 </tr>
							 <!-- product foreach -->
						 </tbody>
						 <tfoot>
							 <tr>
							 	<td colspan="2" class="order-price">
								<input type="hidden" name="seller-coupon-item-201057893" class="seller-coupon-input" value="">
							 	<input type="hidden" class="son-order-price" value="11.07" mulvalue="11.07 ">
								<input type="hidden" class="curCouponPrice" value="" mulvalue="0.0">
								<input type="hidden" class="son-sell-store" value="201057893">
								<!--coupon start update -->
								<!-- coupon end-->
								<div class="orderPrice-detail multiple-lan util-clearfix">
								<p class="util-clearfix">
								<span class="p-title">Subtotal:</span>
								<span class="p-val subtotal-price"></span>
								</p>
								<p class="util-clearfix">
								<span class="p-title">Shipping:</span>
								<span class="p-val shipping-price"></span>
								</p>
								
								
								</div>
								<div class="orderPrice-total-detail multiple-lan util-clearfix">
								 <p class="whole-coupon-box hide">Coupon:<span class="whole-coupon-price"></span></p>
								 <p class="util-clearfix">
								 <span class="whole-price-label">Total:</span>
								 <span class="whole-price ui-cost notranslate">
								 <b  id="totalprice"></b>
								 </span>
								 </p>
								   </div>
								 </td>
							 </tr>
						 </tfoot>
					 <!-- order foreach end-->
					 </table>
				 </div>
				 <!-- seller foreach end -->
				<!-- AE Coupon or CouponCode NewAdd begin -->
				 <div class="coupon-wrapper ae-coupon util-clearfix notranslate">
					 <input type="hidden" name="coupon-item" class="coupon-id-input" value="">
					 <input type="hidden" name="coupon-code-item" class="coupon-code-input" value="">
					 <input type="hidden" class="curCouponPrice" value="" mulvalue="">
					 <a class="return-btn" href="/shopcart/cart.jsp">Return to Shopping Cart</a>
					 <div class="coupon-wrapper-inner util-clearfix">
						<div class="coupon-box userCoupon-box">
							 <label class="ui-label">Apply  Integral:</label>
							 <div class="coupon-main-box">
								<input onKeyUp="changeValue(this)" name="costTjb" type="text" class="text tbGold-usePoint J_MakePoint c2c-text-default"   id="J_tjbToUse">
							  </div>
							 <span class="coupon-price selectCoupon-price notranslate">- USD $0.00</span>
							 <div class="tbGold-useTip J-hide ">
    
							    (you have<em id="J_AvailableTjb"></em>
							    points，aviavle <em class="point-available" id="J_MaxUsableTJB"></em>
							    points)
							    
							 </div>
						</div>
						<div class="coupon-box userCoupon-box">
							 <label class="ui-label"><input type="checkbox" data-type="select" class="ui-checkbox ui-checkbox-system">Apply  Coupon:</label>
							 <div class="coupon-main-box">
								<span class="coupon-title disabled" data-type="select-drop">You don’t have any coupons</span>
							  </div>
							 <span class="coupon-price selectCoupon-price notranslate">- USD $0.00</span>
						</div>
						 <div class="coupon-box couponCode-box">
							 <label class="ui-label"><input type="checkbox" data-type="select" class="ui-checkbox ui-checkbox-system">
							 Enter coupon code:</label>
							 <span class="coupon-main">
							 <input type="text" class="ui-textfield ui-textfield-system" disabled="disabled">
							 <a data-type="apply-couponcode" class="ui-button ui-button-normal ui-button-medium disabled" href="javascript:;">Apply</a>
							 </span>
							 <span class="coupon-price couponCode-price notranslate">- USD $0.00</span>
						 </div>
						  <input type="hidden" name="order-cluster-fix-discount" class="order-cluster-fix-discount" value="">
						 <div class="ae-fix-discount-wrapper util-clearfix hidden">
							 <label class="ui-label"></label>
							 <span class="ae-fix-discount-price"></span>
						 </div>
				    </div>
				 </div>
				<!-- AE Coupon or CouponCode NewAdd end -->
				
				 <!-- All Total Price -->
				 <div class="all-total-price util-clearfix">
					<a name="anchor-code"></a>
					<div id="all-total-price-info">
						 <div class="all-total-price-warpper"><em>All Total:</em>
							 <span id="all-totalfee" class="ui-cost notranslate">
							 <b id="all-totalfee-show"></b>
							 </span>
					   	</div>
						 <!-- Place Order Button -->
						 <div class="place-order-button">
							<button type="button" class="ui-button ui-button-primary ui-button-large" id="place-order-btn">Place Order</button>
						  </div>
					 </div>
				
					 <div id="bp-banner-new">
						 <div class="bp-horizontal-banner bp-shopcart-banner">
							<span class="bp-icon"></span>
						    <div class="buy-protection-info">
						        <h3>Buyer Protection</h3>
						        <ul class="buy-protection-info-list util-clearfix">
						            <li class="bp-info-item"><em>Full Refund</em>  if you don't receive your order</li>
						            <li class="bp-info-item"><em>Refund or Keep</em>  items not as described</li>
						        </ul>
						        <div class="buy-protection-more">
						            <a rel="nofollow" target="_blank" href="http://www.aliexpress.com/buyerprotection/index.html">Learn More</a>
						        </div>                              
						    </div>
						</div>
					</div>
				 </div>
			    <!-- -->
				<div class="payment-method util-clearfix">
					<span class="payment-method-title">Payment Methods:</span>
					<!--skylight-wholesale/payment/partner_logo.html -start -->
					<ul class="util-clearfix payment-logo-method">
					    <li class="pm-type-visa-s-1"></li>
					    <li class="pm-type-mastercard-s-1"></li>
					    <li class="pm-type-westernUnion-s-1"></li>
					    <li class="pm-type-maestro-s-1"></li>
					    <!--li class="pm-type-solo-s-1"></li-->
					    <!--li class="pm-type-cartebleue-s-1"></li-->
					    <!--li class="pm-type-4b-s-1"></li-->
					    <!--li class="pm-type-euro6000-s-1"></li-->
					    <!--li class="pm-type-cartasi-s-1"></li-->
					    <!--li class="pm-type-postepay-s-1"></li-->
					    <li class="pm-type-banktransfer-s-1"><strong>Bank Transfer</strong></li>
					    <li class="pm-type-qiwi-s-1"><strong>QIWI</strong></li>
					    <li class="pm-type-webmoney-s-1"><strong>webmoney</strong></li>
					    <li class="pm-type-boleto-s-1"><strong>Boleto</strong></li>
					    <li class="pm-type-yandex-s-l"><strong>Yandex</strong></li>
					    <li class="pm-type-doku-s-l"><strong>Doku</strong></li>
					
					</ul>
					<!--skylight-wholesale/payment/partner_logo.html -end -->
				</div>
			</div>
		<!-- order info [end]-->
		</form> 
				
		 <!-- edit quantity dialog START -->
		 <form action="shopcart/updateShopCartQuantityInConfirmOrder.action" method="post" id="dlg-edit-quantity" style="display:none;z-index:99;">
			 <div class="inner util-clearfix">
			 <input type="hidden"  id="hid-product-id-quantity" value="">
			 <a id="quantity-minus" class="quantity-minus" href="javascript:void(0);"  onclick="muiSetAmount.reduce('#txt-editable-quantity');">minus</a>
			 <input name="count" id="txt-editable-quantity" class="layout-input ui-textfield ui-textfield-system" autocomplete="off">
			 <a id="quantity-add" class="quantity-add" href="javascript:void(0);"   onclick="muiSetAmount.add('#txt-editable-quantity');">plus</a>
			 <span id="dlg-unit-quantity">pieces </span>
			 <input type="hidden" name="cartid" id="cartid" value="">
			 <input type="hidden" name="redirctURL" id="redirctURL" value='<s:property value="redirctURL"  escape="false" />'>
			 <input type="button" id="btn-ok-quantity" value="OK" onclick="checkToSubmit(this);">
			 <a id="btn-cancel-quantity">Cancel</a>
			 <div class="inventory-wrapper">Maximum:<span id="inventory-value"></span></div>
			 </div>
		 </form>
		 <!-- edit quantity dialog END -->
	 </div>
  </div><!-- end of lagout-three -->
</div>


	<div style="clear:both"></div>
<!-- ----------------------------------------------------------------------------------- -->
            <div id="footer">
                <%@ include file="../common/header/footer.jsp" %>
             
            </div>
<!-- ----------------------------------------------------------------------------------- -->
<!-- ------------------------------和本网页相关--------------------------------------- -->
<script type="text/javascript" src="common/js/product.price.js"></script>  <!-- 包含货币符号 -->
<script type="text/javascript" src="common/js/product.ship.js"></script>
<script type="text/javascript" src="order/js/confirmorder.js"></script>

<!-- ------------------------------和本网页相关--------------------------------------- -->
</body>
</html>
