package ru.own.www.entity;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ru.own.www.mybatis.dao.OrderOperateDAOImpl;
import ru.own.www.mybatis.dao.OrderOperateMapper;
import admin.ru.own.www.entity.User;

public class OrderShowVO 
{
	Order order;//订单信息
	User  uinfo;//用户信息
	MailAddressShowVO mailAddressVO;//邮寄地址信息
	List<OrderDetailShowVO> odsvo;//订单详情
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<OrderDetailShowVO> getOdsvo() {
		return odsvo;
	}
	public void setOdsvo(List<OrderDetailShowVO> odsvo) {
		this.odsvo = odsvo;
	}
	
	public User getUinfo() {
		return uinfo;
	}
	public void setUinfo(User uinfo) {
		this.uinfo = uinfo;
	}
	public MailAddressShowVO getMailAddressVO() {
		return mailAddressVO;
	}
	public void setMailAddressVO(MailAddressShowVO mailAddressVO) {
		this.mailAddressVO = mailAddressVO;
	}
	/**
	 * 取得这个订单的所有信息，以便显示
	 * @param orderId2
	 * @return
	 */
	public OrderShowVO getOrderShowVOByOrderId(int orderId2) 
	{
		OrderShowVO osvoOrderShowVO=null;
		OrderOperateMapper cpid=new OrderOperateDAOImpl();
		cpid.openSession();
		SqlSession sqlSession = cpid.getSqlSession();
		try 
		{//生成订单
			osvoOrderShowVO=cpid.getOrderShowVOByOrderId(orderId2);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			cpid.closeSession();
		}
		return osvoOrderShowVO;
	}
}
