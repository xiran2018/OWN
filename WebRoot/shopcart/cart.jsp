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
<link href="shopcart/css/shopcart.css" rel="stylesheet" type="text/css" />

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
			<div class="main-wrapper"><!-- 购物车信息 -->		
				<div class="main-title util-clearfix">
					  <div class="continue-shopping">
					 	<a href="#" class="continue-btn">Continue Shopping</a>
					 </div>
					 <div class="country-selector-div">
					   <span class="country-selector-title">Ship my order(s) to:</span>
					   <select name="mui-shipping-country" id="mui-shipping-country">
      
                       </select>
					 </div>
				</div>
				<div class="item-group-wrapper">
					<table class="item-group" data-s-id="222026140">
					<caption>
						<!-- <span class="gold-supplier">Seller:</span>
						<a class="seller-name" href="http://www.aliexpress.com/store/1477384">quanliang jing</a> -->
						<span class="contact-wrapper">
							<a title="Chat with me now" id="talkId1" class="atm16" href="javascript:;" >Chat now!</a>
							<a class="contact-now" data-action="feedback-message-ae"  href="javascript:void(0)" title="Contact now">Contact now!</a>
						</span>
						<div style="clear:both;"></div>
					</caption>
					<thead>
						<tr>
							<th class="fourColume1_1 item-selectAll item-header"><input type="checkbox" id="selectAll" name="selectAll" onclick="javascript:selectAll(this);"></th>
							<th class="item-product item-header">Product Name &amp; Details</th>
							<th class="item-quality item-header">Quantity</th>
							<th class="item-price item-header">Price</th>
							<th class="item-shipping-cost item-header">Shipping Details</th>
							<th class="item-operate item-header"></th>
						</tr>
					</thead>
					<tbody id="shopCartItems">
					
					</tbody>
					<tfoot>
						 <tr>
							 <td colspan="5">
								<div class="discount-info">
									<span class="discount-info-title">Store promotion:</span>
									<div class="discount-content"><div class="discount-item"><p class="discount-coupon"><span class="discount-coupon-title j-store-coupon-tip" data-sending="false">Get Seller Coupons</span></p></div>
										<span class="discount-text">Get $5.00 off for $80.00 spent in this store.</span>
										<span class="shop-link"><a href="http://www.aliexpress.com/store/1477384" target="_blank">Shop now</a></span>
									</div>
								</div>
								<div class="product-price-info-wrapper">
								 <div class="product-price-info1">
									 <span class="product-price-title">Subtotal:</span>
									 <span class="value product-price-value notranslate">0.00</span>
									 <span class="product-price-title">Shipping:</span>
									<span class="value product-ship-value notranslate">0.00</span>
								 
								 </div>
								
								 <div class="product-price-info2">
								 	<span class="product-price-title">Fixed Discount:</span>
								 	<span class="value notranslate">-&nbsp;0.00</span>
								</div>
								  <div class="product-price-info2">
									 <span class="product-price-title">Total:</span>
									 <span class="product-price-total ui-cost notranslate"><b>0.00</b></span>
								   </div>
								
								
									<div class="product-price-info3">
										 <a id="confirm-order" onclick="checkSelectItem();return false" class="ui-button ui-button-primary ui-button-medium product-buy-only" href="" data-batman-id="i4veo1r2">Buy all from this seller</a>
										 <input type="hidden" name="oneSellerProductIDs" value="32222053570,32221438392,">
									 </div>
									 <!-- 
									 <div class="product-price-info2 paypal-express-checkout">
										 <a class="" href="/payment-no-control/set-express-checkout-paypal.action?">
										 	<img src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" align="left" style="margin-right:7px;">
										 </a>
									 </div>
									  -->
								 </div>
						 	</td>
						 </tr>
					</tfoot>
					</table>
				</div>
				<form action="shopcart/updateShopCartQuantity.action" method="post" id="dlg-edit-quantity" style="z-index: 99; left: 566px; top: 202px; /* display: none; */">
					<div class="inner util-clearfix">
						<input type="hidden"  id="hid-product-id-quantity" value="">
						<a id="quantity-minus" class="quantity-minus" href="javascript:void(0);" onclick="muiSetAmount.reduce('#txt-editable-quantity');">minus</a>
						<input name="count"  id="txt-editable-quantity" onkeyup="muiSetAmount.modify('#txt-editable-quantity');" onkeydown="muiSetAmount.modify('#txt-editable-quantity');" class="layout-input ui-textfield ui-textfield-system" autocomplete="off">
						<a id="quantity-add" class="quantity-add" href="javascript:void(0);"  onclick="muiSetAmount.add('#txt-editable-quantity');">plus</a>
						<span id="dlg-unit-quantity">piece</span>
						<input type="hidden" name="cartid" id="cartid" value="">
						<input type="button" id="btn-ok-quantity" value="OK" onclick="checkToSubmit(this);">
						<a id="btn-cancel-quantity">Cancel</a>
						<div class="inventory-wrapper">Maximum:<span id="inventory-value">996</span></div>
					</div>
				</form>
			</div><!-- end of 购物车信息 -->
		</div>
		<!-- end of lagout-three -->
	</div>


	<div style="clear:both"></div>
<!-- ----------------------------------------------------------------------------------- -->
            <div id="footer">
                <%@ include file="../common/header/footer.jsp" %>
             
            </div>
<!-- ----------------------------------------------------------------------------------- -->
<!-- ------------------------------和本网页相关--------------------------------------- -->
<script type="text/javascript" src="common/js/product.price.js"></script>
<script type="text/javascript" src="common/js/product.ship.js"></script>
<script type="text/javascript" src="shopcart/js/select.all.js"></script>
<script type="text/javascript" src="shopcart/js/shopcart.js"></script>

<!-- ------------------------------和本网页相关--------------------------------------- -->
</body>
</html>
