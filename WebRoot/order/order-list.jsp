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

<!--去小数点等-->
<script type="text/javascript" src="js/math.js"></script>




<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css" />

<!-- 日历控件 -->
<link href="order/css/canlander.css" rel="stylesheet" type="text/css" />

<!-- 分页控件 -->
<link href="order/css/pagination.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(function() {
    $( "#gmtBeginDate" ).datepicker({
        showOn: "button",
        //dateFormat:"yy-mm-dd",
        buttonImage: "images/calendar.gif",
        buttonImageOnly: true,
        changeMonth: true,
        changeYear: true,
        buttonText: "Select date"

    });
    
    $( "#gmtEndDate" ).datepicker({
        showOn: "button",
        //dateFormat:"yy-mm-dd",
        buttonImage: "images/calendar.gif",
        buttonImageOnly: true,
        changeMonth: true,
        changeYear: true,
        buttonText: "Select date"
    });
  });
  //订单内容
  var orderList=<s:property value="orderListString" escape="false"/>;
  //订单的总页数
  var totalNumber=<s:property value="totalNumberPage" escape="false"/>;
  
  var productName="<s:property value='productName' escape='false' />";
  var orderNo="<s:property value='orderNo' escape='false'/>";
  var orderStatus="<s:property value='orderStatus' escape='false'/>";
  var gmtBeginDate="<s:property value='gmtBeginDate' escape='false'/>";
  var gmtEndDate="<s:property value='gmtEndDate' escape='false'/>";
  
  //错误信息
  var errCode=<s:property value="errCode" escape="false"/>;
</script>

<style type="text/css">

</style>

<!-- ------------------------------和本网页相关--------------------------------------- -->
<link href="order/css/order-list.css" rel="stylesheet" type="text/css" />
		
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

			<div class="lagout-three-r">
				<div  class="main-wrap" >
					<div class="caption clearfix">
						<h2><s:text name="www.user.order"></s:text></h2>	
					</div>
					
					<div id="remide-box" class="remide-box clearfix">
                		<ul> 
                                                                        
		                    <li>
		                    	<a class="remind-tips" id="remiandTips_waitBuyerPayment" data="waitBuyerPayment" value="1" href="javascript:;">
		                    		<s:text name="www.order.awaitingPayment"></s:text>(<span class="num"><s:property value="awaitingPaymentCount"/></span>)
		                    	</a>
		                    </li>
		                    <!-- <li><a href="#">待确认收货<span class="num">(20)</span></a></li>
		                    <li><a href="#">待评价<span class="num">(18)</span></a></li>-->
		                                                                        
		                    <li>
		                    	<a class="remind-tips" id="remiandTips_notReadMsg" data="notReadMsg" value="0" href="javascript:;">
		                    		<s:text name="www.order.unreadOrderMessages"></s:text> (<span id="not-read-msg" class="num">0</span>)
		                    	</a>
		                    </li>
		                     <!-- <li><a href="#">待确认收货<span class="num">(20)</span></a></li>
		                    <li><a href="#">待评价<span class="num">(18)</span></a></li>-->
		                                                                        
		                    <li>
			                    <a class="remind-tips" id="remiandTips_waitBuyerAcceptGoods" data="waitBuyerAcceptGoods" value="0" href="javascript:;">
			                    	<s:text name="www.order.awaitingAcceptance"></s:text>(<span class="num">0</span>)
			                    </a>
		                    </li>
		                    <!-- <li><a href="#">待确认收货<span class="num">(20)</span></a></li>
		                    <li><a href="#">待评价<span class="num">(18)</span></a></li>-->
		                                                                        
		                    <li>
		                    	<a class="remind-tips" id="remiandTips_issueOrders" data="issueOrders" value="0" href="javascript:;">
		                    		<s:text name="www.order.disputeOrder"></s:text> (<span class="num">0</span>)
		                    	</a>
		                    </li>
		                     <!-- <li><a href="#">待确认收货<span class="num">(20)</span></a></li>
		                    <li><a href="#">待评价<span class="num">(18)</span></a></li>-->
                          </ul>
    				</div>
    				
    				<div class="order-list-search">
					        <div id="simple-search">
									<span class="search-option">
										<label><s:text name="www.order.productName"></s:text>： 
										</label>
										<input value='<s:property value="productName" escape="false"/>' id="productName" maxlength="128" name="productName">
								     </span>
									<span class="search-option">
										<label><s:text name="www.order.orderNumber"></s:text>：
										</label>
									
										<input value='<s:property value="orderNo" escape="false"/>' id="orderNo" maxlength="20" name="orderNo">
					                 </span>
								   <span class="search-option">
										<label><s:text name="www.order.status"></s:text>：</label>
										<select id="orderStatus" name="orderStatus">&nbsp;
				                                <option selected="" value=""><s:text name="www.user.allOrder"></s:text></option>
									            <option value="0"><s:text name="www.order.awaitingPayment"></s:text></option>
									            <option value="1"><s:text name="www.order.orderCompleted"></s:text></option>
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
					        </div>
					        <div style="display: block; " id="advanced-search">
					        	<!-- 暂时不需要 
					             	<label>Supplier Name：</label>
									<input value="" id="buyer-name" maxlength="128" name="_fm.o._0.co">
					               
									<label>Tracking Number：</label>
									<input value="" id="shipping-no" maxlength="35" name="_fm.o._0.l">
			                    -->
								<label><s:text name="www.order.orderDate"></s:text>：    </label>
			                    <div class="calendarItem" today="">
									 <input size="10" id="gmtBeginDate" name="gmtBeginDate" value='<s:property value="gmtBeginDate" escape="false"/>' class="sourceData" type="text">
			                    </div>
			                         <span>-</span>
			                    <div class="calendarItem" today="">
									<input size="10" id="gmtEndDate" name="gmtEndDate" value='<s:property value="gmtEndDate" escape="false"/>' class="sourceData" type="text">
			                    </div>
			                    <button id="search-btn" class="ui-button ui-button-primary search-btn" type="submit">
			                    	<s:text name="www.order.orderSearch"></s:text>
			                    </button>
					                    
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
				                
				                <th class="baobei" colspan="2"><s:text name="www.order.product"></s:text></th>
				                <th class="price"><s:text name="www.order.price"></s:text></th>
				                <th class="quantity"><s:text name="www.order.quantity"></s:text></th>
				                <th class="trade-status"><s:text name="www.order.status"></s:text></th>
				                <th class="after-service"><s:text name="www.order.detail"></s:text></th>
				                <th class="remark"><s:text name="www.order.action"></s:text></th>
				
				            </tr>
				        </thead><!-- end of thead -->
				        
				        <tbody id="listshowID" class="ae-order" data-status="WAIT_BUYER_CONFIRM_GOODS" data-orderid="30066712523310" data-isarchive="false">

                                      
            			</tbody>
					</table>
    				<div class="digg" id="diggId">  </div>  <!-- 显示分页按钮时需要的div -->
				</div><!-- end of main wrap -->
			</div>

			<div class="lagout-three-l">
				<%@ include file="common.jsp"%>
				<%@ include file="../usermanage/account-settings-common.jsp" %>
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
        
<script type="text/javascript" src="order/js/order-list.js"></script>
		
<!-- ------------------------------和本网页相关--------------------------------------- -->
</body>
</html>
