<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>订单详情</title>
		
 		<!-- 网页整体布局样式 ，，超链接样式-->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/product_attribute.css">
        <!-- header导航栏样式 -->
        <link rel="stylesheet" type="text/css" href="css/admin_full.css">

        
        
        <!-- 表格和字体 -->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">

        <!-- 点击之后，隐藏左右两边的导航窗口 -->
        <script src="jqladmin/js/left-right.js" type="text/javascript"></script>
        
        <!-- js和jquery相关 -->
        <script type="text/javascript" src="jqladmin/js/json2.js"></script>
        <!-- <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> -->
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
        
        
        <!-- 左边导航栏点击之后隐藏动作 -->
        <script src="jqladmin/usermanage/js/common.js" type="text/javascript"></script>
        
        <!--去小数点等-->
		<script type="text/javascript" src="js/math.js"></script>
        
        <script type="text/javascript">
		$(function() {
		  });
		  //订单内容
		  var orderList=<s:property value="orderListString" escape="false"/>;
		</script>
        <!-- ------------------------------和本网页相关--------------------------------------- -->
			<link href="jqladmin/order/css/order-detail.css" rel="stylesheet" type="text/css" />
			        
			<script type="text/javascript" src="jqladmin/order/js/order-detail.js"></script>
        <!-- ------------------------------和本网页相关--------------------------------------- -->
		
		

		<style type="text/css">
		
			.abutton{
				 
				border: 1px solid;
				padding: 3px 15px;

			}

		</style> 
        
	</head>
	<body>
		<div id="header">
		    
			 <%@ include file="../Header.jsp"%>
			 
		</div>

		

		<div id="container">
			<div id="content">
			   <div id="contentInnerWraper" style=" min-height: 100%;">
			        <div class="picBox" onclick="switchSysBar()" id="switchPoint"></div>
					<div id="show_content_div" >
				   	
						<div>
								<div class="grid-c aliexpress">
									 <!-- start: 你的内容从这里开始 -->
									 	<div class="position-tips"><a class="alink" href="http://us.ae.alibaba.com/">My AliExpress</a> &gt; <a class="alink" href="http://trade.aliexpress.com/orderList.htm">Order List </a> &gt; Order Detail</div>
									 <!-- 详情 -->
									 <div id="reminder-section" class="ui-box ui-box-primary ui-box-primary-system reminder-section">
											<div class="ui-box-content">
												<dl class="clearfix" id="order-num-box">
													<dt class="order-no-title">Order Number:</dt>
													<dd class="order-no"><s:property value="orderShowVO.order.ordernumber" escape="false"/></dd>
												</dl>
												<dl class="clearfix">
													<dt>Status:</dt>
													<dd class="order-status">
														<s:if test="orderShowVO.order.orderstate==0">This order is awaiting your payment</s:if>
														<s:else>This order has already paymented</s:else>
													  
													</dd>
												</dl>
												<s:if test="orderShowVO.order.orderstate==0">
													<dl class="clearfix">
														<dt>Reminder:</dt>
														<dd class="order-reminder">
																Without payment, the product of this order will not be shipped.
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
															<button class="ui-button ui-button-normal button_pay" id="change_pay" >
																	调整价格
															</button>
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
														<a href="javascript:void(0)" data-spm-anchor-id="0.0.0.0">Order</a>
													</li>
													<li>
														<a href="javascript:void(0)" data-spm-anchor-id="0.0.0.0">Financial</a>
													</li>
												</ul>
												<span style="position: absolute; right: 0; top: 0;"></span>
											</div>
											
											<div class="ui-tab-content">
												<div id="order-pnl" class="ui-tab-pane order-pnl" style="display:"> 

														<div class="user-shipping" id="user-shipping">
									                        <ul class="clearfix" id="user-shipping-list">
																<li>
																	<label> Contact Name :</label>
																	<span i18entitle="Contact Name" class="i18ncopy">
																		<s:property value="orderShowVO.mailAddressVO.mailAddress.contactName" escape="false"/>
																	</span>
																</li>
																<li class="long">
																	<label>Country:</label>
																	<span i18entitle="Address" class="i18ncopy">
																		<s:property value="orderShowVO.mailAddressVO.shppingCountry.name" escape="false"/>
																	</span>
																</li>
																<li class="long">
																	<label>City:</label>
																	<span i18entitle="Address" class="i18ncopy">
																		<s:property value="orderShowVO.mailAddressVO.mailAddress.city" escape="false"/>
																	</span>
																</li>
																<li class="long">
																	<label>Street Address:</label>
																	<span i18entitle="Address" class="i18ncopy">
																		<s:property value="orderShowVO.mailAddressVO.mailAddress.streetAddress" escape="false"/>
																	</span>
																</li>
																<li class="long">
																	<label>Other Street Address:</label>
																	<span class="i18ncopy">
									                            		<s:property value="orderShowVO.mailAddressVO.mailAddress.streetAddressOther" escape="false"/>
									                           		 </span>
									                            </li>
																<li>
																	<label>Zip Code:</label>
																	<span i18entitle="Zip Code" class="i18ncopy">
																		<s:property value="orderShowVO.mailAddressVO.mailAddress.zipCode" escape="false"/>
																	</span>
																</li>
																<li class="clear">
																	<label>Mobile:</label>
																	<span i18entitle="Mobile" class="i18ncopy ">
																		<s:property value="orderShowVO.mailAddressVO.mailAddress.mobile" escape="false"/>
																	</span>
																</li>
																
																<li class="clear">
																	<label>Tel:</label>
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
													            <th class="baobei">Product Details</th>
													            <th class="price">Price Per Unit</th>
													            <th class="quantity">Quantity</th>
													            <th class="amount">Order Total</th>
																<th class="trade-status">
									    									Status
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
																	<td>Product Amount</td>
																	<td>Shipping Cost</td>
																	<td>Total Amount</td>
																									
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
															Total Amount
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
														            <th class="product-price">Price</th>
														            <th class="shipping-price">Shipping Cost</th>
														            <th class="change-price">Adjust Price</th>
														            <th class="change-price">Point</th>
														            <th class="discount-price">Discount</th>
																	<th class="order-price">Total Amount</th>
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
															Payment Received:
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
														            <th class="pay-c1">Total</th>
														            <th class="pay-c2">Received</th>
														            <th class="pay-c3">Payment Method</th>
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
							
				            

				        </div>
					</div>
	<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->
					
			   </div>

			</div>
			
			
			<div id="side">					
                <center>
                    <%@ include file="common.jsp"%>
                </center>


			</div>
			
			
			<div id="rightSide">					

			</div>

		</div>
		<!-- modify price -->
		<div id="modifyw" class="main-box ui-widget" title="修改价格">
			<div class="ui-window-bd">
				<div id="price-form-tpl">
				        <input type="hidden" name="orderId" id="orderId" value="<s:property value='orderShowVO.order.id' escape='false'/>">
				    	<table class="form-table" cellpadding="0" cellspacing="0" id="adjust-price-table">
				    		<tbody>
				    			<tr>
				    				<th>调整前金额:</th>
				    				<td>
										<span id="init-amount" class="allRealTotal"></span>
									</td>
				    			</tr>
				    			<tr>
				    				<th>涨价或折扣:</th>
				    				<td>
										USD $
				    					<input onkeyup="inputChangePrice(this)" class="price-discount limit-float" id="sellerDiscount" name="sellerDiscount" type="text" value="<s:property value='orderShowVO.order.reducefee' escape='false'/>">
				    				</td>
				    			</tr>
				    			<tr>
				    				<th></th>
				    				<td><span class="tip">例如：要给买家便宜$10，则输入"-10"；要提高价格$10，则输入"+10"</span></td>
				    			</tr>
								
				    			<tr>
				    				<th>买家应付:</th>
				    				<td>
										<span class="price-payfor Total-Amount" id="price-payfor"></span>
									</td>
				    			</tr>
				    			<tr>
				    				<th>您预计可得:</th>
				    				<td>
										<span class="price-get Total-Amount" id="price-get"></span></td>
				    			</tr>
				    			<tr>
				    				<th>原因:</th>
				    				<td><textarea class="price-message" cols="40" rows="5" id="sellerDiscountText" name="sellerDiscountText"><s:property value='orderShowVO.order.reducefeereason' escape='false'/></textarea>
									</td>
				    			</tr>
				    			
				    		</tbody>
				    	</table>
				</div>
	

			</div>
			
		</div><!--end of  modify userinfo -->
	</body>
	<!-- <script type="text/javascript" src="jqladmin/js/rentclick.js"></script> -->
</html>