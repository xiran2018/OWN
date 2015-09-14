package ru.own.www.logic;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


































import java.util.Random;

import javax.swing.text.ChangedCharSetException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.validator.Var;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.apache.logging.log4j.core.tools.Generate;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductAttrShowVO;
import ru.own.www.entity.CartProductImage;
import ru.own.www.entity.MailAddress;
import ru.own.www.entity.MailAddressShowVO;
import ru.own.www.entity.Order;
import ru.own.www.entity.OrderShowVO;
import ru.own.www.entity.Orderdetail;
import ru.own.www.entity.Orderdetailproductattr;
import ru.own.www.entity.ProductBasicShowVO;
import ru.own.www.entity.QueryParameters;
import ru.own.www.entity.ShippingInfo;
import ru.own.www.entity.ShippingShowVO;
import ru.own.www.entity.SkuShowVO;
import ru.own.www.entity.shopCartShowVO;
import ru.own.www.mybatis.dao.CartOperateDAOImpl;
import ru.own.www.mybatis.dao.CartOperateMapper;
import ru.own.www.mybatis.dao.CartProductImageDAOImpl;
import ru.own.www.mybatis.dao.CartProductImageMapper;
import ru.own.www.mybatis.dao.MailAddressOperateDAOImpl;
import ru.own.www.mybatis.dao.MailAddressOperateMapper;
import ru.own.www.mybatis.dao.OrderOperateDAOImpl;
import ru.own.www.mybatis.dao.OrderOperateMapper;
import systemlog.Log;
import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.ShippingCountry;
import admin.ru.own.www.entity.User;
import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateMapper;
import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
import admin.ru.own.www.mybatis.dao.UserOperateImpl;
import admin.ru.own.www.mybatis.dao.UserOperateMapper;
import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.ActionSupport;


/**  
 * This class is used for 生成订单之后的相关操作 
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月8日 下午3:49:59  
 */
public class OrderAfterOperate extends ActionSupport implements SessionAware
{
	private Map session;
	
	
	private int orderId; //订单主键
	
	//打折信息相关
	private String reduceFee;
	private String discountReason;
	
	private OrderShowVO orderShowVO;//某一个订单
	private List<OrderShowVO> orderList;//订单列表
	private String orderListString;//订单列表的json字符串

	
	private int awaitingPaymentCount; //等待付款的订单数量
	
	//查询参数
	private String productName="";//商品名称
	private String orderNo;//订单号
	private String orderStatus;//订单状态
	private String buyerName;//买家名称
	private String gmtBeginDate;//订单的开始时间
	private String gmtEndDate;//订单的结束时间
	
	/////////////////////分页相关///////////////////////////////////
	private int returnType=0;//成功返回的时候，是返回到jsp页面，还是json数据,0：返回到jsp页面，1：返回json数据
	private String errCode;//100:取数据不成功，200：取数据成功
	private String errMessage;
	private Integer pagenum=1;//需要获取的信息所在的页数,默认从第一页开始取数据,需要显示那一页，需要从前台获取
	private Integer numberInPage=15;//每一页需要显示的行数，默认是10行数据
	private int totalNumberPage; //总页数
	/////////////////////end of分页相关///////////////////////////////////
	
	public String showOrderDetail() 
	{
		Integer  userId=(Integer)session.get("customeruserid");
		if(userId==null||userId<0)
			return LOGIN;
		orderShowVO=fetchOrderShowVOByOrderIdAndUserid(orderId,userId);
		orderListString=JSONObject.fromObject(orderShowVO).toString();
		return SUCCESS;
	}
	
