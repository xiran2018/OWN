package admin.ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import org.junit.Test;

import admin.ru.own.www.entity.UpProduct;

public class ProductOperationMapperTest {

	@Test
	public void testInsertPorductByBatch() 
	{
		UpProduct upp=new UpProduct();
		upp.setCategoryId(2);
		upp.setBrandId(21);
		upp.setBeizhu("fsld");
		upp.setBuyprice((float) 2.0);
		upp.setOriginprice(0);
		upp.setNowPrice((float) 2.4);
		upp.setCompanyname("sdlfj");
		upp.setCompanyorder("lsdjf");
		upp.setStorNumber(40);
		upp.setFromurl("sdljf");
		upp.setIsHot((byte) 0);
		upp.setIsNew((byte) 0);
		upp.setIsRecommend((byte) 0);
		upp.setJifen(0);
		upp.setMinBuyCount(0);
		upp.setMyorder("wrj");
		upp.setProductname("sjdfl");
		
		MyBatisDAO.insertProduct(upp);
	}

}
