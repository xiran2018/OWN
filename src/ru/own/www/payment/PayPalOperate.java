package ru.own.www.payment;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import ru.own.www.entity.OrderShowVO;
import ru.own.www.entity.shopCartShowVO;
import ru.own.www.payment.paypal.merchant.DoExpressCheckout;
import ru.own.www.payment.paypal.merchant.GetExpressCheckout;
import ru.own.www.payment.paypal.merchant.SetExpressCheckout;
import systemlog.Log;
import urn.ebay.api.PayPalAPI.DoExpressCheckoutPaymentResponseType;
import urn.ebay.api.PayPalAPI.GetExpressCheckoutDetailsResponseType;
import urn.ebay.api.PayPalAPI.SetExpressCheckoutResponseType;
import urn.ebay.apis.eBLBaseComponents.ErrorType;
import urn.ebay.apis.eBLBaseComponents.PaymentInfoType;
import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.ActionSupport;

public class PayPalOperate  extends ActionSupport implements SessionAware
{
	private Map session;
	private String redirctURLString="";
	//add by jql
	String rootPath=Utility.getRootPath();
	String configFilePath=rootPath+"/WEB-INF/classes"+"/configfile/paypal/sdk_config.properties";
	
	//add by jql
	String token;
	String PayerID;
	
	//从前台传过来的支付相关变量
	private int orderId; //订单主键
	private float totalPaymentAmount;  //美元表示的总金额
	private float totalPaymentAmountByExchangeRate; //按照相应的货币结算时的总金额
	private int currencyId; //所选择的货币id

	
	/**
	 * 快速支付的第一步 
	 * @return
	 */
	public String setExpressCheckout() 
	{
		if(orderId<0) 
		{
			return ERROR;//此订单不存在
		}
		else 
		{
			session.put("paymentOrderId", orderId);//把要支付的相应订单，加入session，类型是int
			OrderShowVO vo=new OrderShowVO();
			OrderShowVO orderVO=vo.getOrderShowVOByOrderId(orderId);
		
			SetExpressCheckout sec=new SetExpressCheckout();
			sec.setOrderVO(orderVO);
			sec.setConfigFilePath(configFilePath);
			SetExpressCheckoutResponseType setExpressCheckoutResponse=sec.setExpressCheckout();
			if (setExpressCheckoutResponse.getAck().getValue().equalsIgnoreCase("success")) 
			{
				// ### Redirecting to PayPal for authorization
				// Once you get the "Success" response, needs to authorise the
				// transaction by making buyer to login into PayPal. For that,
				// need to construct redirect url using EC token from response.
				// For example,
				// `redirectURL="https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token="+setExpressCheckoutResponse.getToken();`
	
				// Express Checkout Token
				session.put("paypal-token", setExpressCheckoutResponse.getToken());
				Log.log4jLogInfo(PayPalOperate.class,"EC Token:" + setExpressCheckoutResponse.getToken());
				redirctURLString="https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token="+setExpressCheckoutResponse.getToken();
			}
			// ### Error Values
			// Access error values from error list using getter methods
			else 
			{
				List<ErrorType> errorList = setExpressCheckoutResponse.getErrors();
				Log.log4jLogInfo(PayPalOperate.class,"API Error Message : "+ errorList.get(0).getLongMessage());
			}
			return SUCCESS;
		 }
	}
	
	
	/**
	 * 快速支付的第二步 ，同意支付以后，获取详细信息
	 * @return
	 */
	public String getExpressCheckoutDetails()
	{
		String token=(String) session.get("paypal-token");
		GetExpressCheckout gc=new GetExpressCheckout();
		gc.setToken(token);
		gc.setConfigFilePath(configFilePath);
		GetExpressCheckoutDetailsResponseType getExpressCheckoutDetailsResponse = gc.getExpressCheckout();
		// ## Accessing response parameters
		// You can access the response parameters using getter methods in
		// response object as shown below
		// ### Success values
		if (getExpressCheckoutDetailsResponse.getAck().getValue()
				.equalsIgnoreCase("success")) {
			
//			Unique PayPal Customer Account identification number.
//			 
//			Character length and limitations: 13 single-byte alphanumeric characters

			String payerId=getExpressCheckoutDetailsResponse
					.getGetExpressCheckoutDetailsResponseDetails()
					.getPayerInfo().getPayerID();
			
//			ebl:EmailAddressType
//			 
//			Email address of buyer.
//			 
//			Character length and limitations: 127 single-byte characters

			String email = getExpressCheckoutDetailsResponse.getGetExpressCheckoutDetailsResponseDetails()
			.getPayerInfo().getPayer();
			
			session.put("payerID", payerId);
	
			// Unique PayPal Customer Account identification number. This
			// value will be null unless you authorize the payment by
			// redirecting to PayPal after `SetExpressCheckout` call.
			Log.log4jLogInfo(PayPalOperate.class,"payerId="+payerId);
			Log.log4jLogInfo(PayPalOperate.class,"email="+email);
	
		}
		// ### Error Values
		// Access error values from error list using getter methods
		else {
			List<ErrorType> errorList = getExpressCheckoutDetailsResponse
					.getErrors();
			Log.log4jLogInfo(PayPalOperate.class,errorList.get(0).getLongMessage());
		}
		return SUCCESS;
	}
	
