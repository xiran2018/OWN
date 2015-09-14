package ru.own.www.logic;

import java.io.File;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;


























import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.apache.struts2.interceptor.SessionAware;

import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductAttrShowVO;
import ru.own.www.entity.CartProductImage;
import ru.own.www.entity.MailAddress;
import ru.own.www.entity.MailAddressShowVO;
import ru.own.www.entity.ProductBasicShowVO;
import ru.own.www.entity.ShippingShowVO;
import ru.own.www.entity.shopCartShowVO;
import ru.own.www.mybatis.dao.CartOperateDAOImpl;
import ru.own.www.mybatis.dao.CartOperateMapper;
import ru.own.www.mybatis.dao.CartProductImageDAOImpl;
import ru.own.www.mybatis.dao.CartProductImageMapper;
import ru.own.www.mybatis.dao.MailAddressOperateDAOImpl;
import ru.own.www.mybatis.dao.MailAddressOperateMapper;
import systemlog.Log;
import admin.ru.own.www.entity.ShippingCountry;
import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateMapper;
import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.ActionSupport;


/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月8日 下午3:49:59  
 */
public class MailAddressOperate extends ActionSupport implements SessionAware
{
	private Map session; 
	
	private int id;//the id of the MailAddress
	private String contactName;
	private int countryId;
	private String streetAddress;
	private String streetAddressOther;
	private String addressCity;
	private String adressPostalCode;
	private String countryNumber;
	private String areaNumber;
	private String localNumber;
	private String mobileInputEle;
	
	private List<shopCartShowVO> shopCartList;
	List<MailAddressShowVO> mailAddressList;//邮寄地址列表
	MailAddressShowVO mailAddressShowVO;
	
	private int status=0;//状态，是否删除成功，status=0,删除失败，1：成功，2：由于有订单在使用这个地址，所以无法删除

	private List<ShippingCountry> sc;
	
	
	/**
	 * 修改邮寄地址信息
	 */
	public String modifyMailAddress()
	{
		int userid=(Integer) session.get("customeruserid");
		if(userid>0)
		{
			sc=MyBatisDAO.getAllShowShippingCountry();
			
			MailAddressOperateMapper cpid=new MailAddressOperateDAOImpl();
			cpid.openSession();
			try 
			{
				mailAddressShowVO=cpid.getMailAddressShowVOByUserIdAndMailId(userid,id);
			}catch (Exception e) {
				e.printStackTrace();
				cpid.rollBack();
			}finally{
				cpid.closeSession();
				return SUCCESS;
			}
		}
		else
		{
			return ERROR;
		}
		
	}
	
	/**
	 * 删除邮寄地址
	 * @return
	 */
	public String delMailAddress()
	{
		int userid=(Integer) session.get("customeruserid");
		if(userid>0)
		{
			if (!checkMailAddressUsed(userid,id)) 
			{
				int cpi=0;
				MailAddressOperateMapper cpid=new MailAddressOperateDAOImpl();
				cpid.openSession();
				try 
				{
					cpi=cpid.delMailAddressByUserIdAndMailId(userid,id);
					cpid.commit();
					if(cpi>0)
					{//更新成功
						status=1;
						return SUCCESS;
					}
					else 
					{//更新错误
						return ERROR;
					}
				}catch (Exception e) {
					e.printStackTrace();
					cpid.rollBack();
				}finally{
					cpid.closeSession();
				}
			}
			else 
			{//有订单在占用地址
				status=2;
			}
		}
		else
		{
			return LOGIN;
		}
		return SUCCESS;
	}
	private boolean checkMailAddressUsed(int userid, int id)
	{
		MailAddress mailAddress=new MailAddress();
		return mailAddress.checkMailAddressUsed(userid,id);
	}
	/**
	 * 显示邮寄地址
	 * @return
	 */
	public String shippingAddressShow()
	{
		int userid=(Integer) session.get("customeruserid");
		if(userid>0)
		{
			MailAddress	mailAddress=new MailAddress();
			mailAddressList=mailAddress.getMailAddressShowVOByUserid(userid);
			return SUCCESS;
		}
		else
		{
			return LOGIN;
		}
		
	}
	
	
	/**
	 * 更新邮寄地址
	 * @return
	 */
	public String updateMailAddress()
	{
		MailAddress mailAddress=new MailAddress();
		mailAddress.setId(id);
		mailAddress.setContactName(contactName);
		mailAddress.setCountryId(countryId);
		mailAddress.setStreetAddress(streetAddress);
		mailAddress.setStreetAddressOther(streetAddressOther);
		mailAddress.setZipCode(adressPostalCode);
		mailAddress.setCity(addressCity);
		mailAddress.setCountryNumber(countryNumber);
		mailAddress.setAreaNumber(areaNumber);
		mailAddress.setLocalNumber(localNumber);
		mailAddress.setMobile(mobileInputEle);
		
		int cpi=0;
		MailAddressOperateMapper cpid=new MailAddressOperateDAOImpl();
		cpid.openSession();
		try 
		{
			cpi=cpid.updateMailAddress(mailAddress);
			cpid.commit();
			if(cpi>0)
			{//更新成功
				session.put("defaultShippingCountryId", countryId);  //更改国家的id
				return SUCCESS;
			}
			else 
			{//更新错误
				return ERROR;
			}
		}catch (Exception e) {
			e.printStackTrace();
			cpid.rollBack();
		}finally{
			cpid.closeSession();
		}
		return SUCCESS;
	}
	
