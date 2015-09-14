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
public class CopyOfSetExpressCheckout {
	
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
		String headerImageString="http://jingquanliang.eicp.net:35617/productImage/ss/11(5).jpg";
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
				.setReturnURL("http://jingquanliang.eicp.net:35617/payment-control/get-express-checkout-details.action");

		// URL to which the buyer is returned if the buyer does not approve the
		// use of PayPal to pay you. For digital goods, you must add JavaScript
		// to this page to close the in-context experience.
		// `Note:
		// PayPal recommends that the value be the original page on which the
		// buyer chose to pay with PayPal or establish a billing agreement.
		//在paypal支付页面上，客户不批准使用 PayPal向您付款时（点击返回到商家按钮时） 将返回到的 URL。
		//注意： PayPal 建议该参数的值为客户选择通过 PayPal 付款或签订结算协议的最初页面。
		setExpressCheckoutRequestDetails
				.setCancelURL("http://jingquanliang.eicp.net:35617/shopcart/cart.jsp");

		// ### Payment Information 支付信息
		// list of information about the payment
		List<PaymentDetailsType> paymentDetailsList = new ArrayList<PaymentDetailsType>();

		
		// information about the first payment
		PaymentDetailsType paymentDetails1 = new PaymentDetailsType();
		
		paymentDetails1.setOrderDescription("jql OrderDescription");  //add by jql
		
		paymentDetails1.setNoteText("jql noteText");   //add by jql
		

		
		//此次transcation的总价格  orderTotal = 代表所有商品价格的总和 + 邮费 + 税费 + 其他
		// Total cost of the transaction to the buyer. If shipping cost and tax
		// charges are known, include them in this value. If not, this value
		// should be the current sub-total of the order.
		//
		// If the transaction includes one or more one-time purchases, this
		// field must be equal to
		// the sum of the purchases. Set this field to 0 if the transaction does
		// not include a one-time purchase such as when you set up a billing
		// agreement for a recurring payment that is not immediately charged.
		// When the field is set to 0, purchase-specific fields are ignored.
		// 
		// * `Currency Code` - You must set the currencyID attribute to one of
		// the
		// 3-character currency codes for any of the supported PayPal
		// currencies.
		// * `Amount`
		BasicAmountType orderTotal1 = new BasicAmountType(CurrencyCodeType.USD,
				"60.00");
		paymentDetails1.setOrderTotal(orderTotal1);
		
		
		
		//加载商品信息
		List<PaymentDetailsItemType> paymentDetailsItemTypesList=new ArrayList<PaymentDetailsItemType>();
		
		
		PaymentDetailsItemType paymentDetailsItemType=new PaymentDetailsItemType();
		PaymentDetailsItemType paymentDetailsItemType2=new PaymentDetailsItemType();
		//名称
		paymentDetailsItemType.setName("Women's Casual Long Sleeve Hooded Bodycon Dress");
		paymentDetailsItemType2.setName("Women's Casual Long Sleeve Hooded Bodycon Dress");
		//商品描述(包含属性信息等）
		paymentDetailsItemType.setDescription("setDescription");
		
		////商品单价
		BasicAmountType amount = new BasicAmountType(CurrencyCodeType.USD,
		"10.00");
		paymentDetailsItemType.setAmount(amount);
		paymentDetailsItemType2.setAmount(amount);
		
		//商品数量
		paymentDetailsItemType.setQuantity(2);
		paymentDetailsItemType2.setQuantity(2);
		
		//地址
		paymentDetailsItemType.setItemURL("http://jingquanliang.eicp.net:35617/productImage/ss/11(5).jpg");
		
		paymentDetailsItemTypesList.add(paymentDetailsItemType);
		paymentDetailsItemTypesList.add(paymentDetailsItemType2);
		
		paymentDetails1.setPaymentDetailsItem(paymentDetailsItemTypesList);
		
		//shipping info 运费  add by jql
		BasicAmountType shippingTotal = new BasicAmountType(CurrencyCodeType.USD,
				"20.00");
		paymentDetails1.setShippingTotal(shippingTotal);
		
		//tax  add by jql
		BasicAmountType taxTotal = new BasicAmountType(CurrencyCodeType.USD,
				"0.00");
		paymentDetails1.setTaxTotal(taxTotal);
		
		//代表所有商品价格的总和  = orderTotal-邮费-税费-其他
		BasicAmountType itemTotal = new BasicAmountType(CurrencyCodeType.USD,
				"40.00");
		paymentDetails1.setItemTotal(itemTotal);

		// How you want to obtain payment. When implementing parallel payments,
		// this field is required and must be set to `Order`. When implementing
		// digital goods, this field is required and must be set to `Sale`. If
		// the
		// transaction does not include a one-time purchase, this field is
		// ignored. It is one of the following values:
		// 
		// * `Sale` - This is a final sale for which you are requesting payment
		// (default).
		// * `Authorization` - This payment is a basic authorization subject to
		// settlement with PayPal Authorization and Capture.
		// * `Order` - This payment is an order authorization subject to
		// settlement with PayPal Authorization and Capture.
		// `Note:
		// You cannot set this field to Sale in SetExpressCheckout request and
		// then change the value to Authorization or Order in the
		// DoExpressCheckoutPayment request. If you set the field to
		// Authorization or Order in SetExpressCheckout, you may set the field
		// to Sale.`
		paymentDetails1.setPaymentAction(PaymentActionCodeType.SALE);

