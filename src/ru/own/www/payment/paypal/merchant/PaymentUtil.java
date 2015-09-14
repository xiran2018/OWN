package ru.own.www.payment.paypal.merchant;

import java.util.ArrayList;
import java.util.List;

import admin.ru.own.www.util.Utility;
import ru.own.www.entity.Order;
import ru.own.www.entity.OrderAmount;
import ru.own.www.entity.OrderDetailShowVO;
import ru.own.www.entity.OrderShowVO;
import ru.own.www.entity.Orderdetail;
import ru.own.www.entity.Orderdetailproductattr;
import urn.ebay.apis.CoreComponentTypes.BasicAmountType;
import urn.ebay.apis.eBLBaseComponents.AddressType;
import urn.ebay.apis.eBLBaseComponents.CountryCodeType;
import urn.ebay.apis.eBLBaseComponents.CurrencyCodeType;
import urn.ebay.apis.eBLBaseComponents.PaymentActionCodeType;
import urn.ebay.apis.eBLBaseComponents.PaymentDetailsItemType;
import urn.ebay.apis.eBLBaseComponents.PaymentDetailsType;
import urn.ebay.apis.eBLBaseComponents.SellerDetailsType;

public class PaymentUtil 
{
	OrderShowVO orderVO2;
	
	public PaymentUtil() 
	{
	}
	
	public PaymentUtil(OrderShowVO orderVO2) 
	{
		this.orderVO2=orderVO2;
	}
	
