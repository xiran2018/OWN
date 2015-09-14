/**
 * paypal支付方式
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