		// Unique identifier for the merchant. For parallel payments, this field
		// is required and must contain the Payer Id or the email address of the
		// merchant.
		SellerDetailsType sellerDetails1 = new SellerDetailsType();
		sellerDetails1.setPayPalAccountID("719712166@qq.com");
		paymentDetails1.setSellerDetails(sellerDetails1);

		// A unique identifier of the specific payment request, which is
		// required for parallel payments.
		paymentDetails1.setPaymentRequestID("PaymentRequest1");

		// `Address` to which the order is shipped, which takes mandatory
		// params:
		// 
		// * `Street Name`
		// * `City`
		// * `State`
		// * `Country`
		// * `Postal Code`
		AddressType shipToAddress1 = new AddressType();
		shipToAddress1.setStreet1("Ape Way");
		shipToAddress1.setCityName("Austin");
		shipToAddress1.setStateOrProvince("TX");
		shipToAddress1.setCountry(CountryCodeType.US);
		shipToAddress1.setPostalCode("78750");

		// Your URL for receiving Instant Payment Notification (IPN) about this
		// transaction. If you do not specify this value in the request, the
		// notification URL from your Merchant Profile is used, if one exists.
		//IPN回调地址
		paymentDetails1.setNotifyURL("http://localhost/ipn");

		paymentDetails1.setShipToAddress(shipToAddress1);

		//||||||||||||||||||||||||||||||||||||||||第二件商品信息||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		// information about the second payment
		PaymentDetailsType paymentDetails2 = new PaymentDetailsType();
		// Total cost of the transaction to the buyer. If shipping cost and tax
		// charges are known, include them in this value. If not, this value
		// should be the current sub-total of the order.
		//
		// If the transaction includes one or more one-time purchases, this
		// field must be equal to
		// the sum of the purchases. Set this field to 0 if the transaction does
		// not include a one-time purchase such as when you set up a billing
		// agreement for a recurring payment that is not immediately charged.
		// When the field is set to 0, purchase-specific fields are ignored.
		// 
		// * `Currency Code` - You must set the currencyID attribute to one of
		// the
		// 3-character currency codes for any of the supported PayPal
		// currencies.
		// * `Amount`
		BasicAmountType orderTotal2 = new BasicAmountType(CurrencyCodeType.USD,
				"4.00");
		paymentDetails2.setOrderTotal(orderTotal2);

		// How you want to obtain payment. When implementing parallel payments,
		// this field is required and must be set to `Order`. When implementing
		// digital goods, this field is required and must be set to `Sale`. If
		// the
		// transaction does not include a one-time purchase, this field is
		// ignored. It is one of the following values:
		// 
		// * `Sale` - This is a final sale for which you are requesting payment
		// (default).
		// * `Authorization` - This payment is a basic authorization subject to
		// settlement with PayPal Authorization and Capture.
		// * `Order` - This payment is an order authorization subject to
		// settlement with PayPal Authorization and Capture.
		// `Note:
		// You cannot set this field to Sale in SetExpressCheckout request and
		// then change the value to Authorization or Order in the
		// DoExpressCheckoutPayment request. If you set the field to
		// Authorization or Order in SetExpressCheckout, you may set the field
		// to Sale.`
		paymentDetails2.setPaymentAction(PaymentActionCodeType.SALE);

		// Unique identifier for the merchant. For parallel payments, this field
		// is required and must contain the Payer Id or the email address of the
		// merchant.
		SellerDetailsType sellerDetails2 = new SellerDetailsType();
		sellerDetails2.setPayPalAccountID("719712166@qq.com");
		paymentDetails2.setSellerDetails(sellerDetails2);

		// A unique identifier of the specific payment request, which is
		// required for parallel payments.
		paymentDetails2.setPaymentRequestID("PaymentRequest2");

		// `Address` to which the order is shipped, which takes mandatory
		// params:
		// 
		// * `Street Name`
		// * `City`
		// * `State`
		// * `Country`
		// * `Postal Code`
		AddressType shipToAddress2 = new AddressType();
		shipToAddress2.setStreet1("Ape Way222");
		shipToAddress2.setCityName("Austin22");
		shipToAddress2.setStateOrProvince("TX22");
		shipToAddress2.setCountry(CountryCodeType.US);
		shipToAddress2.setPostalCode("78750222");

		// Your URL for receiving Instant Payment Notification (IPN) about this
		// transaction. If you do not specify this value in the request, the
		// notification URL from your Merchant Profile is used, if one exists.
		paymentDetails2.setNotifyURL("http://localhost/ipn");

		paymentDetails2.setShipToAddress(shipToAddress2);

		paymentDetailsList.add(paymentDetails1);
		paymentDetailsList.add(paymentDetails2);

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
