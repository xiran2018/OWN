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

<!--进度条布局-->
<link href="payment/css/pay.process.css" rel="stylesheet" type="text/css" />

<!--确认支付布局-->
<link href="payment/css/payment.confirm.css" rel="stylesheet" type="text/css" />

<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css" /> 

<!--去小数点等-->
<script type="text/javascript" src="js/math.js"></script>

<script type="text/javascript">

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
							<li class="first"><span class="state">Review your Order</span></li>
							<li class=""><span class="state" style="background-position: 282px -20px;">Payment</span></li>
							<li class="last current"><span class="state">Done</span></li>
						</ol>
					</div>
				</div>
				  
				<!-- tips info -->
				<div class="order-warn-tips">
					<p class="ui-notice ui-notice-normal ui-notice-prompt">
						<span class="ui-notice-body">
								Note: Payment success!
						</span>
					</p>
				</div>
				
				<!--paypal payment -->
				<div class="payment">
					<div id="J-fastpay-submit" class="ui-fm-item ui-fm-action ">
			            <input type="submit" class="ui-button ui-button-lorange" id="J_authSubmit" value="success" seed="input-confirmPay" autocomplete="off">
			            <span class="ui-fm-status fn-hide"> 正在提交中... </span>
			        </div>
				
				</div>
				
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

<!-- ------------------------------和本网页相关--------------------------------------- -->
</body>
</html>
