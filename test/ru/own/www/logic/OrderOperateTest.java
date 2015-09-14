package ru.own.www.logic;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;

import ru.own.www.entity.Order;
import ru.own.www.mybatis.dao.OrderOperateDAOImpl;
import ru.own.www.mybatis.dao.OrderOperateMapper;
import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;

public class OrderOperateTest {

	@Test
	public void testGenerateOrder() 
	{
		OrderOperate oo=new OrderOperate();
		
		int cpi=0;
		OrderOperateMapper cpid=new OrderOperateDAOImpl();
		cpid.openSession();
		SqlSession sqlSession = cpid.getSqlSession();
		Transaction newTransaction=MybatisSessionFactory.getTranscation(cpid.getSqlSession());
		try 
		{//生成订单
			String orderIdString="sjdfljfsdlfj";//订单编号
			float totalPrice=2;//所有的总价格
			float realPrice=1;//实际付款的价格
			int userId=2;
			
			Order order=new Order();
			order.setOrdernumber("sjlfj");
			order.setUserid(userId);
			order.setUseraddressid(1);
			order.setOrderstate((short)0);
			
			order.setCountprice(totalPrice);
			order.setRealpay(realPrice);  //减去积分之后的价格
			order.setGivejifen((int)totalPrice); //获得积分
			order.setUsejifen(1);
			float reducefeee=1;
//			order.setReducefee(reducefeee);
			
			String userip="127.0.0.1";
			order.setUserip(userip);//设定用户的ip地址
			
			cpid.insertOrder(order);
			
		}catch (Exception e) {
			e.printStackTrace();
			try {
				newTransaction.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			try {
				newTransaction.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			cpid.closeSession();
		}
		
	}

}
