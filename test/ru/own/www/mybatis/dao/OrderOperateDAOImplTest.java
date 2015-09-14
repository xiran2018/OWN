package ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;

import ru.own.www.entity.Order;
import ru.own.www.entity.OrderShowVO;
import ru.own.www.entity.QueryParameters;

public class OrderOperateDAOImplTest {
	
	@Test
	public void testSaveDiscountInfo() {
		Order odOrder=new Order();
		odOrder.setId(10);
		odOrder.setReducefeereason("UUUUUUUUUUUUUUUUU");
		odOrder.setReducefee("+20");
		
		int count=0;
		OrderOperateMapper oom=new OrderOperateDAOImpl();
		oom.openSession();
		count=oom.saveDiscountInfoForOrder(odOrder);
		oom.commit();
		oom.closeSession();
		
		assertEquals(1, count);
	}

	@Ignore
	public void testGetOrderShowVOByParameters() 
	{
		QueryParameters qParameters=new QueryParameters();
//		qParameters.setId(19);
		qParameters.setUserid(1);
		qParameters.setProductName("Women");
//		qParameters.setOrderNo("20150405151858573151");
		qParameters.setOrderStatus("1");
		qParameters.setGmtBeginDate("20150317");
		qParameters.setGmtEndDate("20150405");
		qParameters.setOffset(0);
		qParameters.setNumberInPage(10);
		OrderOperateMapper qpmMapper=new OrderOperateDAOImpl();
		qpmMapper.openSession();
		List<OrderShowVO> ord = qpmMapper.getOrderShowVOByParameters(qParameters);
		
		System.out.println(ord.size());
		
	}
	
	@Ignore
	public void testGetCurrentDayOrder() 
	{
		OrderOperateMapper qpmMapper=new OrderOperateDAOImpl();
		qpmMapper.openSession();
		List<OrderShowVO> ord = qpmMapper.getCurrentDayOrder();
		
		System.out.println(ord.size());
	}

}
