package ru.own.www.logic;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import ru.own.www.entity.ProductShowVO;
import ru.own.www.entity.Product_Basic_Attr13_ShowVO;
import ru.own.www.entity.Product_Basic_Attr_ShowVO;
import ru.own.www.entity.Product_SKU_ShowVO;
import ru.own.www.entity.ShippingShowVO;
import admin.ru.own.www.entity.Products;
import admin.ru.own.www.entity.ShippingCountry;
import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAO;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAOImp;
import admin.ru.own.www.mybatis.dao.ProductImageDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAOImp;
import admin.ru.own.www.mybatis.dao.ProductOperationDAOImp;
import admin.ru.own.www.mybatis.dao.ProductOperationMapper;
import admin.ru.own.www.mybatis.dao.ProductSkuDAO;
import admin.ru.own.www.mybatis.dao.ProductSkuDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateMapper;

import com.opensymphony.xwork2.ActionSupport;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2014年12月8日 下午3:03:22  
 */
public class ProductOperate extends ActionSupport implements SessionAware
{
	private Map session;  
	
	private int id;//the id of product	or  shippingCountry
	private int templateId;//the id of shippingTemplate
	
	List<productImage> pimg;
	Products product;
	
	ProductShowVO productvo;
	List<ShippingCountry> sc;
	List<ShippingShowVO> ssvo;
	
	
	public String requestShippingInfoByCountryIdAndTemplateId()
	{
		session.put("defaultShippingCountryId", id);
		ShippingTemplateMapper stm=new	ShippingTemplateDAOImp();
		ssvo=stm.getShipInfoByTemplateIdAndCountryId(templateId,id);
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getProductBasicInfo()
	{
		productvo=new ProductShowVO();
		int lanid=Integer.parseInt((String) session.get("languageId"));
		
		//获取基本信息
		ProductOperationMapper pom=new ProductOperationDAOImp();
		Products tempProduct=pom.getProductByPIdWithLanId(id,lanid);
		pom.closeSession();
		productvo.setProducts(tempProduct); //基本信息赋值
		
		//获取商品属性信息 
		ProductBasicAttrDAO pba=new ProductBasicAttrDAOImp();
		//在这里，只是获取的录入方式为2的属性信息，也就是需要用户选择的属性
		List<Product_Basic_Attr_ShowVO> tempPBAS=pba.getOneProductBasicAttrVOByPidAndLanId(id,lanid);
		
		//在这里，只是获取的录入方式为4的属性信息，也就是需要用户单项选择的属性
		List<Product_Basic_Attr13_ShowVO> tempPBAS4=pba.getOneProductBasicAttr4VOByPidAndLanId(id,lanid);
		pba.closeSession();
		
		productvo.setpBasic_Attrs(tempPBAS);
		
		productvo.setpBasic_Attrs4(tempPBAS4);
		
		//获取sku的信息
		ProductSkuDAO psd=new ProductSkuDAOImp();
		List<Product_SKU_ShowVO> psku=psd.getOneProductSkusVOByPid(id);
		psd.closeSession();
		productvo.setPsku(psku);
		
		//获取商品属性信息,在这里，只是获取的录入方式为2的属性信息，也就是需要用户选择的属性
		ProductBasicAttrDAO pba13=new ProductBasicAttrDAOImp();
		List<Product_Basic_Attr13_ShowVO> tempPBAS13=pba13.getOneProductBasicAttr13VOByPidAndLanId(id,lanid);
		pba.closeSession();
		productvo.setpBasic_Attrs13(tempPBAS13);
		
		//获取所有的国家信息
		sc=MyBatisDAO.getAllShowShippingCountry();
		
		
		//获取物流信息
		int shipTemplateId=tempProduct.getP_freight_templet(); //货运模版
		for(int j=0;j<sc.size();j++)
		{
			int tempCountryId;
			Integer tempId=(Integer) session.get("defaultShippingCountryId");
			if(tempId==null||tempId<=0)
			{
				ShippingCountry temp=sc.get(j);//获取某一个国家
				id=temp.getId();
				tempCountryId=temp.getId();
				session.put("defaultShippingCountryId", tempCountryId);
			}
			else
			{
				id=tempId;
				tempCountryId=tempId;
			}
			
			ShippingTemplateMapper stm=new	ShippingTemplateDAOImp();
			ssvo=stm.getShipInfoByTemplateIdAndCountryId(shipTemplateId,tempCountryId);
			if(tempId==null&&ssvo!=null&&ssvo.size()>0) break; //在没有选择任何国家的前提下，需要找到含有物流信息的某一个国家，不包含物流信息的国家，在前台没有办法很好的显示
		}
		
		return SUCCESS;

	}
	
	public String getProductImageInfo()
	{
		
		//获取商品图片
		ProductImageDAO pDAO = new ProductImageDAOImp();
		pimg= pDAO.getImg(id);
		if(pimg!=null)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}

	public String productShow()
	{
		return SUCCESS;
	}




	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<productImage> getPimg() {
		return pimg;
	}

	public void setPimg(List<productImage> pimg) {
		this.pimg = pimg;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public Products getProduct() {
		return product;
	}

	public void setProduct(Products product) {
		this.product = product;
	}

	public ProductShowVO getProductvo() {
		return productvo;
	}

	public void setProductvo(ProductShowVO productvo) {
		this.productvo = productvo;
	}

	public List<ShippingCountry> getSc() {
		return sc;
	}

	public void setSc(List<ShippingCountry> sc) {
		this.sc = sc;
	}

	public List<ShippingShowVO> getSsvo() {
		return ssvo;
	}

	public void setSsvo(List<ShippingShowVO> ssvo) {
		this.ssvo = ssvo;
	}

	public int getTemplateId() {
		return templateId;
	}

	public void setTemplateId(int templateId) {
		this.templateId = templateId;
	}

	
	

}