	public OrderShowVO fetchOrderShowVOByOrderIdAndUserid(int orderid,Integer userId)
	{

		OrderOperateMapper oomMapper =new OrderOperateDAOImpl();
		oomMapper.openSession();
		
		QueryParameters qp=new QueryParameters();
		qp.setId(orderid);
		if(userId!=null&&userId>0)
		{
			qp.setUserid(userId);
		}

		
		OrderShowVO tempOrderShowVO=oomMapper.getOrderShowVOByOrderIdAndUserId(qp);
		oomMapper.closeSession();
		return tempOrderShowVO;
	}
	
	
	/*
	 * 根据相应的查询参数，得到相应的订单
	 * */
	public String getOrderShowVOByParameters()
	{
		Integer  userId=(Integer)session.get("customeruserid");
		if(userId==null||userId<0)
			return LOGIN;
		if(returnType==0)
		{
			awaitingPaymentCount=fecthAwaitingPaymentCountByUserId(userId);
		}
		fecthOrderShowVOByUserId(userId);//获取相应用户的订单
		if(returnType==0)
		{
			return SUCCESS;
		}
		else if(returnType==1)
		{
			return "jsonResult";
		}
		else {
			return SUCCESS;
		}
		
	}
	
	/**
	 * 获取相应用户的所有订单信息，当userId=null时，获取的是所有的订单信息
	 * @param userId
	 */
	private void fecthOrderShowVOByUserId(Integer userId) 
	{
		OrderOperateMapper oomMapper =new OrderOperateDAOImpl();
		oomMapper.openSession();
		
		QueryParameters qp=new QueryParameters();
		if(userId!=null&&userId>0)
		{
			qp.setUserid(userId);
		}
		qp.setId(orderId);
		qp.setProductName(productName);
		qp.setOrderNo(orderNo);
		qp.setOrderStatus(orderStatus);
		qp.setBuyerName(buyerName);
		if((gmtBeginDate!=null&&!gmtBeginDate.equals(""))||(gmtEndDate!=null&&!gmtEndDate.equals("")))
		{//如果有任何一个不为空，则要进行特殊处理
			gmtBeginDate=Utility.getQueryDate(gmtBeginDate);
			gmtEndDate=Utility.getQueryDate(gmtEndDate);
		}
		qp.setGmtBeginDate(gmtBeginDate);
		qp.setGmtEndDate(gmtEndDate);

		int count=oomMapper.getTotalNumberOrderByParameters(qp);//总页数
		totalNumberPage=count/numberInPage;//设定有多少页
		if(count>numberInPage&&count%numberInPage!=0)
		{//说明不能整除
			totalNumberPage++;
		}
		
		int offset=(pagenum-1)*numberInPage;//从哪一个偏移量开始取数据
		//订单需要倒序排列，在数据库查询的时候已经实现

		qp.setNumberInPage(numberInPage);
		qp.setOffset(offset);
		
		orderList=oomMapper.getOrderShowVOByParameters(qp);
		oomMapper.closeSession();
        if(orderList == null) 
        {
        	errCode="100";
        	errMessage="服务器异常，请稍后再试";

        }
        else 
        {
        	if(orderList!=null)
        	{
        		orderListString=JSONArray.fromObject(orderList).toString();
        	}
        	errCode="200";
        	errMessage="get the data success!";
        }
	}








	/**
	 * 得到所有未付款的订单信息
	 * @param userId
	 * @return
	 */
	private int fecthAwaitingPaymentCountByUserId(Integer userId) 
	{
		int count=0;
		OrderOperateMapper oom=new OrderOperateDAOImpl();
		oom.openSession();
		QueryParameters qParameters=new QueryParameters();
		if(userId!=null)
		{
			qParameters.setUserid(userId);
		}
		count=oom.getAwaitingPaymentCountByUserId(qParameters);
		oom.closeSession();
		return count;
	}

///////////////////////后台管理员的相关操作/////////////////////////////////////////////////////
	
	/*
	 * 根据相应的查询参数，得到相应的订单
	 * */
	public String showAllOrdersForRoot()
	{
		Integer  userId=null;
		if(returnType==0)
		{
			awaitingPaymentCount=fecthAwaitingPaymentCountByUserId(userId);
		}
		fecthOrderShowVOByUserId(userId);//获取相应用户的订单
		if(returnType==0)
		{
			return SUCCESS;
		}
		else if(returnType==1)
		{
			return "jsonResult";
		}
		else {
			return SUCCESS;
		}
		
	}
	
