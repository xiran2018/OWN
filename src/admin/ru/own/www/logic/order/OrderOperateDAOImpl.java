// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OrderOperateDAOImpl.java

package admin.ru.own.www.logic.order;

import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import ru.own.www.entity.*;

// Referenced classes of package admin.ru.own.www.logic.order:
//			OrderOperateMapper

public class OrderOperateDAOImpl implements OrderOperateMapper
{

	private SqlSession sqlSession;
	private OrderOperateMapper commonMapper;

	public OrderOperateDAOImpl()
	{
	}

	public int saveDiscountInfoForOrder(Order odOrder)
	{
		int count = commonMapper.saveDiscountInfoForOrder(odOrder);
		return count;
	}

	public OrderShowVO getOrderShowVOByOrderIdAndUserId(QueryParameters qp)
	{
		OrderShowVO osvoOrderShowVO = commonMapper.getOrderShowVOByOrderIdAndUserId(qp);
		return osvoOrderShowVO;
	}

	public int getTotalNumberOrderByParameters(QueryParameters qp)
	{
		return commonMapper.getTotalNumberOrderByParameters(qp);
	}

	public int getAwaitingPaymentCountByUserId(QueryParameters qp)
	{
		return commonMapper.getAwaitingPaymentCountByUserId(qp);
	}

	public int getTotalOrderCountByUserId(int uid)
	{
		return commonMapper.getTotalOrderCountByUserId(uid);
	}

	public List getCurrentDayOrder()
	{
		List osvoOrderShowVO = commonMapper.getCurrentDayOrder();
		return osvoOrderShowVO;
	}

	public List getOrderShowVOByParameters(QueryParameters qp)
	{
		List osvoOrderShowVO = commonMapper.getOrderShowVOByParameters(qp);
		return osvoOrderShowVO;
	}

	public OrderShowVO getOrderShowVOByOrderId(int orderId2)
	{
		OrderShowVO orderShowVO = commonMapper.getOrderShowVOByOrderId(orderId2);
		return orderShowVO;
	}

	public void openSession()
	{
		sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		commonMapper = (OrderOperateMapper)sqlSession.getMapper(OrderOperateMapper.class);
	}

	public void closeSession()
	{
		sqlSession.close();
	}

	public void commit()
	{
		sqlSession.commit();
	}

	public void rollBack()
	{
		sqlSession.rollback();
	}

	public SqlSession getSqlSession()
	{
		return sqlSession;
	}
}
