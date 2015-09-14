/**  
* This class is used for ...  
* @author jingquanliang
* @version  
*       1.0, 2015年1月15日 下午10:54:34  
*/   
package ru.own.www.entity;

import java.util.Date;

public class ProductBasicShowVO 
{
	private int p_id;
	private String p_name;//商品名称
	private double p_purchaprice;//采购价格
	private double p_originprice;//原始价格
	private double p_nowprice;//现价
	private int p_brandid;//品牌ID
	private int p_categoryid;//商品分类ID
	private String p_fromcompany;//产品来源厂家
	private String p_companyserinum;//厂家编号
	private String p_myserialnumber;//自编号
	private String p_fromnetaddress;//来源网址
	private int p_storenumber;//库存
	private int p_minbuyamount;//最少购买数量
	private byte p_freemail;//免邮费
	private double p_jifen;//积分
	private byte p_hot;//热销
	private byte p_recommend;//推荐
	private byte p_new;//新品
	private Date p_date_added;//添加日期
	private Date p_last_modified;//上次修改日期
	private byte p_status;//产品状态
	private String p_beizhu;//备注
	private float p_weight;
	private int p_freight_templet;  //货运模版
	
	private String product_desc;//商品描述
	private String product_detail_desc;//商品详细描述
	private String title;
	private String keywords;
	private String description;
	
	public int getP_freight_templet() {
		return p_freight_templet;
	}
	public void setP_freight_templet(int p_freight_templet) {
		this.p_freight_templet = p_freight_templet;
	}

	public float getP_weight() {
		return p_weight;
	}
	public void setP_weight(float p_weight) {
		this.p_weight = p_weight;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public double getP_purchaprice() {
		return p_purchaprice;
	}
	public void setP_purchaprice(double p_purchaprice) {
		this.p_purchaprice = p_purchaprice;
	}
	public double getP_originprice() {
		return p_originprice;
	}
	public void setP_originprice(double p_originprice) {
		this.p_originprice = p_originprice;
	}
	public double getP_nowprice() {
		return p_nowprice;
	}
	public void setP_nowprice(double p_nowprice) {
		this.p_nowprice = p_nowprice;
	}
	public int getP_brandid() {
		return p_brandid;
	}
	public void setP_brandid(int p_brandid) {
		this.p_brandid = p_brandid;
	}
	public int getP_categoryid() {
		return p_categoryid;
	}
	public void setP_categoryid(int p_categoryid) {
		this.p_categoryid = p_categoryid;
	}
	public String getP_fromcompany() {
		return p_fromcompany;
	}
	public void setP_fromcompany(String p_fromcompany) {
		this.p_fromcompany = p_fromcompany;
	}
	public String getP_companyserinum() {
		return p_companyserinum;
	}
	public void setP_companyserinum(String p_companyserinum) {
		this.p_companyserinum = p_companyserinum;
	}
	public String getP_myserialnumber() {
		return p_myserialnumber;
	}
	public void setP_myserialnumber(String p_myserialnumber) {
		this.p_myserialnumber = p_myserialnumber;
	}
	public String getP_fromnetaddress() {
		return p_fromnetaddress;
	}
	public void setP_fromnetaddress(String p_fromnetaddress) {
		this.p_fromnetaddress = p_fromnetaddress;
	}
	public int getP_storenumber() {
		return p_storenumber;
	}
	public void setP_storenumber(int p_storenumber) {
		this.p_storenumber = p_storenumber;
	}
	public int getP_minbuyamount() {
		return p_minbuyamount;
	}
	public void setP_minbuyamount(int p_minbuyamount) {
		this.p_minbuyamount = p_minbuyamount;
	}
	public byte getP_freemail() {
		return p_freemail;
	}
	public void setP_freemail(byte p_freemail) {
		this.p_freemail = p_freemail;
	}
	public double getP_jifen() {
		return p_jifen;
	}
	public void setP_jifen(double p_jifen) {
		this.p_jifen = p_jifen;
	}
	public byte getP_hot() {
		return p_hot;
	}
	public void setP_hot(byte p_hot) {
		this.p_hot = p_hot;
	}
	public byte getP_recommend() {
		return p_recommend;
	}
	public void setP_recommend(byte p_recommend) {
		this.p_recommend = p_recommend;
	}
	public byte getP_new() {
		return p_new;
	}
	public void setP_new(byte p_new) {
		this.p_new = p_new;
	}
	public Date getP_date_added() {
		return p_date_added;
	}
	public void setP_date_added(Date p_date_added) {
		this.p_date_added = p_date_added;
	}
	public Date getP_last_modified() {
		return p_last_modified;
	}
	public void setP_last_modified(Date p_last_modified) {
		this.p_last_modified = p_last_modified;
	}
	public byte getP_status() {
		return p_status;
	}
	public void setP_status(byte p_status) {
		this.p_status = p_status;
	}
	public String getP_beizhu() {
		return p_beizhu;
	}
	public void setP_beizhu(String p_beizhu) {
		this.p_beizhu = p_beizhu;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public String getProduct_detail_desc() {
		return product_detail_desc;
	}
	public void setProduct_detail_desc(String product_detail_desc) {
		this.product_detail_desc = product_detail_desc;
	}
	
	
	
}
