// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OrderOperateMapper.java

package admin.ru.own.www.logic.order;

import java.util.List;
import ru.own.www.entity.*;
import ru.own.www.mybatis.dao.MybatisCommonOperateMapper;

public interface OrderOperateMapper
	extends MybatisCommonOperateMapper
{

	public abstract OrderShowVO getOrderShowVOByOrderId(int i);

	public abstract List getOrderShowVOByParameters(QueryParameters queryparameters);

	public abstract List getCurrentDayOrder();

	public abstract int getTotalOrderCountByUserId(int i);

	public abstract int getAwaitingPaymentCountByUserId(QueryParameters queryparameters);

	public abstract int getTotalNumberOrderByParameters(QueryParameters queryparameters);

	public abstract OrderShowVO getOrderShowVOByOrderIdAndUserId(QueryParameters queryparameters);

	public abstract int saveDiscountInfoForOrder(Order order);
}
