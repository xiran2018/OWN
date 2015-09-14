package admin.ru.own.www.entity;

public class UpProduct 
{
	private int pid;
	
	private int categoryId;
	private int brandId;
	private String companyname;
	private String fromurl;
	private String companyorder;
	private String myorder;
	private float buyprice;
	private float originprice;
	private float nowPrice;
	private int storNumber;
	private int minBuyCount;
	private byte nomailtax;
	private byte status;
	private byte isNew;
	private byte isHot;
	private byte isRecommend;
	private String beizhu;
	private float jifen;
	private String productname;
	
	
	private String en_other_name;
	private String en_product_description;
	private String en_title;
	private String en_keywords;
	private String en_description;
	
	private String ru_other_name;
	private String ru_product_description;
	private String ru_title;
	private String ru_keywords;
	private String ru_description;
	public UpProduct() {
		// TODO Auto-generated constructor stub
	}
	
	public UpProduct(int categoryId2, int brandId2, String companyname2,
			String fromurl2, String companyorder2, String myorder2,
			float buyprice2, float originprice2, float nowPrice2,
			int storNumber2, int minBuyCount2, byte nomailtax2, byte status2,
			byte isNew2, byte isHot2, byte isRecommend2, String beizhu2,
			float jifen2,String productName, String en_other_name2,
			String en_product_description2, String en_title2,
			String en_keywords2, String en_description2, String ru_other_name2,
			String ru_product_description2, String ru_title2,
			String ru_keywords2, String ru_description2) 
	{
		this.categoryId=categoryId2;
		this.brandId=brandId2;
		this.companyname=companyname2;
		this.fromurl=fromurl2;
		this.companyorder=companyorder2;
		this.myorder=myorder2;
		this.buyprice=buyprice2;
		this.originprice=originprice2;
		this.nowPrice=nowPrice2;
		this.storNumber=storNumber2;
		this.minBuyCount=minBuyCount2;
		this.nomailtax=nomailtax2;
		this.status=status2;
		this.isNew=isNew2;
		this.isHot=isHot2;
		this.isRecommend=isRecommend2;
		this.beizhu=beizhu2;
		this.jifen=jifen2;
		this.productname=productName;
		
		this.en_other_name=en_other_name2;
		this.en_product_description=en_product_description2;
		this.en_title=en_title2;
		this.en_keywords=en_keywords2;
		this.en_description=en_description2;
		
		this.ru_other_name=ru_other_name2;
		this.ru_product_description=ru_product_description2;
		this.ru_title=ru_title2;
		this.ru_keywords=ru_keywords2;
		this.ru_description=ru_description2;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getFromurl() {
		return fromurl;
	}
	public void setFromurl(String fromurl) {
		this.fromurl = fromurl;
	}
	public String getCompanyorder() {
		return companyorder;
	}
	public void setCompanyorder(String companyorder) {
		this.companyorder = companyorder;
	}
	public String getMyorder() {
		return myorder;
	}
	public void setMyorder(String myorder) {
		this.myorder = myorder;
	}
	public float getBuyprice() {
		return buyprice;
	}
	public void setBuyprice(float buyprice) {
		this.buyprice = buyprice;
	}
	public float getOriginprice() {
		return originprice;
	}
	public void setOriginprice(float originprice) {
		this.originprice = originprice;
	}
	public float getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(float nowPrice) {
		this.nowPrice = nowPrice;
	}
	public int getStorNumber() {
		return storNumber;
	}
	public void setStorNumber(int storNumber) {
		this.storNumber = storNumber;
	}
	public int getMinBuyCount() {
		return minBuyCount;
	}
	public void setMinBuyCount(int minBuyCount) {
		this.minBuyCount = minBuyCount;
	}
	public byte getNomailtax() {
		return nomailtax;
	}
	public void setNomailtax(byte nomailtax) {
		this.nomailtax = nomailtax;
	}
	public byte getStatus() {
		return status;
	}
	public void setStatus(byte status) {
		this.status = status;
	}
	public byte getIsNew() {
		return isNew;
	}
	public void setIsNew(byte isNew) {
		this.isNew = isNew;
	}
	public byte getIsHot() {
		return isHot;
	}
	public void setIsHot(byte isHot) {
		this.isHot = isHot;
	}
	public byte getIsRecommend() {
		return isRecommend;
	}
	public void setIsRecommend(byte isRecommend) {
		this.isRecommend = isRecommend;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}



	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}



	public float getJifen() {
		return jifen;
	}

	public void setJifen(float jifen) {
		this.jifen = jifen;
	}

	public String getEn_other_name() {
		return en_other_name;
	}
	public void setEn_other_name(String en_other_name) {
		this.en_other_name = en_other_name;
	}
	public String getEn_product_description() {
		return en_product_description;
	}
	public void setEn_product_description(String en_product_description) {
		this.en_product_description = en_product_description;
	}
	public String getEn_title() {
		return en_title;
	}
	public void setEn_title(String en_title) {
		this.en_title = en_title;
	}
	public String getEn_keywords() {
		return en_keywords;
	}
	public void setEn_keywords(String en_keywords) {
		this.en_keywords = en_keywords;
	}
	public String getEn_description() {
		return en_description;
	}
	public void setEn_description(String en_description) {
		this.en_description = en_description;
	}
	public String getRu_other_name() {
		return ru_other_name;
	}
	public void setRu_other_name(String ru_other_name) {
		this.ru_other_name = ru_other_name;
	}
	public String getRu_product_description() {
		return ru_product_description;
	}
	public void setRu_product_description(String ru_product_description) {
		this.ru_product_description = ru_product_description;
	}
	public String getRu_title() {
		return ru_title;
	}
	public void setRu_title(String ru_title) {
		this.ru_title = ru_title;
	}
	public String getRu_keywords() {
		return ru_keywords;
	}
	public void setRu_keywords(String ru_keywords) {
		this.ru_keywords = ru_keywords;
	}
	public String getRu_description() {
		return ru_description;
	}
	public void setRu_description(String ru_description) {
		this.ru_description = ru_description;
	}
	
}
