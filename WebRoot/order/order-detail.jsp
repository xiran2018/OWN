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
<title></title>


<!-- header以下布局 -->
<link href="common/css/secondstyle.css" rel="stylesheet" type="text/css" />

<!--商品分类侧边栏 -->
<link href="common/css/secondsider.css" rel="stylesheet" type="text/css" />

<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css" /> 

<!--去小数点等-->
<script type="text/javascript" src="js/math.js"></script>
<script type="text/javascript">
$(function() {
  });
  //订单内容
  var orderList=<s:property value="orderListString" escape="false"/>;
</script>
<!-- ------------------------------和本网页相关--------------------------------------- -->

<link href="order/css/order-detail.css" rel="stylesheet" type="text/css" />
        
		
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
			<div class="grid-c aliexpress">
			 <!-- start: 你的内容从这里开始 -->
			 <div class="position-tips"><a class="alink" href="http://us.ae.alibaba.com/">My AliExpress</a> &gt; <a class="alink" href="http://trade.aliexpress.com/orderList.htm">Order List </a> &gt; Order Detail</div>
			 <!-- 详情 -->
			 <div id="reminder-section" class="ui-box ui-box-primary ui-box-primary-system reminder-section">
					<div class="ui-box-content">
						<dl class="clearfix" id="order-num-box">
							<dt class="order-no-title"><s:text name="www.order.orderNumber"></s:text>:</dt>
							<dd class="order-no"><s:property value="orderShowVO.order.ordernumber" escape="false"/></dd>
						</dl>
						<dl class="clearfix">
							<dt><s:text name="www.order.status"></s:text>:</dt>
							<dd class="order-status">
								<s:if test="orderShowVO.order.orderstate==0">
									<s:text name="www.order.awaitPaymentNotice"></s:text>									
								</s:if>
								<s:else>
									<s:text name="www.order.alreadyPaymentNotice"></s:text>									
								</s:else>
							  
							</dd>
						</dl>
						<s:if test="orderShowVO.order.orderstate==0">
							<dl class="clearfix">
								<dt><s:text name="www.order.reminder"></s:text>:</dt>
								<dd class="order-reminder">
										<s:text name="www.order.reminderNotice"></s:text>
									<!-- 
										<span id="countdown" class="countdown" data="157373557">
					                    	<span id="remain-day">1</span>days
					                    	<span id="remain-hour">18</span>hours
					                    	<span id="remain-min">1</span>minutes
					                    	<span id="remain-sec">3</span>seconds
					                    </span>
				                     -->
				                    	                    									.								                    																</dd>
			                </dl>
			                
							<dl class="clearfix">
								<dt class="hidden">Action Respond</dt>
								<dd class="order-operate">
									<a class="ui-button ui-button-normal button_pay" id="button_pay" href="payment-control/checkout.action?orderId=<s:property value='orderShowVO.order.id' escape='false'/>">
											<s:text name="www.order.pay"></s:text>
									</a>
									<!-- 
									<button class="ui-button ui-button-normal button_cancelOrder" id="button_cancelOrder" orderid="30070814313310" type="button">
											Cancel Order
									</button>
									 -->
								</dd>
							</dl>
						</s:if>
					</div>
				</div><!-- end of reminder -->
				
				<div id="records-section" class="ui-tab ui-tab-normal records-section">
					<div style="position: relative;">
						<ul class="ui-tab-nav">
							<li class="ui-tab-active">
								<a href="javascript:void(0)" data-spm-anchor-id="0.0.0.0">
									<s:text name="www.order.order"></s:text>
								</a>
							</li>
							<li>
								<a href="javascript:void(0)" data-spm-anchor-id="0.0.0.0">
									<s:text name="www.order.financial"></s:text>
								</a>
							</li>
						</ul>
						<span style="position: absolute; right: 0; top: 0;"></span>
					</div>
					
					<div class="ui-tab-content">
						<div id="order-pnl" class="ui-tab-pane order-pnl" style="display:"> 

							<div class="user-shipping" id="user-shipping">
		                        <ul class="clearfix" id="user-shipping-list">
									<li>
										<label> <s:text name="www.user.contactName"></s:text>:</label>
										<span i18entitle="Contact Name" class="i18ncopy">
											<s:property value="orderShowVO.mailAddressVO.mailAddress.contactName" escape="false"/>
										</span>
									</li>
									<li class="long">
										<label><s:text name="www.user.country"></s:text>:</label>
										<span i18entitle="Address" class="i18ncopy">
											<s:property value="orderShowVO.mailAddressVO.shppingCountry.name" escape="false"/>
										</span>
									</li>
									<li class="long">
										<label><s:text name="www.user.city"></s:text>:</label>
										<span i18entitle="Address" class="i18ncopy">
											<s:property value="orderShowVO.mailAddressVO.mailAddress.city" escape="false"/>
										</span>
									</li>
									<li class="long">
										<label><s:text name="www.user.streetAddress"></s:text>:</label>
										<span i18entitle="Address" class="i18ncopy">
											<s:property value="orderShowVO.mailAddressVO.mailAddress.streetAddress" escape="false"/>
										</span>
									</li>
									<li class="long">
										<label><s:text name="www.user.otherStreetAddress"></s:text>:</label>
										<span class="i18ncopy">
		                            		<s:property value="orderShowVO.mailAddressVO.mailAddress.streetAddressOther" escape="false"/>
		                           		 </span>
		                            </li>
									<li>
										<label><s:text name="www.user.zipCode"></s:text>:</label>
										<span i18entitle="Zip Code" class="i18ncopy">
											<s:property value="orderShowVO.mailAddressVO.mailAddress.zipCode" escape="false"/>
										</span>
									</li>
									<li class="clear">
										<label><s:text name="www.user.mobile"></s:text>:</label>
										<span i18entitle="Mobile" class="i18ncopy ">
											<s:property value="orderShowVO.mailAddressVO.mailAddress.mobile" escape="false"/>
										</span>
									</li>
									
									<li class="clear">
										<label><s:text name="www.user.Tel"></s:text>:</label>
										<span i18entitle="Tel" class="i18ncopy">
											<s:property value="orderShowVO.mailAddressVO.mailAddress.countryNumber" escape="false"/>
											<s:property value="orderShowVO.mailAddressVO.mailAddress.areaNumber" escape="false"/>
											<s:property value="orderShowVO.mailAddressVO.mailAddress.localNumber" escape="false"/>
										</span>
									</li>
									<!-- 传真都不用写了
									<li class="clear">
										<label>Fax:</label>
										<span>
											<s:property value="orderShowVO.mailAddressVO.mailAddress.zipCode" escape="false"/>
										</span>
									</li>
									 -->
								</ul>
							</div>
							
							<table class="product-table" id="TP_ProductTable" data-spm="6">
						        <colgroup>
						        <col class="baobei">
						        <col class="price">
						        <col class="quantity">
						        <col class="amount">
						        <col class="trade-status">
						        <col class="shipping">
						        </colgroup>
						        <thead>
						          <tr class="col-name">
						            <th class="baobei"><s:text name="www.order.productDetails"></s:text></th>
						            <th class="price"><s:text name="www.order.pricePerUnit"></s:text></th>
						            <th class="quantity"><s:text name="www.order.quantity"></s:text></th>
						            <th class="amount"><s:text name="www.order.orderTotal"></s:text></th>
									<th class="trade-status">
		    									<s:text name="www.order.status"></s:text>
									</th>
						            
						            <th class="shipping">&nbsp;</th>
						   
						          </tr>
						          
						          
						        </thead>
						        
						        
						        
						        
						        
						        <tbody data-isarchive="false"  data-status="" class=" " id="listshowID">
							        <!-- 
							        <s:iterator value="orderShowVO" id='orderShowVOId' status="oderShowST">
							          		大小：<s:property value="#orderShowVOId.odsvo.size()"/>
							          	<s:iterator value="#orderShowVOId.odsvo" id='number' status="odvo">
							          	    <s:if test="#odvo.Even">
											        现在的索引是奇数为:<s:property value='#odvo.index'/>
											 </s:if>
										    <s:property value='#number.od.productname'/>
										   	 商品属性：
										    <s:iterator value="#number.odpa" id='odpa' status="odpaEle">
										    	<s:property value='#odpa.attrname'/>
											</s:iterator>
										</s:iterator>
									</s:iterator>
									 -->						
									
								 				             						  						  				         
						        </tbody>
						        
						        
						</table>
						<style>
							.product-fees td{padding-right:25px;text-align:left;}
						</style>
						<div class="product-fees" style="text-align:right;background:#f5f5f5;line-height:30px;padding:0px;padding-right:11px;overflow:hidden">
							<table style="float:right">
								<tbody>
									<tr>
										<td><s:text name="www.orderPrice.productAmount"></s:text></td>
										<td><s:text name="www.orderPrice.shippingCost"></s:text></td>
										<td><s:text name="www.orderPrice.totalAmount"></s:text></td>
																		
									</tr>
									<tr>
										<td>
											<span id="ProductAmount" class="final-price ProductAmount" style="color:#BD1A1D;"></span>
										</td>
										<td>
											<span id="ShippingCost" class="final-price ShippingCost" style="color:#BD1A1D"></span>
										</td>
										<td>
											<span id="TotalAmount" class="final-price TotalAmount" style="color:#BD1A1D"></span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
							
							
						</div>
						
						<div id="fund-pnl" name="fund-pnl" class="ui-tab-pane fund-pnl" style="display:none ;">
							<!-- 订单金额信息框 -->
							<div class="ui-box ui-box-normal ui-box-normal-system">
								<h3 class="ui-box-title">
									<s:text name="www.orderPrice.totalAmount"></s:text>
								</h3>
								<div class="ui-box-content">
									<table class="fund-table" id="tp-order-price-table">
								        <colgroup>
									        <col class="product-price">
									        <col class="shipping-price">
									        <col class="change-price">
									        <col class="discount-price">
									        <col class="order-price">
									    </colgroup>
								        <thead>
								          <tr class="col-name">
								            <th class="product-price"><s:text name="www.order.productPrice"></s:text></th>
								            <th class="shipping-price"><s:text name="www.orderPrice.shippingCost"></s:text></th>
								            <th class="change-price"><s:text name="www.orderPrice.adjustPrice"></s:text></th>
								            <th class="change-price"><s:text name="www.order.point"></s:text></th>
								            <th class="discount-price"><s:text name="www.order.discount"></s:text></th>
											<th class="order-price"><s:text name="www.orderPrice.totalAmount"></s:text></th>
								          </tr>					          
								        </thead>
		
								        <tbody class=" ">
								          
								          <tr class="fund-bd">
								            <td class="product-price ProductAmount">
								            					
								            </td>
								            <td class="shipping-price ShippingCost">
								            		
								            						            	
								            </td>
								            <td class="change-price AdjustPrice">
								            </td>
								            <td class="change-price Point">
								            </td>
		
								            <td class="discount-price">
											</td>									
								            <td class="order-price Total-Amount">
											</td>
											
								           </tr>
								       
								          
								        </tbody>       
								</table>						
								</div>
							</div>
							
							<!-- 买家支付信息 -->
							<div class="ui-box ui-box-normal ui-box-normal-system">
								<h3 class="ui-box-title">
									<s:text name="www.order.paymentReceived"></s:text>:
								</h3>
								<div class="ui-box-content">
									<table class="fund-table" id="tp-buyer-order-table">
								        <colgroup>
								        <col class="pay-c1">
								        <col class="pay-c2">
								        <col class="pay-c3">
								        						        
								        						        
								        </colgroup>
								        <thead>
								          <tr class="col-name">
								            <th class="pay-c1"><s:text name="www.order.total"></s:text></th>
								            <th class="pay-c2"><s:text name="www.order.received"></s:text></th>
								            <th class="pay-c3"><s:text name="www.order.paymentMethod"></s:text></th>
								          </tr>
							          
								        </thead>
		
								        <tbody class=" ">
								          <tr class="fund-bd">
								            <td class="pay-c1 Total-Amount">
								            </td>
								            <td class="pay-c2 Received">
								            </td>
								            <td class="pay-c3 PaymentMethod">
											</td>
								          </tr>
								    	</tbody>       
									</table>						
								</div>
							</div>
							
							<!-- start 退款信息 -->
												
						    <!-- chargeback issue -->
											
						</div>
						
						<div id="operate-pnl" class="ui-tab-pane operate-pnl" style="display: none;">
							
							<ul class="operate-list clearfix">
								<li><label>Order Date</label>: <span>2015-03-16 18:52:06 </span></li>
																						
							</ul>
						</div>
							
					</div>
				</div><!-- end of records -->
			</div><!-- end of grid -->
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
        
<script type="text/javascript" src="order/js/order-detail.js"></script>
		
<!-- ------------------------------和本网页相关--------------------------------------- -->
</body>
</html>
