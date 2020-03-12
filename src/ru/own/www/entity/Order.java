package ru.own.www.entity;

import java.sql.Timestamp;

import org.apache.ibatis.session.SqlSession;

import ru.own.www.mybatis.dao.OrderOperateDAOImpl;
import ru.own.www.mybatis.dao.OrderOperateMapper;
import admin.ru.own.www.entity.User;
import admin.ru.own.www.mybatis.dao.UserOperateMapper;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	private Integer id;
	private String ordernumber;
	private Integer userid;
	private Timestamp ordercreatetime;
	private Timestamp orderpaytime;
	private Integer shippingid;
	private Short orderstate;  //订单状态，0表示未支付，1标志已经支付，2标志取消订单
	private Short ordertype;
	private Short paymenttype;//支付方式,1表示paypal
	private Float countprice; //总金额,商品价格+运费
	private Float realpay; //商品总价格+运费-积分
	private String  reducefee=""; //减免费用，减号表示减少，加好表示增加
	private String reducefeereason;//减免费用的原因
	private Short mailfeeornot;
	private Float mailfee;  //邮寄的费用
	private Integer usejifen;
	private Integer givejifen;
	private String userip;
	private String beizhu;//备注信息
	private Integer useraddressid;//邮寄地址id
	private Integer currencyId; //货币的id
	private Double currencyrate;
	private Double productCurrencyRate; //加入订单时的商品价格

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(String ordernumber, Integer userid, Timestamp ordercreatetime,
			String reducefeee, Short mailfeeornot, Integer useraddressid) {
		this.ordernumber = ordernumber;
		this.userid = userid;
		this.ordercreatetime = ordercreatetime;
		this.reducefee = reducefeee;
		this.mailfeeornot = mailfeeornot;
		this.useraddressid = useraddressid;
	}

	/** full constructor */
	public Order(String ordernumber, Integer userid, Timestamp ordercreatetime,
			Timestamp orderpaytime, Integer shippingid, Short orderstate,
			Short ordertype, Float countprice, Float realpay, String reducefeee,
			Short mailfeeornot, Float mailfee, Integer usejifen,
			Integer givejifen, String userip, Integer useraddressid) {
		this.ordernumber = ordernumber;
		this.userid = userid;
		this.ordercreatetime = ordercreatetime;
		this.orderpaytime = orderpaytime;
		this.shippingid = shippingid;
		this.orderstate = orderstate;
		this.ordertype = ordertype;
		this.countprice = countprice;
		this.realpay = realpay;
		this.reducefee = reducefeee;
		this.mailfeeornot = mailfeeornot;
		this.mailfee = mailfee;
		this.usejifen = usejifen;
		this.givejifen = givejifen;
		this.userip = userip;
		this.useraddressid = useraddressid;
	}

	
	/**
	 * 支付成功之后，更改订单的一些状态
	 * @param order
	 * @param sqlSession
	 */
	public void changePaymentTime(Order order,SqlSession sqlSession) 
	{
		OrderOperateMapper cMapper = sqlSession.getMapper(OrderOperateMapper.class);
		cMapper.updateOrderAfterPayment(order);
	}

	
	
	// Property accessors

	public String getReducefeereason() {
		return reducefeereason;
	}

	public void setReducefeereason(String reducefeereason) {
		this.reducefeereason = reducefeereason;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getCurrencyrate() {
		return this.currencyrate;
	}

	public void setCurrencyrate(final Double currencyrate) {
		this.currencyrate = currencyrate;
	}

	public String getOrdernumber() {
		return ordernumber;
	}

	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Timestamp getOrdercreatetime() {
		return this.ordercreatetime;
	}

	public void setOrdercreatetime(Timestamp ordercreatetime) {
		this.ordercreatetime = ordercreatetime;
	}

	public Timestamp getOrderpaytime() {
		return this.orderpaytime;
	}

	public void setOrderpaytime(Timestamp orderpaytime) {
		this.orderpaytime = orderpaytime;
	}

	public Integer getShippingid() {
		return this.shippingid;
	}

	public void setShippingid(Integer shippingid) {
		this.shippingid = shippingid;
	}

	public Short getOrderstate() {
		return this.orderstate;
	}

	public void setOrderstate(Short orderstate) {
		this.orderstate = orderstate;
	}

	public Short getOrdertype() {
		return this.ordertype;
	}

	public void setOrdertype(Short ordertype) {
		this.ordertype = ordertype;
	}

	public Float getCountprice() {
		return this.countprice;
	}

	public void setCountprice(Float countprice) {
		this.countprice = countprice;
	}

	public Float getRealpay() {
		return this.realpay;
	}

	public void setRealpay(Float realpay) {
		this.realpay = realpay;
	}


	public Integer getCurrencyId() {
		return this.currencyId;
	}

	public void setCurrencyId(final Integer currencyId) {
		this.currencyId = currencyId;
	}

	public String getReducefee() {
		return reducefee;
	}

	public void setReducefee(String reducefee) {
		this.reducefee = reducefee;
	}

	public Short getMailfeeornot() {
		return this.mailfeeornot;
	}

	public void setMailfeeornot(Short mailfeeornot) {
		this.mailfeeornot = mailfeeornot;
	}

	public Float getMailfee() {
		return this.mailfee;
	}

	public void setMailfee(Float mailfee) {
		this.mailfee = mailfee;
	}

	public Integer getUsejifen() {
		return this.usejifen;
	}

	public void setUsejifen(Integer usejifen) {
		this.usejifen = usejifen;
	}

	public Integer getGivejifen() {
		return this.givejifen;
	}

	public void setGivejifen(Integer givejifen) {
		this.givejifen = givejifen;
	}

	public String getUserip() {
		return this.userip;
	}

	public void setUserip(String userip) {
		this.userip = userip;
	}

	public Integer getUseraddressid() {
		return this.useraddressid;
	}

	public void setUseraddressid(Integer useraddressid) {
		this.useraddressid = useraddressid;
	}

	public Short getPaymenttype() {
		return paymenttype;
	}

	public void setPaymenttype(Short paymenttype) {
		this.paymenttype = paymenttype;
	}

	public Double getProductCurrencyRate() {
		return this.productCurrencyRate;
	}

	public void setProductCurrencyRate(final Double productCurrencyRate) {
		this.productCurrencyRate = productCurrencyRate;
	}
}