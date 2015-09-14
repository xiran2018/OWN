<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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

<!-- ------------------------------和本网页相关--------------------------------------- -->
<script type="text/javascript" src="shopcart/js/shopcart.js"></script>
		
<!-- ------------------------------和本网页相关--------------------------------------- -->

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
					 	<a href="//www.aliexpress.com" class="continue-btn">Continue Shopping</a>
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
					<span class="gold-supplier">Seller:</span>
					<a class="seller-name" href="http://www.aliexpress.com/store/1477384">quanliang jing</a>
					<span class="contact-wrapper">
					<a title="Chat with me now" id="talkId1" class="atm16" href="javascript:;" data-memberid="8pctgRBMALMYyP3T0fZK1/sGzOV1gSfj" data-from="12" data-id1="222026140" rel="nofollow" data-widget-cid="widget-14">Chat now!</a>
					<a class="contact-now" data-action="feedback-message-ae" data-from="12" data-membertype="0" data-id1="wNGevawqEOu6i5lDFc7jGQ%3D%3D" data-id2="" href="javascript:void(0)" title="Contact now" rel="nofollow" data-spm-anchor-id="0.0.0.0">Contact now!</a>
					   </span>
					<div style="clear:both;"></div>
					</caption>
					<thead>
						<tr>
							<th class="item-product item-header">Product Name &amp; Details</th>
							<th class="item-quality item-header">Quantity</th>
							<th class="item-price item-header">Price</th>
							<th class="item-shipping-cost item-header">Shipping Details</th>
							<th class="item-operate item-header"></th>
						</tr>
					</thead>
					<tbody>
					
					  
					<tr class="item-product" productid="-2137684798" id="-2137684798-14:173#Blue;200000443:699" skuattr="14:173#Blue;200000443:699">
					  
					<td class="product-info-detail">
						<input class="hid-product-id" type="hidden" value="-2137684798">
						<dl>
							<dt class="product-pic">
							  <a target="_blank" href="http://www.aliexpress.com/item/Hot-Sale-Free-Shipping-2015-New-Trumpet-Mermaid-In-Store-Elegant-Cheap-Ready-to-Ship-Lace/32222053570.html">
							      <img class="product-pic-image" width="80" height="80" alt="Hot Sale Free Shipping 2015 New Trumpet/Mermaid In Store Elegant Cheap Ready to Ship Lace Empire Prom Dresses Dance Party Gown" src="http://i00.i.aliimg.com/wsphoto/v0/32222053570_1/Hot-Sale-Free-Shipping-2015-New-Trumpet-Mermaid-In-Store-Elegant-Cheap-Ready-to-Ship-Lace.jpg_80x80.jpg">
							  </a>
							</dt>
							<dd class="product-link">
							  <a target="_blank" href="http://www.aliexpress.com/item/Hot-Sale-Free-Shipping-2015-New-Trumpet-Mermaid-In-Store-Elegant-Cheap-Ready-to-Ship-Lace/32222053570.html" class="lnk-product-name">Hot Sale Free Shipping 2015 New Trumpet/Mermaid In Store Elegant Cheap Ready to Ship Lace Empire Prom Dresses Dance Party Gown</a>
							</dd>
						</dl>
					<dl class="product-attribute">
						<dt>Color:</dt>
						<dd>
						 <span>Blue</span>
						
						 <span style="" class="product-color-preview sku-color-173"></span>
						</dd>
					</dl>
					 <dl class="product-attribute">
						<dt>US Size:</dt>
						<dd>
						 <span>8</span>
						
						</dd>
					</dl>
					
					 </td>
					 <td class="product-quantity">
						 <input readonly="readonly" value="6" class="product-quantity-input ui-textfield ui-textfield-system ">
						 <span class="txt-unit-quantity">piece</span>
						 <input class="hid-shopcart-id" type="hidden" value="22" name="id">
						 <input class="hid-inventory" type="hidden" value="10">
						 <span class="stock-tips">Limited quantity available&nbsp;</span>
					</td>
					<td class="product-price">
					      <span class="value notranslate">US $75.04</span>
					 <span class="separator">/</span>
					 <span class="unit">piece</span>
					 <del class="product-quantity-comment">US $78.99/piece</del>
					 <span class="discount-count-down">
					<span class="discount">5% OFF</span>
					</span>
					  
					 </td>
					   <td class="product-shipping ">
					    <div class="mui-product-shipping">
						  <div class="product-shipping-select notranslate">
							TNT
						  </div>
						  <div class="pnl-shipping notranslate" style="display:none;z-index:5;">
					
							 <div class="inner">
								<form action="shopcart/updateShipId.action" method="get">
									 <ul>
										 <li>
											 <label for="shipping-select-0-1" class="shipping-label util-clearfix">
												 <span class="lbl-shipping-remaining">4-8 days</span>
												 <span class="price lbl-shipping-price">
												 <span class="value notranslate">US $94.74<br></span>
												 </span>
												 <input type="radio" value=4 name="shippingid" value="TNT" checked="true" id="shipping-select-0-1"> TNT
											 </label>
										 </li>
										 <li>
										
											 <label for="shipping-select-0-Other" class="shipping-label util-clearfix">
											 <span class="lbl-shipping-remaining">39 -60 days </span>
											 <span class="price lbl-shipping-price">
											 <span class="value notranslate">US $0.00<br></span>
											 </span>
					
											 <input type="radio" name="shippingid" id="shipping-select-0-Other" value="3">Seller's Shipping Method
											 </label>
										
										 </li>

									  </ul>
									 <div class="pnl-shipping-action util-clearfix">
										 <input type="hidden" name="cartid" value="20">
										
										 <input type="submit" class="btn-ok" value=""><a class="btn-cancel">Cancel</a>
									 </div>
								</form>
							 </div>
							 </div>
					    </div>
					
					
					 <div class="product-shipping-cost">
					<span class="currency"></span>
					<span class="value notranslate">US $94.74</span>
					</div>

					 
					   <dl class="product-shipping-comment util-clearfix">
					 <dt>Delivery Time:&nbsp;</dt>
					 <dd> 4-8 days</dd>
					 </dl>
					 <dl class="product-shipping-comment util-clearfix">
					 <dt>Processing Time:&nbsp;</dt>
					 <dd>10 days</dd>
					 </dl>
					   
					  </td>
					 
						<td class="product-operate ">
						     <div class="product-remove">
								 <form method="post" action="shopcart/deleteShopCartItem.action" class="remove-cart-product">
									<input type="hidden" name="cartid" value="18">
									<a href="javascript:void(0);"  onclick="removeCartSubmit(this);" class="remove-single-product">Remove</a>
								 </form>
							 </div>
						</td>
					
					</tr>
					    
					  
					<tr class="item-product" productid="-2138299976" id="-2138299976-14:200002130#Ivory;200000443:153" skuattr="14:200002130#Ivory;200000443:153">
					  
					<td class="product-info-detail">
					<input class="hid-product-id" type="hidden" value="-2138299976">
					<dl>
					<dt class="product-pic">
					<a target="_blank" href="http://www.aliexpress.com/item/2015-Satin-Sheath-Formal-Elegant-Ivory-Evening-Dress-Floor-Length-Wedding-Party-Dress-beading-Neck-Scoop/32221438392.html"><img class="product-pic-image" width="80" height="80" alt="2015 Satin Sheath Formal Elegant Ivory Evening Dress Floor-Length Wedding Party Dress beading Neck Scoop Sleeveless Prom Dresses" src="http://i00.i.aliimg.com/wsphoto/v0/32221438392_1/2015-Satin-Sheath-Formal-Elegant-Ivory-Evening-Dress-Floor-Length-Wedding-Party-Dress-beading-Neck-Scoop.jpg_80x80.jpg"></a>
					</dt>
					<dd class="product-link">
					<a target="_blank" href="http://www.aliexpress.com/item/2015-Satin-Sheath-Formal-Elegant-Ivory-Evening-Dress-Floor-Length-Wedding-Party-Dress-beading-Neck-Scoop/32221438392.html" class="lnk-product-name">2015 Satin Sheath Formal Elegant Ivory Evening Dress Floor-Length Wedding Party Dress beading Neck Scoop Sleeveless Prom Dresses</a>
					</dd>
					</dl>
					 <dl class="product-attribute">
					<dt>Color:</dt>
					<dd>
					 <span>Ivory</span>
					
					 <span style="" class="product-color-preview sku-color-200002130"></span>
					</dd>
					</dl>
					 <dl class="product-attribute">
					<dt>US Size:</dt>
					<dd>
					 <span>4</span>
					
					</dd>
					</dl>
					
					 </td>
					  <td class="product-quantity">
					 <input readonly="readonly" value="4" class="product-quantity-input ui-textfield ui-textfield-system ">
					   <span class="txt-unit-quantity">piece</span>
					 <input class="hid-shopcart-id" type="hidden" value="6281240901" name="id">
					  <input class="hid-inventory" type="hidden" value="10">
					    <span class="stock-tips">Limited quantity available&nbsp;</span>
					    </td>
					   <td class="product-price">
					      <span class="value notranslate">US $37.99</span>
					 <span class="separator">/</span>
					 <span class="unit">piece</span>
					 <del class="product-quantity-comment">US $39.99/piece</del>
					 <span class="discount-count-down">
					<span class="discount">5% OFF</span>
					</span>
					  
					 </td>
					   <td class="product-shipping ">
					  <div class="product-shipping-select notranslate">
					EMS
					 </div>
					
					
					 <div class="product-shipping-cost">
					<span class="currency"></span>
					<span class="value notranslate">US $36.84</span>
					</div>
					 <div class="pnl-shipping notranslate" style="display:none;z-index:5;">
					
					 <div class="inner">
					<form action="shopcartDetail.htm" method="post">
					 <ul>
					 <li>
					 <label for="shipping-select-0-1" class="shipping-label util-clearfix">
					   <span class="lbl-shipping-remaining">12-20 days</span>
					 <span class="price lbl-shipping-price">
					 <span class="value notranslate">US $36.84<br></span>
					 </span>
					   <input type="hidden" name="action" value="WholesaleShopcartAction">
					 <input type="hidden" name="event_submit_do_update_logistics_level" value="anything">
					 <input type="hidden" name="id" value="6281240901">
					 <input name="_csrf_token_" type="hidden" value="6hlqclyufpak">  
					 <input type="radio" name="shippingid" value="EMS" checked="true" id="shipping-select-0-1"> EMS
					   </label>
					 </li>
					    <li>
					
					 <label for="shipping-select-0-Other" class="shipping-label util-clearfix">
					 <span class="lbl-shipping-remaining">39 -60 days </span>
					 <span class="price lbl-shipping-price">
					 <span class="value notranslate">US $0.00<br></span>
					 </span>
					 <input type="hidden" name="action" value="WholesaleShopcartAction">
					 <input type="hidden" name="event_submit_do_update_logistics_level" value="anything">
					 <input type="hidden" name="id" value="6281240901">
					 <input name="_csrf_token_" type="hidden" value="6hlqclyufpak">  
					 <input type="radio" name="shippingid" id="shipping-select-0-Other" value="Other">Seller's Shipping Method
					 </label>
					
					 </li>
					    <li>
					
					 <label for="shipping-select-0-YANWEN_AM" class="shipping-label util-clearfix">
					 <span class="lbl-shipping-remaining">15 -60 days </span>
					 <span class="price lbl-shipping-price">
					 <span class="value notranslate">US $9.47<br></span>
					 </span>
					 <input type="hidden" name="action" value="WholesaleShopcartAction">
					 <input type="hidden" name="event_submit_do_update_logistics_level" value="anything">
					 <input type="hidden" name="id" value="6281240901">
					 <input name="_csrf_token_" type="hidden" value="6hlqclyufpak"> 
					  <input type="radio" name="shippingid" id="shipping-select-0-YANWEN_AM" value="YANWEN_AM">Special Line-YW
					 </label>
					
					 </li>
					      <li>
					
					 <label for="shipping-select-0-DHL" class="shipping-label util-clearfix">
					 <span class="lbl-shipping-remaining">4 -8 days </span>
					 <span class="price lbl-shipping-price">
					 <span class="value notranslate">US $65.26<br></span>
					 </span>
					 <input type="hidden" name="action" value="WholesaleShopcartAction">
					 <input type="hidden" name="event_submit_do_update_logistics_level" value="anything">
					 <input type="hidden" name="id" value="6281240901">
					 <input name="_csrf_token_" type="hidden" value="6hlqclyufpak">  
					 <input type="radio" name="shippingid" id="shipping-select-0-DHL" value="DHL">DHL
					 </label>
					
					 </li>
					    <li>
					
					 <label for="shipping-select-0-UPSE" class="shipping-label util-clearfix">
					 <span class="lbl-shipping-remaining">4 -8 days </span>
					 <span class="price lbl-shipping-price">
					 <span class="value notranslate">US $70.53<br></span>
					 </span>
					 <input type="hidden" name="action" value="WholesaleShopcartAction">
					 <input type="hidden" name="event_submit_do_update_logistics_level" value="anything">
					 <input type="hidden" name="id" value="6281240901">
					 <input name="_csrf_token_" type="hidden" value="6hlqclyufpak">  
					 <input type="radio" name="shippingid" id="shipping-select-0-UPSE" value="UPSE">UPS Expedited
					 </label>
					
					 </li>
					    <li>
					
					 <label for="shipping-select-0-UPS" class="shipping-label util-clearfix">
					 <span class="lbl-shipping-remaining">4 -8 days </span>
					 <span class="price lbl-shipping-price">
					 <span class="value notranslate">US $72.63<br></span>
					 </span>
					 <input type="hidden" name="action" value="WholesaleShopcartAction">
					 <input type="hidden" name="event_submit_do_update_logistics_level" value="anything">
					 <input type="hidden" name="id" value="6281240901">
					 <input name="_csrf_token_" type="hidden" value="6hlqclyufpak">  
					 <input type="radio" name="shippingid" id="shipping-select-0-UPS" value="UPS">UPS Express Saver
					 </label>
					
					 </li>
					    <li>
					
					 <label for="shipping-select-0-FEDEX" class="shipping-label util-clearfix">
					 <span class="lbl-shipping-remaining">4 -8 days </span>
					 <span class="price lbl-shipping-price">
					 <span class="value notranslate">US $89.47<br></span>
					 </span>
					 <input type="hidden" name="action" value="WholesaleShopcartAction">
					 <input type="hidden" name="event_submit_do_update_logistics_level" value="anything">
					 <input type="hidden" name="id" value="6281240901">
					 <input name="_csrf_token_" type="hidden" value="6hlqclyufpak">  
					 <input type="radio" name="shippingid" id="shipping-select-0-FEDEX" value="FEDEX">Fedex IP
					 </label>
					
					 </li>
					    <li>
					
					 <label for="shipping-select-0-TNT" class="shipping-label util-clearfix">
					 <span class="lbl-shipping-remaining">4 -8 days </span>
					 <span class="price lbl-shipping-price">
					 <span class="value notranslate">US $94.74<br></span>
					 </span>
					 <input type="hidden" name="action" value="WholesaleShopcartAction">
					 <input type="hidden" name="event_submit_do_update_logistics_level" value="anything">
					 <input type="hidden" name="id" value="6281240901">
					 <input name="_csrf_token_" type="hidden" value="6hlqclyufpak">  
					 <input type="radio" name="shippingid" id="shipping-select-0-TNT" value="TNT">TNT
					 </label>
					
					 </li>
					    <li>
					
					 <label for="shipping-select-0-FEDEX_IE" class="shipping-label util-clearfix">
					 <span class="lbl-shipping-remaining">4 -8 days </span>
					 <span class="price lbl-shipping-price">
					 <span class="value notranslate">US $94.74<br></span>
					 </span>
					 <input type="hidden" name="action" value="WholesaleShopcartAction">
					 <input type="hidden" name="event_submit_do_update_logistics_level" value="anything">
					 <input type="hidden" name="id" value="6281240901">
					 <input name="_csrf_token_" type="hidden" value="6hlqclyufpak">  
					 <input type="radio" name="shippingid" id="shipping-select-0-FEDEX_IE" value="FEDEX_IE">Fedex IE
					 </label>
					
					 </li>
					    <li>
					
					 <label for="shipping-select-0-CPAM" class="shipping-label util-clearfix">
					 <span class="lbl-shipping-remaining">15 -50 days </span>
					 <span class="price lbl-shipping-price">
					 <span class="value notranslate">US $13.68<br></span>
					 </span>
					 <input type="hidden" name="action" value="WholesaleShopcartAction">
					 <input type="hidden" name="event_submit_do_update_logistics_level" value="anything">
					 <input type="hidden" name="id" value="6281240901">
					 <input name="_csrf_token_" type="hidden" value="6hlqclyufpak">  
					 <input type="radio" name="shippingid" id="shipping-select-0-CPAM" value="CPAM">China Post Registered Air Mail
					 </label>
					
					 </li>
					  </ul>
					 <div class="pnl-shipping-action util-clearfix">
					 <input type="hidden" name="product-id" value="product-id-001">
					
					 <input type="submit" class="btn-ok" value=""><a class="btn-cancel">Cancel</a>
					 </div>
					</form>
					 </div>
					 </div>
					 
					   <dl class="product-shipping-comment util-clearfix">
					 <dt>Delivery Time:&nbsp;</dt>
					 <dd> 12-20 days</dd>
					 </dl>
					 <dl class="product-shipping-comment util-clearfix">
					 <dt>Processing Time:&nbsp;</dt>
					 <dd>10 days</dd>
					 </dl>
					   
					  </td>
					 
					   <td class="product-operate ">
					     <div class="product-remove">
					 <form method="post" action="shopcartDetail.htm">
					 <input type="hidden" name="action" value="WholesaleShopcartAction">
					 <input type="hidden" name="event_submit_do_delete_shopcart" value="anything">
					 <input type="hidden" name="id" value="6281240901">
					<input name="_csrf_token_" type="hidden" value="6hlqclyufpak">  <a href="javascript:void(0);" class="remove-single-product">Remove</a>
					 </form>
					 </div>
					 </td>
					
					 </tr>
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
					 <span class="value notranslate">US $113.03</span>
					 <span class="product-price-title">Shipping:</span>
					<span class="value notranslate">US $131.58</span>
					 
					 </div>
					
					 <div class="product-price-info2">
					 <span class="product-price-title">Fixed Discount:</span>
					 <span class="value notranslate">-&nbsp;US $15.00</span>
					</div>
					  <div class="product-price-info2">
					 <span class="product-price-title">Total:</span>
					 <span class="product-price-total ui-cost notranslate"><b>US $229.61</b></span>
					   </div>
					
					
					<div class="product-price-info3">
						 <a class="ui-button ui-button-primary ui-button-medium product-buy-only" href="/order/confirm_order.htm?aeOrderFrom=main_shopcart&amp;sellerAdminSeq=222026140&amp;countryCode=BR&amp;availableProductShopcartIds=6277375754,6281240901," data-batman-id="i4veo1r2">Buy all from this seller</a>
						 <input type="hidden" name="oneSellerProductIDs" value="32222053570,32221438392,">
					 </div>
					 </div>
					 </td>
					 </tr>
					</tfoot>
					</table>
				</div>
				<form action="shopcart/updateShopCartQuantity.action" method="post" id="dlg-edit-quantity" style="z-index: 99; left: 566px; top: 202px; /* display: none; */">
					<div class="inner util-clearfix">
						<input type="hidden" name="productId" id="hid-product-id-quantity" value="">
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
</body>
</html>
