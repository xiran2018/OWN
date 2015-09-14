package ru.own.www.payment.paypal.merchant;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import ru.own.www.entity.OrderShowVO;
import admin.ru.own.www.util.Utility;
import urn.ebay.api.PayPalAPI.PayPalAPIInterfaceServiceService;
import urn.ebay.api.PayPalAPI.SetExpressCheckoutReq;
import urn.ebay.api.PayPalAPI.SetExpressCheckoutRequestType;
import urn.ebay.api.PayPalAPI.SetExpressCheckoutResponseType;
import urn.ebay.apis.CoreComponentTypes.BasicAmountType;
import urn.ebay.apis.eBLBaseComponents.AddressType;
import urn.ebay.apis.eBLBaseComponents.CountryCodeType;
import urn.ebay.apis.eBLBaseComponents.CurrencyCodeType;
import urn.ebay.apis.eBLBaseComponents.ErrorType;
import urn.ebay.apis.eBLBaseComponents.PaymentActionCodeType;
import urn.ebay.apis.eBLBaseComponents.PaymentDetailsItemType;
import urn.ebay.apis.eBLBaseComponents.PaymentDetailsType;
import urn.ebay.apis.eBLBaseComponents.SellerDetailsType;
import urn.ebay.apis.eBLBaseComponents.SetExpressCheckoutRequestDetailsType;

//# SetExpressCheckout API
// The SetExpressCheckout API operation initiates an Express Checkout
// transaction.
// This sample code uses Merchant Java SDK to make API call. You can
// download the SDKs [here](https://github.com/paypal/sdk-packages/tree/gh-pages/merchant-sdk/java)
public class SetExpressCheckout {
	
	String configFilePath; //配置文件信息
	
	OrderShowVO orderVO;//订单信息