	/**
	 * 增加邮寄地址
	 * @return
	 */
	public String addMailAddress()
	{
		if(status!=0)
		{//说明是后台的请求页面
			sc=MyBatisDAO.getAllShowShippingCountry();
			return "add";
		}
		
		int userid=(Integer) session.get("customeruserid");
		
		MailAddress mailAddress=new MailAddress();
		mailAddress.setUserId(userid);
		mailAddress.setContactName(contactName);
		mailAddress.setCountryId(countryId);
		mailAddress.setStreetAddress(streetAddress);
		mailAddress.setStreetAddressOther(streetAddressOther);
		mailAddress.setZipCode(adressPostalCode);
		mailAddress.setCity(addressCity);
		mailAddress.setCountryNumber(countryNumber);
		mailAddress.setAreaNumber(areaNumber);
		mailAddress.setLocalNumber(localNumber);
		mailAddress.setMobile(mobileInputEle);
		
		int cpi=0;
		MailAddressOperateMapper cpid=new MailAddressOperateDAOImpl();
		cpid.openSession();
		try 
		{
			cpi=cpid.addMailAddress(mailAddress);
			cpid.commit();
			if(cpi>0)
			{//更新成功
				session.put("defaultShippingCountryId", countryId);  //更改国家的id
				id=mailAddress.getId();
				return SUCCESS;
			}
			else 
			{//更新错误
				return ERROR;
			}
		}catch (Exception e) {
			e.printStackTrace();
			cpid.rollBack();
		}finally{
			cpid.closeSession();
		}
		
		return SUCCESS;
	}
	
	public void setSession(Map session) {
		this.session = session;
	}
	
	public String changeCountry()
	{
		return SUCCESS;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getStreetAddressOther() {
		return streetAddressOther;
	}

	public void setStreetAddressOther(String streetAddressOther) {
		this.streetAddressOther = streetAddressOther;
	}

	public String getAddressCity() {
		return addressCity;
	}

	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}

	public String getAdressPostalCode() {
		return adressPostalCode;
	}

	public void setAdressPostalCode(String adressPostalCode) {
		this.adressPostalCode = adressPostalCode;
	}

	public String getCountryNumber() {
		return countryNumber;
	}

	public void setCountryNumber(String countryNumber) {
		this.countryNumber = countryNumber;
	}

	public String getAreaNumber() {
		return areaNumber;
	}

	public void setAreaNumber(String areaNumber) {
		this.areaNumber = areaNumber;
	}

	public String getLocalNumber() {
		return localNumber;
	}

	public void setLocalNumber(String localNumber) {
		this.localNumber = localNumber;
	}

	public String getMobileInputEle() {
		return mobileInputEle;
	}

	public void setMobileInputEle(String mobileInputEle) {
		this.mobileInputEle = mobileInputEle;
	}

	public List<shopCartShowVO> getShopCartList() {
		return shopCartList;
	}

	public void setShopCartList(List<shopCartShowVO> shopCartList) {
		this.shopCartList = shopCartList;
	}


	public List<MailAddressShowVO> getMailAddressList() {
		return mailAddressList;
	}


	public void setMailAddressList(List<MailAddressShowVO> mailAddressList) {
		this.mailAddressList = mailAddressList;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	public MailAddressShowVO getMailAddressShowVO() {
		return mailAddressShowVO;
	}

	public void setMailAddressShowVO(MailAddressShowVO mailAddressShowVO) {
		this.mailAddressShowVO = mailAddressShowVO;
	}

	public List<ShippingCountry> getSc() {
		return sc;
	}

	public void setSc(List<ShippingCountry> sc) {
		this.sc = sc;
	}
	
	

	
}
