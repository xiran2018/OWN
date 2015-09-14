package ru.own.www.payment.paypal.merchant;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import ru.own.www.entity.OrderShowVO;
import urn.ebay.api.PayPalAPI.DoExpressCheckoutPaymentReq;
import urn.ebay.api.PayPalAPI.DoExpressCheckoutPaymentRequestType;
import urn.ebay.api.PayPalAPI.DoExpressCheckoutPaymentResponseType;
import urn.ebay.api.PayPalAPI.PayPalAPIInterfaceServiceService;
import urn.ebay.apis.CoreComponentTypes.BasicAmountType;
import urn.ebay.apis.eBLBaseComponents.CurrencyCodeType;
import urn.ebay.apis.eBLBaseComponents.DoExpressCheckoutPaymentRequestDetailsType;
import urn.ebay.apis.eBLBaseComponents.ErrorType;
import urn.ebay.apis.eBLBaseComponents.PaymentActionCodeType;
import urn.ebay.apis.eBLBaseComponents.PaymentDetailsItemType;
import urn.ebay.apis.eBLBaseComponents.PaymentDetailsType;
import urn.ebay.apis.eBLBaseComponents.PaymentInfoType;
import urn.ebay.apis.eBLBaseComponents.SellerDetailsType;

//# DoExpressCheckout API
// The DoExpressCheckoutPayment API operation completes an Express Checkout
// transaction. If you set up a billing agreement in your SetExpressCheckout
// API call, the billing agreement is created when you call the
// DoExpressCheckoutPayment API operation.
// This sample code uses Merchant Java SDK to make API call. You can
// download the SDKs [here](https://github.com/paypal/sdk-packages/tree/gh-pages/merchant-sdk/java)
public class DoExpressCheckout {
	
	String token;//来自SetExpressCheckout的响应
	String configFilePath;
	
	OrderShowVO orderVO;//订单信息
	
	// Unique paypal buyer account identification number as returned in
	// `GetExpressCheckoutDetails` Response
	String payerID;

	public DoExpressCheckoutPaymentResponseType doExpressCheckout() {

		Logger logger = Logger.getLogger(this.getClass().toString());

		// ## DoExpressCheckoutPaymentReq
		DoExpressCheckoutPaymentReq doExpressCheckoutPaymentReq = new DoExpressCheckoutPaymentReq();

		DoExpressCheckoutPaymentRequestDetailsType doExpressCheckoutPaymentRequestDetails = new DoExpressCheckoutPaymentRequestDetailsType();

		// The timestamped token value that was returned in the
		// `SetExpressCheckout` response and passed in the
		// `GetExpressCheckoutDetails` request.
		doExpressCheckoutPaymentRequestDetails.setToken(token);

		// Unique paypal buyer account identification number as returned in
		// `GetExpressCheckoutDetails` Response
		doExpressCheckoutPaymentRequestDetails.setPayerID(payerID);

		// ### Payment Information
		// list of information about the payment
		PaymentUtil pUtil=new PaymentUtil(orderVO);
		List<PaymentDetailsType> paymentDetailsList =pUtil.getPaymentDetailsType();
		
		doExpressCheckoutPaymentRequestDetails
				.setPaymentDetails(paymentDetailsList);
		DoExpressCheckoutPaymentRequestType doExpressCheckoutPaymentRequest = new DoExpressCheckoutPaymentRequestType(
				doExpressCheckoutPaymentRequestDetails);
		doExpressCheckoutPaymentReq
				.setDoExpressCheckoutPaymentRequest(doExpressCheckoutPaymentRequest);

		// ## Creating service wrapper object
		// Creating service wrapper object to make API call and loading
		// configuration file for your credentials and endpoint
		PayPalAPIInterfaceServiceService service = null;
		try {
			service = new PayPalAPIInterfaceServiceService(configFilePath);
		} catch (IOException e) {
			logger.severe("Error Message : " + e.getMessage());
		}
		DoExpressCheckoutPaymentResponseType doExpressCheckoutPaymentResponse = null;
		try {
			// ## Making API call
			// Invoke the appropriate method corresponding to API in service
			// wrapper object
			 doExpressCheckoutPaymentResponse = service
					.doExpressCheckoutPayment(doExpressCheckoutPaymentReq);
		} catch (Exception e) {
			logger.severe("Error Message : " + e.getMessage());
		}

//		// ## Accessing response parameters
//		// You can access the response parameters using getter methods in
//		// response object as shown below
//		// ### Success values
//		if (doExpressCheckoutPaymentResponse.getAck().getValue()
//				.equalsIgnoreCase("success")) {
//
//			// Transaction identification number of the transaction that was
//			// created.
//			// This field is only returned after a successful transaction
//			// for DoExpressCheckout has occurred.
//			if (doExpressCheckoutPaymentResponse
//					.getDoExpressCheckoutPaymentResponseDetails()
//					.getPaymentInfo() != null) {
//				Iterator<PaymentInfoType> paymentInfoIterator = doExpressCheckoutPaymentResponse
//						.getDoExpressCheckoutPaymentResponseDetails()
//						.getPaymentInfo().iterator();
//				while (paymentInfoIterator.hasNext()) {
//					PaymentInfoType paymentInfo = paymentInfoIterator
//							.next();
//					logger.info("Transaction ID : "
//							+ paymentInfo.getTransactionID());
//				}
//			}
//		}
//		// ### Error Values
//		// Access error values from error list using getter methods
//		else {
//			List<ErrorType> errorList = doExpressCheckoutPaymentResponse
//					.getErrors();
//			logger.severe("API Error Message : "
//					+ errorList.get(0).getLongMessage());
//		}
		return doExpressCheckoutPaymentResponse;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getConfigFilePath() {
		return configFilePath;
	}

	public void setConfigFilePath(String configFilePath) {
		this.configFilePath = configFilePath;
	}

	public String getPayerID() {
		return payerID;
	}

	public void setPayerID(String payerID) {
		this.payerID = payerID;
	}

	public OrderShowVO getOrderVO() {
		return orderVO;
	}

	public void setOrderVO(OrderShowVO orderVO) {
		this.orderVO = orderVO;
	}
	
	
}
