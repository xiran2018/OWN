package ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
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
 * @data 2015年1月13日 上午10:00:39  
 */
public class OrderOperateDAOImpl implements OrderOperateMapper
{
///////////////////////////////////////must be included//////////////////////////////////////////////
	private SqlSession sqlSession;
	private OrderOperateMapper commonMapper;
/////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public int saveDiscountInfoForOrder(Order odOrder) 
	{
		int count=commonMapper.saveDiscountInfoForOrder(odOrder);
		return count;
	}
	
	@Override
	public OrderShowVO getOrderShowVOByOrderIdAndUserId(ru.own.www.entity.QueryParameters qp) 
	{
		OrderShowVO osvoOrderShowVO=commonMapper.getOrderShowVOByOrderIdAndUserId(qp);
		return osvoOrderShowVO;
	}
	
	@Override
	public int getTotalNumberOrderByParameters(ru.own.www.entity.QueryParameters qp) 
	{
		return commonMapper.getTotalNumberOrderByParameters(qp) ;
	}
	
	@Override
	public int getAwaitingPaymentCountByUserId(QueryParameters qp) 
	{
		return commonMapper.getAwaitingPaymentCountByUserId(qp);
	}
	
	@Override
	public int getTotalOrderCountByUserId(int uid) 
	{
		return commonMapper.getTotalOrderCountByUserId(uid);
	}
	@Override
	public List<OrderShowVO> getCurrentDayOrder()
	{
		List<OrderShowVO> osvoOrderShowVO=commonMapper.getCurrentDayOrder();
		return osvoOrderShowVO;
	}
	
	@Override
	public List<OrderShowVO> getOrderShowVOByParameters(ru.own.www.entity.QueryParameters qp) 
	{
		List<OrderShowVO> osvoOrderShowVO=commonMapper.getOrderShowVOByParameters(qp);
		return osvoOrderShowVO;
	}
	
	@Override
	public int updateOrderAfterPayment(Order order) 
	{
		int i=0;
		i=commonMapper.updateOrderAfterPayment(order);
		return i;
	}
	@Override
	public OrderShowVO getOrderShowVOByOrderId(int orderId2) 
	{
		OrderShowVO orderShowVO=commonMapper.getOrderShowVOByOrderId(orderId2);
		return orderShowVO;
	}
	public void insertOrderProductAttr(Orderdetailproductattr opa) 
	{
		commonMapper.insertOrderProductAttr(opa);
	}
	@Override
	public int insertOrderDetail(Orderdetail od) 
	{
		int i=commonMapper.insertOrderDetail(od);
		return i;
	}
	@Override
	public void insertOrder(Order order) 
	{
		commonMapper.insertOrder(order);
	}
////////////////////////////////////////must be included/////////////////////////////
	@Override
	public void openSession()
	{
		sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		commonMapper = sqlSession.getMapper(OrderOperateMapper.class);
	}
	
	@Override
	public void closeSession() {
		sqlSession.close();
	}

	@Override
	public void commit() {
		sqlSession.commit();
		
	}

	@Override
	public void rollBack() 
	{
		sqlSession.rollback();
	}

	@Override
	public SqlSession getSqlSession() {
		return sqlSession;
	}
/////////////////////////////////////////////////////////////////////////////////////

}