	public SetExpressCheckoutResponseType setExpressCheckout() {

		Logger logger = Logger.getLogger(this.getClass().toString());

		// ## SetExpressCheckoutReq
		//请求详细信息类
		SetExpressCheckoutRequestDetailsType setExpressCheckoutRequestDetails = new SetExpressCheckoutRequestDetailsType();

		
		//		xs:string
		//		 
		//		(Optional) URL for the image you want to appear at the top left of the payment page. The image has a maximum size of 750 pixels wide by 90 pixels high. PayPal recommends that you provide an image that is stored on a secure (https) server. If you do not specify an image, the business name displays.
		//		 
		//		Character length and limitations: 127 single-byte alphanumeric characters
//		String headerImageString="http://jingquanliang.eicp.net:35617/productImage/ss/11(5).jpg";
		String headerImageString="http://159.226.40.82:55580/own/productImage/ss/11(5).jpg";
		setExpressCheckoutRequestDetails.setCppHeaderImage(headerImageString);
				
				
		//		Indicates whether or not you require the buyer's shipping address on file with PayPal be a confirmed address. For digital goods, this field is required, and you must set it to 0. It is one of the following values: 
		//		•
		//		0 – You do not require the buyer's shipping address be a confirmed address.
		//		 
		//		•
		//		1 – You require the buyer's shipping address be a confirmed address.
		//		 
		//
		//		Note Setting this field overrides the setting you specified in your Merchant Account Profile.
		//		 
		//		Character length and limitations: 1 single-byte numeric character
		setExpressCheckoutRequestDetails.setReqConfirmShipping("0");
				
		//		xs:string
		//		 
		//		(Optional) Enables the gift message widget on the PayPal pages. It is one of the following values: 
		//		•
		//		0 – Do not enable gift message widget.
		//		 
		//		•
		//		1 – Enable gift message widget.
		//此变量设为0之后，则在本函数中，不能包含两个交易（也就是paymentDetailsList不能包含两个PaymentDetailsType），否则会出现错误：Instant Update API callback is not supported for parallel payments
		//		setExpressCheckoutRequestDetails.setGiftMessageEnable("0");
		
				
		//		Determines where or not PayPal displays shipping address fields on the PayPal pages. For digital goods, this field is required, and you must set it to 1. It is one of the following values:
		//			 •
		//			0 – PayPal displays the shipping address on the PayPal pages.
		//			 
		//			•
		//			1 – PayPal does not display shipping address fields whatsoever.
		//			 
		//			•
		//			2 – If you do not pass the shipping address, PayPal obtains it from the buyer's account profile.
		setExpressCheckoutRequestDetails.setNoShipping("1");
		



		//xs:string
		// 
		//(Optional) Enables the buyer to enter a note to the merchant on the PayPal page during checkout. The note is returned in the GetExpressCheckoutDetails response and the DoExpressCheckoutPayment response. It is one of the following values:
		// •
		//0 – The buyer is unable to enter a note to the merchant.
		// 
		//•
		//1 – The buyer is able to enter a note to the merchant.
		// 
		//
		//Character length and limitations: 1 single-byte numeric character
		// 
		//This field is available since version 53.0. 
		setExpressCheckoutRequestDetails.setAllowNote("0");
		
		
		// URL to which the buyer's browser is returned after choosing to pay
		// with PayPal. For digital goods, you must add JavaScript to this page
		// to close the in-context experience.
		// `Note:
		// PayPal recommends that the value be the final review page on which
		// the buyer confirms the order and payment or billing agreement.`
		//在paypal支付页面上，客户选择通过 PayPal 付款后（点击继续按钮时）其浏览器将返回到的 URL。
		//注意： PayPal 建议该参数的值为客户确认订单和付款或者结算协议的最终查看页面。
		setExpressCheckoutRequestDetails
				.setReturnURL("http://159.226.40.82:55580/own/payment-control/get-express-checkout-details.action");

		// URL to which the buyer is returned if the buyer does not approve the
		// use of PayPal to pay you. For digital goods, you must add JavaScript
		// to this page to close the in-context experience.
		// `Note:
		// PayPal recommends that the value be the original page on which the
		// buyer chose to pay with PayPal or establish a billing agreement.
		//在paypal支付页面上，客户不批准使用 PayPal向您付款时（点击返回到商家按钮时） 将返回到的 URL。
		//注意： PayPal 建议该参数的值为客户选择通过 PayPal 付款或签订结算协议的最初页面。
		setExpressCheckoutRequestDetails
				.setCancelURL("http://159.226.40.82:55580/own/shopcart/cart.jsp");

		// ### Payment Information 支付信息
		// list of information about the payment
		PaymentUtil pUtil=new PaymentUtil(orderVO);
		List<PaymentDetailsType> paymentDetailsList =pUtil.getPaymentDetailsType();

		//赋值详细信息
		setExpressCheckoutRequestDetails.setPaymentDetails(paymentDetailsList);
		

		//请求
		SetExpressCheckoutReq setExpressCheckoutReq = new SetExpressCheckoutReq();
		
		//请求类型
		SetExpressCheckoutRequestType setExpressCheckoutRequest = new SetExpressCheckoutRequestType(
				setExpressCheckoutRequestDetails);

		setExpressCheckoutReq
				.setSetExpressCheckoutRequest(setExpressCheckoutRequest);

		// ## Creating service wrapper object
		// Creating service wrapper object to make API call and loading
		// configuration file for your credentials and endpoint
		PayPalAPIInterfaceServiceService service = null;
		try {
			
			service = new PayPalAPIInterfaceServiceService(configFilePath);
		} catch (IOException e) {
			logger.severe("Error Message : " + e.getMessage());
		}
		SetExpressCheckoutResponseType setExpressCheckoutResponse = null;
		try {
			// ## Making API call
			// Invoke the appropriate method corresponding to API in service
			// wrapper object
			setExpressCheckoutResponse = service.setExpressCheckout(setExpressCheckoutReq);
		} catch (Exception e) {
			logger.severe("Error Message : " + e.getMessage());
		}
		// ## Accessing response parameters
		// You can access the response parameters using getter methods in
		// response object as shown below
		// ### Success values
//		if (setExpressCheckoutResponse.getAck().getValue()
//				.equalsIgnoreCase("success")) {

			// ### Redirecting to PayPal for authorization
			// Once you get the "Success" response, needs to authorise the
			// transaction by making buyer to login into PayPal. For that,
			// need to construct redirect url using EC token from response.
			// For example,
			// `redirectURL="https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token="+setExpressCheckoutResponse.getToken();`

			// Express Checkout Token
//			logger.info("EC Token:" + setExpressCheckoutResponse.getToken());
//		}
		// ### Error Values
		// Access error values from error list using getter methods
//		else {
//			List<ErrorType> errorList = setExpressCheckoutResponse.getErrors();
//			logger.severe("API Error Message : "
//					+ errorList.get(0).getLongMessage());
//		}
		return setExpressCheckoutResponse;
	}
	


	public String getConfigFilePath() {
		return configFilePath;
	}

	public void setConfigFilePath(String configFilePath) {
		this.configFilePath = configFilePath;
	}

	public OrderShowVO getOrderVO() {
		return orderVO;
	}

	public void setOrderVO(OrderShowVO orderVO) {
		this.orderVO = orderVO;
	}
	
}
