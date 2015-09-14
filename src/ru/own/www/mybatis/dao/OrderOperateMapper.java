package ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductAttr;
import ru.own.www.entity.CartProductAttrShowVO;
import ru.own.www.entity.CartProductImage;
import ru.own.www.entity.MailAddress;
import ru.own.www.entity.MailAddressShowVO;
import ru.own.www.entity.Order;
import ru.own.www.entity.OrderShowVO;
import ru.own.www.entity.Orderdetail;
import ru.own.www.entity.Orderdetailproductattr;
import ru.own.www.entity.QueryParameters;
import ru.own.www.entity.shopCartShowVO;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月13日 上午10:00:25  
 */
public interface OrderOperateMapper extends MybatisCommonOperateMapper
{
	
	public void insertOrder(Order order);

	/**
	 * 插入订单详细信息，也就是改订单包含的每一个商品的详情
	 * @param od
	 * @return
	 */
	public int insertOrderDetail(Orderdetail od);

	/**
	 * 插入每一个商品的属性信息
	 * @param opa
	 */
	public void insertOrderProductAttr(Orderdetailproductattr opa);

	public OrderShowVO getOrderShowVOByOrderId(int orderId2);
	
	public List<OrderShowVO> getOrderShowVOByParameters(QueryParameters qp);
	
	public List<OrderShowVO> getCurrentDayOrder();
	/**
	 * 用户支付之后，改变订单的一些状态，包括支付的方式，支付的时间，订单的状态
	 * @param order
	 * @return
	 */
	public int updateOrderAfterPayment(Order order);

	public int getTotalOrderCountByUserId(int uid);

	public int getAwaitingPaymentCountByUserId(QueryParameters qp);

	public int getTotalNumberOrderByParameters(QueryParameters qp);

	public OrderShowVO getOrderShowVOByOrderIdAndUserId(QueryParameters qp);

	public int saveDiscountInfoForOrder(Order odOrder);
}
