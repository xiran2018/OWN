package ru.own.www.payment;

import static org.junit.Assert.*;

import org.junit.Test;

import ru.own.www.entity.OrderShowVO;

public class paymentOperateTest {

	@Test
	public void testGetOrderShowVOByOrderId()
	{
		PaymentOperate pOperate=new PaymentOperate();
		OrderShowVO ss = pOperate.getOrderShowVOByOrderId(19);
		if(ss==null)
		{
			fail();
		}
	}

}
