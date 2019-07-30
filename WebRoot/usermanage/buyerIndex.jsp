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

<script type="text/javascript">
</script>

<!-- ------------------------------和本网页相关--------------------------------------- -->

<link href="usermanage/css/buyerIndex.css" rel="stylesheet" type="text/css" />
        
<script type="text/javascript" src="usermanage/js/user.info.js"></script>
		
<!-- ------------------------------和本网页相关--------------------------------------- -->

</head>

<body>

	<div id="header" style="background-color: #FFF;">
        <%@ include file="../common/header/headermenu.jsp" %>
        <%@ include file="../common/header/buyerIndexCommon.jsp" %>

	</div>


	<!--！！！！！！！！！！！！！！！！！！！ 之下的代码是你需要真正使用的，需要到时候用js（切记：因为js的用户体验非常好）生成！！！！！！！！！！！！！！！！！！-->
	<div id="second-category-menu">

		<div id="lagout-three">

			<div class="lagout-three-r">
				<div class="main-wrap">
					
					<div class="grid-col-container"><!-- user info -->
						<div class="me-ui-box">
							<div class="me-info-block">
								<div class="me-custom-photo">
									<a href="/wsuser/manage/account_settings.htm">
										<img src="http://img.alibaba.com/wimg/bison/single/default_header_pic.jpg">
										<div class="mask" style="display: none;">
											<img src="http://gtms01.alicdn.com/tps/i1/TB1us8NHpXXXXbkXFXXcy0wIpXX-70-70.png">
										</div>
									</a>
								</div>
								<div class="me-custom-level">
									<div class="personal-name">
										<span>
											<a href="client-center/userinfo.action"><s:property value="uinfo.username" /></a>
										</span>
									</div>
									<div class="personal-feedback">
										<a href="http://feedback.aliexpress.com/display/detail.htm?ownerMemberId=191553310&amp;companyId=182413540&amp;memberType=buyer">
											<label>Feedback Score:</label>
											<span> 0 </span>								
										</a>
									</div>
									<div class="personal-messages">
										<a href="http://message.aliexpress.com/message/messagecenter_list.htm">
											<img src="http://gtms04.alicdn.com/tps/i4/TB15a4NHpXXXXX8XVXXxPfUFXXX-16-16.gif" align="absmiddle">
											<span>Unread Messages:  
											  <em>0</em> 										
											 </span>
										</a>
									</div>
								</div>
								<div class="personal-other">
									<div class="coupouns">
										<a href="http://my.aliexpress.com/coupon/buyerCouponList.htm">My Coupons
											(<span>0</span>)
										</a>
									</div>
								</div>
							</div>
						</div>	
						<div class="me-info-details">
							<ul>
								<li>
									<a href="order/showAllOrders.action">
										<span class="v"><s:property value="orderCount" /></span>
										<span class="d"><s:text name="www.user.allOrder"></s:text></span>
									</a>
								</li>
								<li>
									<span class="v zero">0</span>
									<span class="d"><s:text name="www.order.awaitingPayment"></s:text></span>
								</li>
								<li>
									<span class="v zero">0</span>
									<span class="d"><s:text name="www.order.awaitingShipment"></s:text></span>
								</li>
								<li>
									<span class="v zero">0</span>
									<span class="d"><s:text name="www.order.awaitingConfirmation"></s:text></span>
								</li>
								<li>
										<span class="v zero" id="awaitingfeedback">0</span>
										<span class="d"><s:text name="www.order.awaitingFeedback"></s:text></span>
								</li>
								<li class="last">
									<span class="v zero">0</span>
									<span class="d"><s:text name="www.order.disputes"></s:text></span>
								</li>
							</ul>
						</div>
					</div><!--  end of user info -->
					
				</div><!-- end of main wrap -->
			</div><!-- end of lagout-three-r -->

			
			<div class="lagout-three-l">
				<!-- shorcuts -->
				<div class="grid-col-container">
					<div class="me-left-menu">
						<h3 class="me-menu-header"><s:text name="www.web.shortcuts"></s:text></h3>
						<div class="me-menu-body">
							<p class="me-menu-title"><a href="order/showAllOrders.action"><s:text name="www.user.order"></s:text></a>
							</p><p class="me-menu-title"><a href="javascript:void(0)"><s:text name="www.user.feedback"></s:text></a></p>
							<p class="me-menu-title"><a href="javascript:void(0)"><s:text name="www.user.coupons"></s:text></a></p>
							<p class="me-menu-title"><a href="client-center/userPoints.action"><s:text name="www.user.point"></s:text></a></p>
							<p class="me-menu-title"><a href="client-center/shippingAddressShow.action"><s:text name="www.user.shippingAddress"></s:text></a></p>
							<p class="me-menu-title"><a href="client-center/changePasswordSecurity.action"><s:text name="www.user.changePassword"></s:text></a></p>
						</div>
					</div>
				</div><!-- end of shortcuts -->
				<!-- mobile app -->
				<div class="grid-col-container">
					<div class="me-ui-box mobile-app" style=" display: none; ">
						<div class="edu-weixin">
							<span class="t">AliExpress Mobile App</span>
							<span class="g">Shop anywhere, anytime!</span>
																	<a href="http://activities.aliexpress.com/appdownload.php?pagearea=listleft" target="_blank">
								<img src="http://gtms02.alicdn.com/tps/i2/TB13qczHXXXXXbwXFXXoNIt4VXX-120-120.gif" alt="速卖通买家手机客户端" border="0">
								<span>Scan or click to download</span>
							</a>
						</div>
					</div>
				</div><!--end of mobile app -->
			</div><!-- end of lagout-three-l -->
		</div><!-- end of lagout-three -->
	</div>


	<div style="clear:both"></div>
<!-- ----------------------------------------------------------------------------------- -->
            <div id="footer">
                 <%@ include file="../common/header/footer.jsp" %>
             
            </div>
<!-- ----------------------------------------------------------------------------------- -->
</body>
</html>