	/**
	 * 获取订单的详细信息
	 * @return
	 */
	public String showOrderDetailForRoot() 
	{
		Integer  userId=null;
		orderShowVO=fetchOrderShowVOByOrderIdAndUserid(orderId,userId);
		orderListString=JSONObject.fromObject(orderShowVO).toString();
		return SUCCESS;
	}
	
	/**
	 * 保存打折信息
	 * @return
	 */
	public String saveDiscountInfoForOrder()
	{
		Order odOrder=new Order();
		odOrder.setId(orderId);
		odOrder.setReducefeereason(discountReason);
		odOrder.setReducefee(reduceFee);
		
		int count=0;
		OrderOperateMapper oom=new OrderOperateDAOImpl();
		oom.openSession();
		count=oom.saveDiscountInfoForOrder(odOrder);
		oom.commit();
		oom.closeSession();
		
		if(count>0)
		{
			errCode="200";//success
		}
		else 
		{
			errCode="100";
			
		}
		return SUCCESS;
		
	}

////////////////////////////////////////////////////////////////////////////

	public List<OrderShowVO> getOrderList() {
		return orderList;
	}



	public void setOrderList(List<OrderShowVO> orderList) {
		this.orderList = orderList;
	}



	public int getAwaitingPaymentCount() {
		return awaitingPaymentCount;
	}



	public void setAwaitingPaymentCount(int awaitingPaymentCount) {
		this.awaitingPaymentCount = awaitingPaymentCount;
	}



	/**
	 * 获取当天的所有订单
	 * @return
	 */
	public String getCurrentDayOrder()
	{
		return SUCCESS;
	}
	
	public void setSession(Map session) {
		this.session = session;
	}
	
	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getGmtBeginDate() {
		return gmtBeginDate;
	}

	public void setGmtBeginDate(String gmtBeginDate) {
		this.gmtBeginDate = gmtBeginDate;
	}

	public String getGmtEndDate() {
		return gmtEndDate;
	}

	public void setGmtEndDate(String gmtEndDate) {
		this.gmtEndDate = gmtEndDate;
	}

	public String getErrCode() {
		return errCode;
	}

	public void setErrCode(String errCode) {
		this.errCode = errCode;
	}

	public String getErrMessage() {
		return errMessage;
	}

	public void setErrMessage(String errMessage) {
		this.errMessage = errMessage;
	}

	public Integer getPagenum() {
		return pagenum;
	}

	public void setPagenum(Integer pagenum) {
		this.pagenum = pagenum;
	}

	public Integer getNumberInPage() {
		return numberInPage;
	}

	public void setNumberInPage(Integer numberInPage) {
		this.numberInPage = numberInPage;
	}

	public int getTotalNumberPage() {
		return totalNumberPage;
	}

	public void setTotalNumberPage(int totalNumberPage) {
		this.totalNumberPage = totalNumberPage;
	}

	public String getOrderListString() {
		return orderListString;
	}

	public void setOrderListString(String orderListString) {
		this.orderListString = orderListString;
	}


	public int getReturnType() {
		return returnType;
	}


	public void setReturnType(int returnType) {
		this.returnType = returnType;
	}

	public OrderShowVO getOrderShowVO() {
		return orderShowVO;
	}

	public void setOrderShowVO(OrderShowVO orderShowVO) {
		this.orderShowVO = orderShowVO;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getReduceFee() {
		return reduceFee;
	}

	public void setReduceFee(String reduceFee) {
		this.reduceFee = reduceFee;
	}

	public String getDiscountReason() {
		return discountReason;
	}

	public void setDiscountReason(String discountReason) {
		this.discountReason = discountReason;
	}
	
	
}