	/**
	 * 返回paypal需要的订单详细信息
	 * @return
	 */
	public List<PaymentDetailsType> getPaymentDetailsType() 
	{
		
		// ### Payment Information 支付信息
		// list of information about the payment
		List<PaymentDetailsType> paymentDetailsList = new ArrayList<PaymentDetailsType>();
				
		// information about the first payment
		PaymentDetailsType paymentDetails1 = new PaymentDetailsType();
		
//		paymentDetails1.setOrderDescription("jql OrderDescription");  //add by jql
		
		paymentDetails1.setNoteText("if you have any questions, please contact us!");   //add by jql
		
		List<OrderDetailShowVO> oDetailShowVOs = orderVO2.getOdsvo();
		int size=oDetailShowVOs.size();
		float totalPrice=0; //商品总价格
		float totalShipFee=0;//商品总的运费价格
		
		//商品信息列表
		List<PaymentDetailsItemType> paymentDetailsItemTypesList=new ArrayList<PaymentDetailsItemType>();
		
		for(int i=0;i<size;i++)
		{
			OrderDetailShowVO orderDetailShowVO=oDetailShowVOs.get(i);
			Orderdetail od=orderDetailShowVO.getOd();
			int count=od.getOrdercount(); //数量
			float price=od.getPrice(); //单价
			float shipFee=od.getShipfee();
			totalPrice=Utility.floatAdd(Utility.floatAdd(totalPrice,(count*price)),shipFee); //总价格=每一件商品的价格之和
			totalShipFee=Utility.floatAdd(totalShipFee,shipFee);
			
			//商品信息变量
			PaymentDetailsItemType paymentDetailsItemType=new PaymentDetailsItemType();
			
			//名称
			paymentDetailsItemType.setName(od.getProductname());
			//商品描述(包含属性信息等）
			String attrDesc=getProductAttr(orderDetailShowVO.getOdpa());
			paymentDetailsItemType.setDescription(attrDesc);
			
			////商品单价
			BasicAmountType amountPrice = new BasicAmountType(CurrencyCodeType.USD,Utility.decimalFormat(price));
			paymentDetailsItemType.setAmount(amountPrice);
			
			//商品数量
			paymentDetailsItemType.setQuantity(count);
			
			//地址
			paymentDetailsItemType.setItemURL(orderDetailShowVO.getCpi().getProductimageaddr());
			
			
			paymentDetailsItemTypesList.add(paymentDetailsItemType);
			
		}
		
		paymentDetails1.setPaymentDetailsItem(paymentDetailsItemTypesList);
		
		//shipping info 运费  add by jql
		BasicAmountType shippingTotal = new BasicAmountType(CurrencyCodeType.USD,Utility.decimalFormat(totalShipFee));
		paymentDetails1.setShippingTotal(shippingTotal);
		
		//tax  add by jql
//		BasicAmountType taxTotal = new BasicAmountType(CurrencyCodeType.USD,"0.00");
//		paymentDetails1.setTaxTotal(taxTotal);
		
		//获取人为需要减少或者增加的费用
		Order orderBasic = orderVO2.getOrder();
		int jifen=orderBasic.getUsejifen();
		//代表所有商品价格的总和  = orderTotal-邮费-税费-其他
		//form paypal :orderTotal = itemTotal + shippingTotal + handlingTotal + taxTotal
		float tempTotalPrice=Utility.floatSubtract(totalPrice,totalShipFee); //这个必须放在这里，才能保证tempTotalPrice（itemTotal）的正确性，如果放在下面，则不能满足以上的公式
		
		float shippingDiscount=(float) (0.01*jifen);
		totalPrice=Utility.floatSubtract(totalPrice,shippingDiscount);//从总价中扣除积分
		
		String  reduceFee=orderBasic.getReducefee();
		if(reduceFee.startsWith("+"))
		{
			String []reduceFeeString=reduceFee.split("\\+");
			totalPrice=Utility.floatAdd(totalPrice,Float.parseFloat(reduceFeeString[1])); //总价格加上这个数
			
			//如果是增加的费用，则作为TaxTotal  add by jql
			BasicAmountType taxTotal = new BasicAmountType(CurrencyCodeType.USD,Utility.decimalFormat(Float.parseFloat(reduceFeeString[1])));
			paymentDetails1.setTaxTotal(taxTotal);
		}
		else if(reduceFee.startsWith("-"))
		{
			String []reduceFeeString=reduceFee.split("-");
			totalPrice=Utility.floatSubtract(totalPrice,Float.parseFloat(reduceFeeString[1])); //总价格减去这个数
			
			//如果是减免的费用，则作为货运的优惠价实现  add by jql
			shippingDiscount=Utility.floatAdd(shippingDiscount,Float.parseFloat(reduceFeeString[1]));
		}
		
		//把积分优惠的费用，作为货运减免的费用
		BasicAmountType reduceShippingTotal = new BasicAmountType(CurrencyCodeType.USD,"-"+Utility.decimalFormat(shippingDiscount));
		paymentDetails1.setShippingDiscount(reduceShippingTotal);

		//代表所有商品价格的总和  = orderTotal-邮费-税费-其他
		BasicAmountType itemTotal = new BasicAmountType(CurrencyCodeType.USD,Utility.decimalFormat(tempTotalPrice));
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
//		paymentDetails1.setPaymentRequestID("PaymentRequest1");

		// `Address` to which the order is shipped, which takes mandatory
		// params:
		// 
		// * `Street Name`
		// * `City`
		// * `State`
		// * `Country`
		// * `Postal Code`
//		AddressType shipToAddress1 = new AddressType();
//		shipToAddress1.setStreet1("Ape Way");
//		shipToAddress1.setCityName("Austin");
//		shipToAddress1.setStateOrProvince("TX");
//		shipToAddress1.setCountry(CountryCodeType.US);
//		shipToAddress1.setPostalCode("78750");
		
//		paymentDetails1.setShipToAddress(shipToAddress1);

		// Your URL for receiving Instant Payment Notification (IPN) about this
		// transaction. If you do not specify this value in the request, the
		// notification URL from your Merchant Profile is used, if one exists.
		//IPN回调地址
//		paymentDetails1.setNotifyURL("http://localhost/ipn");

		
		
		
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
		BasicAmountType orderTotal1 = new BasicAmountType(CurrencyCodeType.USD,Utility.decimalFormat(totalPrice));
		paymentDetails1.setOrderTotal(orderTotal1);
		
		paymentDetailsList.add(paymentDetails1);//加入这个订单的信息
		
		return paymentDetailsList;
	}

