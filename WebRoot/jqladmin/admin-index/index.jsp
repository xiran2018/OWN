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
        <!-- 日历控件 -->
		<link href="order/css/canlander.css" rel="stylesheet" type="text/css" />
		
		<!-- 日历控件 -->
		<link href="jqladmin/order/css/pagination.css" rel="stylesheet" type="text/css" />
        

        
        
        <!--去小数点等-->
		<script type="text/javascript" src="js/math.js"></script>
		
		<!-- ------------------------------和本网页相关--------------------------------------- -->
		<link href="jqladmin/admin-index/css/index.css" rel="stylesheet" type="text/css" />
		<!-- ------------------------------和本网页相关--------------------------------------- -->
        

		
		<script type="text/javascript">
		$(function() {
		    $( "#gmtBeginDate" ).datepicker({
		        showOn: "button",
		        buttonImage: "images/calendar.gif",
		        buttonImageOnly: true,
		        buttonText: "Select date"
		    });
		    
		    $( "#gmtEndDate" ).datepicker({
		        showOn: "button",
		        buttonImage: "images/calendar.gif",
		        buttonImageOnly: true,
		        buttonText: "Select date"
		    });
		  });
		  //订单内容
//		  var orderList=<s:property value="orderListString" escape="false"/>;

		  
		</script>
		
		

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
			        <div class="picBox" onclick="switchSysBar()" id="switchPoint" style="background-image: url(../images/right.gif);"></div>
					<div id="show_content_div" >
				   	
						<div>
							<div  class="main-wrap" >
								<div class="caption clearfix">
									<h2>My Orders</h2>	
								</div>
								
								<div id="remide-box" class="remide-box clearfix">
			                		<ul> 
			                                                                        
					                    <li><a class="remind-tips" id="remiandTips_waitBuyerPayment" data="waitBuyerPayment" value="1" href="javascript:;">Awaiting Payment (<span class="num"><s:property value="awaitingPaymentCount"/></span>)</a></li>
					                                      <!-- <li><a href="#">待确认收货<span class="num">(20)</span></a></li>
					                    <li><a href="#">待评价<span class="num">(18)</span></a></li>-->
					                                                                        
					                    <li><a class="remind-tips" id="remiandTips_notReadMsg" data="notReadMsg" value="0" href="javascript:;">Unread Order Messages (<span id="not-read-msg" class="num">0</span>)</a></li>
					                                      <!-- <li><a href="#">待确认收货<span class="num">(20)</span></a></li>
					                    <li><a href="#">待评价<span class="num">(18)</span></a></li>-->
					                                                                        
					                    <li><a class="remind-tips" id="remiandTips_waitBuyerAcceptGoods" data="waitBuyerAcceptGoods" value="0" href="javascript:;">Goods Awaiting Acceptance (<span class="num">0</span>)</a></li>
					                                      <!-- <li><a href="#">待确认收货<span class="num">(20)</span></a></li>
					                    <li><a href="#">待评价<span class="num">(18)</span></a></li>-->
					                                                                        
					                    <li><a class="remind-tips" id="remiandTips_issueOrders" data="issueOrders" value="0" href="javascript:;">Dispute Order (<span class="num">0</span>)</a></li>
					                                      <!-- <li><a href="#">待确认收货<span class="num">(20)</span></a></li>
					                    <li><a href="#">待评价<span class="num">(18)</span></a></li>-->
			                          </ul>
			    				</div>
			    				
			    				<div class="order-list-search">
								        <div id="simple-search">
											<span class="search-option">
												<label>Product Name： 
												</label>
												<input value='<s:property value="productName" escape="false"/>' id="productName" maxlength="128" name="productName">
										     </span>
											<span class="search-option">
												<label>Order Number：
												</label>
											
												<input value='<s:property value="orderNo" escape="false"/>' id="orderNo" maxlength="20" name="orderNo">
							                 </span>
										   	 <span class="search-option">
												<label>Status：</label>
												<select id="orderStatus" name="orderStatus">&nbsp;
						                                <option selected="" value="">All Orders</option>
											            <option value="0">  Awaiting Payment </option>
											            <option value="1">  Order Completed </option>
											            <!--  暂时不需要展示
											            <option value="IN_CANCEL">  Awaiting Cancellation </option>
											            <option value="WAIT_SELLER_SEND_GOODS">  Awaiting Shipment </option>
											            <option value="SELLER_PART_SEND_GOODS">  Partial Shipment </option>
											            <option value="WAIT_BUYER_ACCEPT_GOODS">  Goods Awaiting Acceptance </option>
											            <option value="WAIT_GROUP_SUCCESS">  pending operation success </option>
											            <option value="IN_ISSUE">  Dispute Orders </option>
											            <option value="IN_FROZEN">  Frozen Orders </option>
											            <option value="WAIT_SELLER_EXAMINE_MONEY">  Unconfirmed Payment </option>
											            <option value="RISK_CONTROL">  Your Payment is Being Verified </option>
											            -->
						                          </select>
											       <script type="text/javascript">
														$(function() {
														     var orderStatus=<s:property value="orderStatus" escape="false" default='-1'/>;
														  
															 if(orderStatus!=-1)
															 {
																 $('#orderStatus').prop('value',orderStatus);
															 }
														});
													
													
												   </script>
							               </span>
							               <span class="search-option">
												<label>Buyer Name：
												</label>
											
												<input value='<s:property value='buyerName' escape='false'/>' id="buyerName"  name="buyerName">
							                </span>
								        </div>
								        <div style="display: block; " id="advanced-search">
								        		<!-- 暂时不需要 
									             	<label>Supplier Name：</label>
													<input value="" id="buyer-name" maxlength="128" name="_fm.o._0.co">
									               
													<label>Tracking Number：</label>
													<input value="" id="shipping-no" maxlength="35" name="_fm.o._0.l">
							                    -->
						                    	
												<label>Order Date：    </label>
							                    <div class="calendarItem" today="">
													 <input size="10" id="gmtBeginDate" name="gmtBeginDate" value='<s:property value="gmtBeginDate" escape="false"/>' class="sourceData" type="text">
							                    </div>
							                         <span>-</span>
							                    <div class="calendarItem" today="">
													<input size="10" id="gmtEndDate" name="gmtEndDate" value='<s:property value="gmtEndDate" escape="false"/>' class="sourceData" type="text">
							                    </div>
							                    <button id="search-btn" class="ui-button ui-button-primary search-btn" type="submit">Search</button>
									                    
								        </div>
								</div><!-- end of search -->
								
								<table data-spm="7" id="TP_BoughtTable" class="bought-table">
									<colgroup>
							            <col class="selector">
							            <col class="baobei">
							            <col class="price">
							            <col class="quantity">
							            <col class="after-service">
							            <col class="trade-status">
							            <col class="operate">
							        </colgroup>
							        <thead>
							           <tr class="toolbar skin-gray">
							                <td colspan="5">											                        
							                </td>
											<td colspan="2" class="last-col">
							                    <div class="ui-pager util-right">
				
							                    </div>
							
							                </td>
										</tr>
							            <tr class="col-name">
							                <th></th>
							                <th class="baobei">Product / Sales Person</th>
							                <th class="price">Price</th>
							                <th class="quantity">Quantity</th>
							                <th class="after-service">Supplier </th>
							
							                <th class="trade-status">Status</th>
							                <th class="remark">Action</th>
							
							            </tr>
							        </thead><!-- end of thead -->
							        
							        <tbody  id="listshowID"  class="ae-order" data-isarchive="false">

			                                      
			            			</tbody>
								</table>
								<div class="digg" id="diggId">  </div>  <!-- 显示分页按钮时需要的div -->
			    				
							</div><!-- end of main wrap -->
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
		<!-- ------------------------------和本网页相关--------------------------------------- -->
			
			        
			<script type="text/javascript" src="jqladmin/admin-index/js/index.js"></script>
        <!-- ------------------------------和本网页相关--------------------------------------- -->
	</body>
	<!-- <script type="text/javascript" src="jqladmin/js/rentclick.js"></script> -->
</html>