	/**
	 * 快速支付的第三步 ，最终确定支付
	 * @return
	 */
	public String doExpressCheckoutPayment() 
	{
//		String token=(String) session.get("paypal-token");
//		String PayerID=(String) session.get("payerId");
		Integer tempOrderId=(Integer) session.get("paymentOrderId");//从session中取出要支付的相应订单，类型是int
		if(tempOrderId==null)
		{//说明session已经过期
			return LOGIN;
		}
		else 
		{
			OrderShowVO vo=new OrderShowVO();
			OrderShowVO orderVO=vo.getOrderShowVOByOrderId(tempOrderId);
			
			DoExpressCheckout doEC=new DoExpressCheckout();
			
			doEC.setToken(token);
			doEC.setPayerID(PayerID);
			doEC.setConfigFilePath(configFilePath);
			doEC.setOrderVO(orderVO);
			
			DoExpressCheckoutPaymentResponseType doExpressCheckoutPaymentResponse = doEC.doExpressCheckout();
			// ## Accessing response parameters
			// You can access the response parameters using getter methods in
			// response object as shown below
			// ### Success values
			if (doExpressCheckoutPaymentResponse.getAck().getValue()
					.equalsIgnoreCase("success")) {
	
				// Transaction identification number of the transaction that was
				// created.
				// This field is only returned after a successful transaction
				// for DoExpressCheckout has occurred.
				if (doExpressCheckoutPaymentResponse
						.getDoExpressCheckoutPaymentResponseDetails()
						.getPaymentInfo() != null) {
					Iterator<PaymentInfoType> paymentInfoIterator = doExpressCheckoutPaymentResponse
							.getDoExpressCheckoutPaymentResponseDetails()
							.getPaymentInfo().iterator();
					while (paymentInfoIterator.hasNext()) {
						PaymentInfoType paymentInfo = paymentInfoIterator
								.next();
						Log.log4jLogInfo(PayPalOperate.class,"Transaction ID : "
								+ paymentInfo.getTransactionID());
					}
				}//end of if
				
				//设定支付方式为1,1表示paypal
				orderVO.getOrder().setOrderstate((short) 1);//表示已经支付
				orderVO.getOrder().setPaymenttype((short) 1);//表示支付方式为1
				
				//支付之后改变支付的操作
				PaymentAfterOperate paoAfterOperate=new PaymentAfterOperate(orderVO.getOrder());
				paoAfterOperate.execute();
			}
			// ### Error Values
			// Access error values from error list using getter methods
			else {
				List<ErrorType> errorList = doExpressCheckoutPaymentResponse
						.getErrors();
				Log.log4jLogInfo(PayPalOperate.class,"API Error Message : "
						+ errorList.get(0).getLongMessage());
			}
			
			return SUCCESS;
		}
	}
	
	
	
	
	
	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	public String getRedirctURLString() {
		return redirctURLString;
	}

	public void setRedirctURLString(String redirctURLString) {
		this.redirctURLString = redirctURLString;
	}


	public String getToken() {
		return token;
	}


	public void setToken(String token) {
		this.token = token;
	}


	public String getPayerID() {
		return PayerID;
	}


	public void setPayerID(String payerID) {
		PayerID = payerID;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public float getTotalPaymentAmount() {
		return totalPaymentAmount;
	}


	public void setTotalPaymentAmount(float totalPaymentAmount) {
		this.totalPaymentAmount = totalPaymentAmount;
	}


	public float getTotalPaymentAmountByExchangeRate() {
		return totalPaymentAmountByExchangeRate;
	}


	public void setTotalPaymentAmountByExchangeRate(
			float totalPaymentAmountByExchangeRate) {
		this.totalPaymentAmountByExchangeRate = totalPaymentAmountByExchangeRate;
	}


	public int getCurrencyId() {
		return currencyId;
	}


	public void setCurrencyId(int currencyId) {
		this.currencyId = currencyId;
	}
}
