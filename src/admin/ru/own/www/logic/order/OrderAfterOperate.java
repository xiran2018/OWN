// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OrderAfterOperate.java

package admin.ru.own.www.logic.order;

import admin.ru.own.www.entity.Currency;
import admin.ru.own.www.mybatis.dao.CurrencyDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.util.Utility;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.interceptor.SessionAware;
import ru.own.www.entity.*;

// Referenced classes of package admin.ru.own.www.logic.order:
//			OrderOperateDAOImpl, OrderOperateMapper

public class OrderAfterOperate extends ActionSupport
	implements SessionAware
{

	private Map session;
	private int orderId;
	private int currencyId;
	private String reduceFee;
	private String discountReason;
	private OrderShowVO orderShowVO;
	private List orderList;
	private String orderListString;
	private int awaitingPaymentCount;
	private String productName;
	private String orderNo;
	private String orderStatus;
	private String buyerName;
	private String gmtBeginDate;
	private String gmtEndDate;
	private int returnType;
	private String errCode;
	private String errMessage;
	private Integer pagenum;
	private Integer numberInPage;
	private int totalNumberPage;

	public OrderAfterOperate()
	{
		productName = "";
		returnType = 0;
		pagenum = Integer.valueOf(1);
		numberInPage = Integer.valueOf(15);
	}

	public OrderShowVO fetchOrderShowVOByOrderIdAndUserid(int orderid, Integer userId)
	{
		OrderOperateMapper oomMapper = new OrderOperateDAOImpl();
		oomMapper.openSession();
		QueryParameters qp = new QueryParameters();
		qp.setId(orderid);
		if (userId != null && userId.intValue() > 0)
			qp.setUserid(userId.intValue());
		OrderShowVO tempOrderShowVO = oomMapper.getOrderShowVOByOrderIdAndUserId(qp);
		oomMapper.closeSession();
		return tempOrderShowVO;
	}

	private void fecthOrderShowVOByUserId(Integer userId)
	{
		OrderOperateMapper oomMapper = new OrderOperateDAOImpl();
		oomMapper.openSession();
		QueryParameters qp = new QueryParameters();
		if (userId != null && userId.intValue() > 0)
			qp.setUserid(userId.intValue());
		qp.setId(orderId);
		qp.setProductName(productName);
		qp.setOrderNo(orderNo);
		qp.setOrderStatus(orderStatus);
		qp.setBuyerName(buyerName);
		if (gmtBeginDate != null && !gmtBeginDate.equals("") || gmtEndDate != null && !gmtEndDate.equals(""))
		{
			gmtBeginDate = Utility.getQueryDate(gmtBeginDate);
			gmtEndDate = Utility.getQueryDate(gmtEndDate);
		}
		qp.setGmtBeginDate(gmtBeginDate);
		qp.setGmtEndDate(gmtEndDate);
		int count = oomMapper.getTotalNumberOrderByParameters(qp);
		totalNumberPage = count / numberInPage.intValue();
		if (count > numberInPage.intValue() && count % numberInPage.intValue() != 0)
			totalNumberPage++;
		int offset = (pagenum.intValue() - 1) * numberInPage.intValue();
		qp.setNumberInPage(numberInPage);
		qp.setOffset(offset);
		orderList = oomMapper.getOrderShowVOByParameters(qp);
		oomMapper.closeSession();
		if (orderList == null)
		{
			errCode = "100";
			errMessage = "�������쳣�����Ժ�����";
		} else
		{
			if (orderList != null)
				orderListString = JSONArray.fromObject(orderList).toString();
			errCode = "200";
			errMessage = "get the data success!";
		}
	}

	private int fecthAwaitingPaymentCountByUserId(Integer userId)
	{
		int count = 0;
		OrderOperateMapper oom = new OrderOperateDAOImpl();
		oom.openSession();
		QueryParameters qParameters = new QueryParameters();
		if (userId != null)
			qParameters.setUserid(userId.intValue());
		count = oom.getAwaitingPaymentCountByUserId(qParameters);
		oom.closeSession();
		return count;
	}

	public String showAllOrdersForRoot()
	{
		Integer userId = null;
		if (returnType == 0)
			awaitingPaymentCount = fecthAwaitingPaymentCountByUserId(userId);
		fecthOrderShowVOByUserId(userId);
		if (returnType == 0)
			return "success";
		if (returnType == 1)
			return "jsonResult";
		else
			return "success";
	}

	public String showOrderDetailForRoot()
	{
		Integer userId = null;
		orderShowVO = fetchOrderShowVOByOrderIdAndUserid(orderId, userId);
		orderListString = JSONObject.fromObject(orderShowVO).toString();
		return "success";
	}

	public String saveDiscountInfoForOrder()
	{
		CurrencyDAO dao = (CurrencyDAO) DAOFactory.getInstance().getDAOImp(CurrencyDAO.class.getName());
		Currency currency = dao.getCurrencyById(currencyId);
		Double curate = currency.getCurrencyrate();
		Double realreducefee = 0D;
		String realstr;
		if(reduceFee.contains("+")){
			String[] a= reduceFee.split("\\+");
			realreducefee = Double.parseDouble(a[1]);
			Double real = realreducefee * curate;
			real = (double) Math.round(real*100) / 100;
			realstr = "+"+real;
		}
		else if(reduceFee.contains("-")){
			String[] a= reduceFee.split("-");
			realreducefee = Double.parseDouble(a[1]);
			Double real = realreducefee * curate;
			real = (double) Math.round(real*100) / 100;
			realstr = "-"+real;
		}
		else{
			errCode = "100";
			return "success";
		}



		Order odOrder = new Order();
		odOrder.setId(Integer.valueOf(orderId));
		odOrder.setReducefeereason(discountReason);
		odOrder.setReducefee(realstr);
		odOrder.setCurrencyrate(currency.getCurrencyrate()); //设置现在的汇率
		int count = 0;
		OrderOperateMapper oom = new OrderOperateDAOImpl();
		oom.openSession();
		count = oom.saveDiscountInfoForOrder(odOrder);
		oom.commit();
		oom.closeSession();
		if (count > 0)
			errCode = "200";
		else
			errCode = "100";
		return "success";
	}

	public List getOrderList()
	{
		return orderList;
	}

	public void setOrderList(List orderList)
	{
		this.orderList = orderList;
	}

	public int getAwaitingPaymentCount()
	{
		return awaitingPaymentCount;
	}

	public void setAwaitingPaymentCount(int awaitingPaymentCount)
	{
		this.awaitingPaymentCount = awaitingPaymentCount;
	}

	public String getCurrentDayOrder()
	{
		return "success";
	}

	public void setSession(Map session)
	{
		this.session = session;
	}

	public int getOrderId()
	{
		return orderId;
	}

	public void setOrderId(int orderId)
	{
		this.orderId = orderId;
	}

	public String getProductName()
	{
		return productName;
	}

	public void setProductName(String productName)
	{
		this.productName = productName;
	}

	public String getOrderNo()
	{
		return orderNo;
	}

	public void setOrderNo(String orderNo)
	{
		this.orderNo = orderNo;
	}

	public String getOrderStatus()
	{
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus)
	{
		this.orderStatus = orderStatus;
	}

	public String getGmtBeginDate()
	{
		return gmtBeginDate;
	}

	public void setGmtBeginDate(String gmtBeginDate)
	{
		this.gmtBeginDate = gmtBeginDate;
	}

	public String getGmtEndDate()
	{
		return gmtEndDate;
	}

	public void setGmtEndDate(String gmtEndDate)
	{
		this.gmtEndDate = gmtEndDate;
	}

	public String getErrCode()
	{
		return errCode;
	}

	public void setErrCode(String errCode)
	{
		this.errCode = errCode;
	}

	public String getErrMessage()
	{
		return errMessage;
	}

	public void setErrMessage(String errMessage)
	{
		this.errMessage = errMessage;
	}

	public Integer getPagenum()
	{
		return pagenum;
	}

	public void setPagenum(Integer pagenum)
	{
		this.pagenum = pagenum;
	}

	public Integer getNumberInPage()
	{
		return numberInPage;
	}

	public void setNumberInPage(Integer numberInPage)
	{
		this.numberInPage = numberInPage;
	}

	public int getTotalNumberPage()
	{
		return totalNumberPage;
	}

	public void setTotalNumberPage(int totalNumberPage)
	{
		this.totalNumberPage = totalNumberPage;
	}

	public String getOrderListString()
	{
		return orderListString;
	}

	public void setOrderListString(String orderListString)
	{
		this.orderListString = orderListString;
	}

	public int getReturnType()
	{
		return returnType;
	}

	public void setReturnType(int returnType)
	{
		this.returnType = returnType;
	}

	public OrderShowVO getOrderShowVO()
	{
		return orderShowVO;
	}

	public void setOrderShowVO(OrderShowVO orderShowVO)
	{
		this.orderShowVO = orderShowVO;
	}

	public String getBuyerName()
	{
		return buyerName;
	}

	public void setBuyerName(String buyerName)
	{
		this.buyerName = buyerName;
	}

	public String getReduceFee()
	{
		return reduceFee;
	}

	public void setReduceFee(String reduceFee)
	{
		this.reduceFee = reduceFee;
	}

	public String getDiscountReason()
	{
		return discountReason;
	}

	public void setDiscountReason(String discountReason)
	{
		this.discountReason = discountReason;
	}

	public int getCurrencyId() {
		return currencyId;
	}

	public void setCurrencyId(int currencyId) {
		this.currencyId = currencyId;
	}
}
