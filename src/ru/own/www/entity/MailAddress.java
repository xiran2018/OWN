package ru.own.www.entity;

import java.util.List;

import net.sf.json.JSONArray;
import ru.own.www.mybatis.dao.MailAddressOperateDAOImpl;
import ru.own.www.mybatis.dao.MailAddressOperateMapper;

public class MailAddress 
{
	int id;
	int userId;
	String contactName;
	int countryId;//国家id信息
	String streetAddress;
	String streetAddressOther;
	String city;
	String zipCode;
	String countryNumber; //电话的国家区号
	String areaNumber; //电话的地区区号
	String localNumber; //电话的本地区号
	String mobile;
	
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public MailAddress() {
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
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
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
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
	public List<MailAddressShowVO> getMailAddressShowVOByUserid(int userid) 
	{
		List<MailAddressShowVO> mailAddressList=null;
		//取邮寄地址信息
		MailAddressOperateMapper cpid=new MailAddressOperateDAOImpl();
		cpid.openSession();
		try 
		{
			mailAddressList=cpid.getMailAddressList(userid);
			cpid.commit();
		}catch (Exception e) {
				e.printStackTrace();
		}finally{
				cpid.closeSession();
		}
		return mailAddressList;
	}
	
	/**
	 * 查看有没有订单在使用这个地址
	 * @param userid
	 * @param id
	 * @return
	 */
	public boolean checkMailAddressUsed(int userid, int id)
	{
		int count=0;
		MailAddressOperateMapper cpid=new MailAddressOperateDAOImpl();
		cpid.openSession();
		try 
		{
			count=cpid.getMailAddressByUseridAndMailId(userid,id);
			cpid.commit();
			if(count>0)
			{//有订单在使用这个地址
				return true;
			}
			else 
			{
				return false;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			cpid.closeSession();
		}
		return false;
	}
	

}
