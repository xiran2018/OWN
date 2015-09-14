package ru.own.www.entity;

/**
 * 订单查询的参数
 * @author jql
 *
 */
public class QueryParameters 
{
	int id;//主键
	int userid;//用户id
	private String productName;//商品名称
	private String orderNo;//订单号
	private String orderStatus;//订单状态
	private String buyerName;//购买用户名
	private String gmtBeginDate;//订单的开始时间
	private String gmtEndDate;//订单的结束时间
	
	private Integer numberInPage=10;//每一页需要显示的行数，默认是10行数据
	private int offset; //偏移量

	
	
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public Integer getNumberInPage() {
		return numberInPage;
	}
	public void setNumberInPage(Integer numberInPage) {
		this.numberInPage = numberInPage;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getGmtBeginDate() {
		return gmtBeginDate;
	}
	public void setGmtBeginDate(String gmtBeginDate) {
		this.gmtBeginDate = gmtBeginDate;
	}
	public String getGmtEndDate() {
		return gmtEndDate;
	}
	public void setGmtEndDate(String gmtEndDate) {
		this.gmtEndDate = gmtEndDate;
	}
	
	
	
	

}