	/**
	 * 计算订单的各种金额
	 * @return
	 */
	public OrderAmount getOrderAmount() 
	{
		
		List<OrderDetailShowVO> oDetailShowVOs = orderVO2.getOdsvo();
		int size=oDetailShowVOs.size();
		float totalPrice=0; //商品总价格
		float totalShipFee=0;//商品总的运费价格
		float shippingDiscount=0;
		float itemTotal=0;//所有物品的总价格
		float taxTotal=0;
		
		for(int i=0;i<size;i++)
		{
			OrderDetailShowVO orderDetailShowVO=oDetailShowVOs.get(i);
			Orderdetail od=orderDetailShowVO.getOd();
			int count=od.getOrdercount(); //数量
			float price=od.getPrice(); //单价
			float shipFee=od.getShipfee();
			totalPrice=Utility.floatAdd(Utility.floatAdd(totalPrice,(count*price)),shipFee); //总价格=每一件商品的价格之和
			totalShipFee=Utility.floatAdd(totalShipFee,shipFee);
		}
		
		//获取人为需要减少或者增加的费用
		Order orderBasic = orderVO2.getOrder();
		int jifen=orderBasic.getUsejifen();
		//代表所有商品价格的总和  = orderTotal-邮费-税费-其他
		//form paypal :orderTotal = itemTotal + shippingTotal + handlingTotal + taxTotal
		itemTotal=Utility.floatSubtract(totalPrice,totalShipFee); //这个必须放在这里，才能保证itemTotal的正确性，如果放在下面，则不能满足以上的公式
		
		shippingDiscount=(float) (0.01*jifen);
		totalPrice=Utility.floatSubtract(totalPrice,shippingDiscount);//从总价中扣除积分
		
		String  reduceFee=orderBasic.getReducefee();
		if(reduceFee.startsWith("+"))
		{
			String []reduceFeeString=reduceFee.split("\\+");
			totalPrice=Utility.floatAdd(totalPrice,Float.parseFloat(reduceFeeString[1])); //总价格加上这个数
			taxTotal=Float.parseFloat(reduceFeeString[1]);
		}
		else if(reduceFee.startsWith("-"))
		{
			String []reduceFeeString=reduceFee.split("-");
			totalPrice=Utility.floatSubtract(totalPrice,Float.parseFloat(reduceFeeString[1])); //总价格减去这个数
			
			//如果是减免的费用，则作为货运的优惠价实现  add by jql
			shippingDiscount=Utility.floatAdd(shippingDiscount,Float.parseFloat(reduceFeeString[1]));
		}
		
		OrderAmount oAmount=new OrderAmount();
		oAmount.setOrderTotal(totalPrice);
		oAmount.setItemTotal(itemTotal);
		oAmount.setShippingTotal(totalShipFee);
		oAmount.setHandlingTotal(0);
		oAmount.setTaxTotal(taxTotal);
		oAmount.setShippingDiscountTotal(shippingDiscount);
		return oAmount;
	}
	/**
	 * 商品属性字符串
	 * @param odpa
	 * @return
	 */
	public String getProductAttr(List<Orderdetailproductattr> odpa) 
	{
		String attrString="";
		for(int i=0;i<odpa.size();i++)
		{
			Orderdetailproductattr attr=odpa.get(i);
			String attrNameString=attr.getAttrname();
			String attrValueString=attr.getAttrvalue();
			if(attrString.equals(""))
			{
				attrString=attrNameString+":"+attrValueString;
			}
			else 
			{
				attrString+=";"+attrNameString+":"+attrValueString;
			}
		}
		return attrString;
	}
}
