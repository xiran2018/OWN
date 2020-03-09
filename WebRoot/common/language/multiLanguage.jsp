<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
        <script type="text/javascript">
        /////////////////////////////////////////通用提示/////////////////////////////////////////////////////
        	//修改成功	
        	var messageResourceModifySuccessTips='<s:text name="www.web.modifySuccessTips"></s:text>';
        	//服务器问题出错提示
            var messageResourceErrorTips  = '<s:text name="www.web.serverErrorTips"></s:text>';
            
            var messageResourceIsEmailTips='<s:text name="www.web.isEmailTips"></s:text>';
            
            var messageResourceInputEmailTips='<s:text name="www.web.inputEmailTips"></s:text>';
            
            var messageResourceNotHaveEmailTips='<s:text name="www.web.notHaveEmailTips"></s:text>';
            //邮件已发送
            var messageResourceEmailSendTips='<s:text name="www.web.emailSendTips"></s:text>';
            //连接失效
            var messageResourceLinkFailureTips='<s:text name="www.web.linkFailureTips"></s:text>';
            
            //请输入符合要求的密码
            var messageResourceCorrectPasswordTips='<s:text name="www.web.correctPasswordTips"></s:text>';
            //两次输入的密码不一致
            var mRTwicePasswordInConsistentTips='<s:text name="www.web.twicePasswordInConsistent"></s:text>';
            
            //添加成功
            var messageResourceAddSuccessTips='<s:text name="www.web.addSuccessTips"></s:text>';
            
            var messageResourceInputUserNameTips='<s:text name="www.web.addSuccessTips"></s:text>';
            var messageResourceInputPasswordTips='<s:text name="www.web.inputPasswordTips"></s:text>';
            //请检查密码
            var messageResourceCheckPasswordTips='<s:text name="www.web.checkPasswordTips"></s:text>';

         /////////////////////////////////////商品显示页面///////////////////////////////////////////////////    
        	//加入购物车提示
            var messageResourceAddToCartTips = '<s:text name="www.web.addToCartTips"></s:text>';
            
            //最小购买量
            var messageResourceMinBuyAccountTips='<s:text name="www.web.minBuyAccountTips"></s:text>';
          	//获取货运信息错误
            var messageResourceShippingErrorTips='<s:text name="www.web.shippingInfoErrorTips"></s:text>';
            
		/////////////////////////////////////购物车页面///////////////////////////////////////////////////     
          	//获取货运信息错误
          	var messageResourceNotDeliveryToCountryTips='<s:text name="www.cart.notDeliveryToCountry"></s:text>';
            var messageResourceconfirmOrderTips='<s:text name="www.cart.confirmOrderTips"></s:text>';
            var messageResourceStockTips='<s:text name="www.cart.stockTips"></s:text>';
            var messageResourcePiece='<s:text name="www.cart.piece"></s:text>';
            var messageResourceDeliveryTime='<s:text name="www.cart.deliveryTime"></s:text>';
            var messageResourceDays='<s:text name="www.cart.messageResourceDays"></s:text>';
            var messageResourceProcessingTime='<s:text name="www.cart.messageProcessingTime"></s:text>';
            var messageResourceShipUnavialable='<s:text name="www.cart.shipUnavialable"></s:text>';
            var messageResourceCartItemRemove='<s:text name="www.cart.itemRemove"></s:text>';
            
            //最小购买量提示
            var minBuyCountTips='<s:text name="www.buy.minbuycount"></s:text>';
            
            //积分提示
            var maxUseJiFenTips='<s:text name="www.web.maxUseJiFenTips"></s:text>';
            
            //整数提示
            var integerTips='<s:text name="www.web.integerTips"></s:text>';
            
            var messageResourceStockNotEnoughTips='<s:text name="www.web.stockNotEnoughTips"></s:text>';
            
            var addMailAddressTips='<s:text name="www.web.addMailAddressTips"></s:text>';
            
			/////////////////////////////////////////聊天窗口语言/////////////////////////////////////////////////////
           	var webIMSource='<s:text name="www.webIm.webIMSource"></s:text>';
           	var webIMSystemInfo='<s:text name="www.webIm.SystemInfo"></s:text>';

           	//////////////////////////////////////confirmorder.jsp
			//字数的提示
			var alphaTips = '<s:text name="www.web.alphaTips"></s:text>';

			//留言提示
			var leaveMessageTips = '<s:text name="www.web.leaveMessTips"></s:text>';

        </script>
        
	</head>
	<body>
	</body>
</html>