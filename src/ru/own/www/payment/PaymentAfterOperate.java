package ru.own.www.payment;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;

import ru.own.www.entity.Order;
import ru.own.www.mybatis.dao.MybatisCommonOperateMapper;
import ru.own.www.mybatis.dao.OrderOperateDAOImpl;
import ru.own.www.mybatis.dao.OrderOperateMapper;
import ru.own.www.mybatis.dao.PaymentAfterOperateDAOImpl;
import admin.ru.own.www.entity.User;
import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;

/**
 * 用户支付成功之后的操作，比如改变用户的积分，修改用户的支付时间以及修改支付方式等
 * @author jql
 *
 */
public class PaymentAfterOperate 
{
	Order order;
	
	public PaymentAfterOperate(Order order) 
	{
		this.order=order;
	}
	
	public void execute()
	{
		int cpi=0;
		MybatisCommonOperateMapper cpid=new PaymentAfterOperateDAOImpl();
		cpid.openSession();
		SqlSession sqlSession = cpid.getSqlSession();
		Transaction newTransaction=MybatisSessionFactory.getTranscation(cpid.getSqlSession());
		try 
		{//生成订单
				changeJiFen(order,sqlSession); //改变用户积分，包括使用的积分和本次购买获取的积分
				changePaymentTime(order,sqlSession); //更改用户的支付时间
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

	private void changePaymentTime(Order order2, SqlSession sqlSession) 
	{
		Order od=new Order();
		od.changePaymentTime(order2, sqlSession);
	}

	private void changeJiFen(Order order2, SqlSession sqlSession) 
	{
		User user=new User();
		user.changeJiFen(order2,sqlSession);
	}
}
