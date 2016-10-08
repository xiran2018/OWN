package admin.ru.own.www.entity;

/**
 * 订单查询的参数
 * @author jql
 *
 */
public class ProductQueryParameters 
{
	private String productName;//商品名称
	private String brandName;//商品品牌
	private String productStatus;//商品状态
	private String gmtBeginDate;//订单的开始时间
	private String gmtEndDate;//订单的结束时间
	
	private Integer numberInPage=15;//每一页需要显示的行数，默认是10行数据
	private int offset; //偏移量

	
	
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

	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
