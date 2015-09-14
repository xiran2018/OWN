package ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import org.junit.Test;

import ru.own.www.entity.MailAddress;

public class MailAddressOperateDAOImplTest {

	@Test
	public void testAddMailAddress() 
	{
		
		
		
		MailAddress mailAddress=new MailAddress();
		mailAddress.setContactName("11");
		mailAddress.setCountryId(5);
		mailAddress.setStreetAddress("11");
		mailAddress.setStreetAddressOther("11");
		mailAddress.setZipCode("11");
		mailAddress.setCity("11");
		mailAddress.setCountryNumber("11");
		mailAddress.setAreaNumber("11");
		mailAddress.setLocalNumber("11");
		mailAddress.setMobile("11");
		
		int cpi=0;
		MailAddressOperateMapper cpid=new MailAddressOperateDAOImpl();
		cpid.openSession();
		try 
		{
			cpi=cpid.addMailAddress(mailAddress);
			cpid.commit();
			if(cpi>0)
			{//更新成功
			}
			else 
			{//更新错误
			}
		}catch (Exception e) {
			e.printStackTrace();
			cpid.rollBack();
		}finally{
			cpid.closeSession();
		}
	}

}
