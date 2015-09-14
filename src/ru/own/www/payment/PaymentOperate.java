package ru.own.www.payment;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.apache.struts2.interceptor.SessionAware;

import ru.own.www.entity.Order;
import ru.own.www.entity.OrderShowVO;
import ru.own.www.mybatis.dao.OrderOperateDAOImpl;
import ru.own.www.mybatis.dao.OrderOperateMapper;
import ru.own.www.payment.paypal.merchant.DoExpressCheckout;
import ru.own.www.payment.paypal.merchant.GetExpressCheckout;
import ru.own.www.payment.paypal.merchant.SetExpressCheckout;
import systemlog.Log;
import urn.ebay.api.PayPalAPI.DoExpressCheckoutPaymentResponseType;
import urn.ebay.api.PayPalAPI.GetExpressCheckoutDetailsResponseType;
import urn.ebay.api.PayPalAPI.SetExpressCheckoutResponseType;
import urn.ebay.apis.eBLBaseComponents.ErrorType;
import urn.ebay.apis.eBLBaseComponents.PaymentInfoType;
import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.ActionSupport;

public class PaymentOperate  extends ActionSupport implements SessionAware
{
	private Map session;
	private int orderNumber;//订单编号
	private int orderId; //订单主键
	
	//订单信息
	private OrderShowVO osvo;
	private String orderShowJsonString;
	
	public String checkOut()
	{
		osvo=getOrderShowVOByOrderId(orderId);
		
		JSONObject tempJsonObject=JSONObject.fromObject(osvo);
		orderShowJsonString=tempJsonObject.toString();
		
		return SUCCESS;
	}
	
	
	public OrderShowVO getOrderShowVOByOrderId(int orderId2) 
	{
		OrderShowVO osvoOrderShowVO=null;
		OrderOperateMapper cpid=new OrderOperateDAOImpl();
		cpid.openSession();
		SqlSession sqlSession = cpid.getSqlSession();
		try 
		{//生成订单
			osvoOrderShowVO=cpid.getOrderShowVOByOrderId(orderId2);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			cpid.closeSession();
		}
		return osvoOrderShowVO;
	}


	@Override
	public void setSession(Map session) {
		this.session = session;
	}





	public int getOrderNumber() {
		return orderNumber;
	}


	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public OrderShowVO getOsvo() {
		return osvo;
	}


	public void setOsvo(OrderShowVO osvo) {
		this.osvo = osvo;
	}


	public String getOrderShowJsonString() {
		return orderShowJsonString;
	}


	public void setOrderShowJsonString(String orderShowJsonString) {
		this.orderShowJsonString = orderShowJsonString;
	}
	
	

}
