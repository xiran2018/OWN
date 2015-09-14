$(document).ready(function () {
	eventRegister();//事件注册
});

function eventRegister()
{
	paymentClickEventRegister(); //点击支付方式事件注册
}

/**
 * 点击确认支付按钮时的动作
 */
function paymentClickEventRegister()
{
	//点击相应的支付方式时，出现相应的支付信息
	$(".payment").on("click","#J_authSubmit",function(){		
		payment();
	});
}

/**
 * paypal支付方式，支付方式的最后一步
 * @param totalPaymentAmount 支付的总价格，用美元表示
 * @param totalPaymentAmountByExchangeRate  通过相应的汇率转变之后的相应金额
 * @param orderId 订单的id
 * @param currencyId 货币id
 */
function payment()
{	
	var queryString="token="+paypal_token+"&PayerID="+payerId; //paypal_token and payerId is in paypal-ec-payment-confirm.jsp
	window.location.href="payment-control/do-express-checkout-payment.action?"+queryString;
}


/**
 * paypal支付方式，支付方式的第一步
 * @param totalPaymentAmount 支付的总价格，用美元表示
 * @param totalPaymentAmountByExchangeRate  通过相应的汇率转变之后的相应金额
 * @param orderId 订单的id
 * @param currencyId 货币id
 */
function paypalPayment(totalPaymentAmount,totalPaymentAmountByExchangeRate,orderId,currencyId)
{
	var queryString="totalPaymentAmount="+totalPaymentAmount+"&totalPaymentAmountByExchangeRate="+totalPaymentAmountByExchangeRate+"&orderId="+orderId+"&currencyId="+currencyId;;
	window.location.href="payment-control/set-express-checkout-paypal.action?"+queryString;
}