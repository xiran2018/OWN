package admin.ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import org.junit.Test;

public class BrandSeriesMapperTest {

	@Test
	public void testBrandFetchByCategoryId() 
	{
		
		int a=12;
		MyBatisDAO.selectBrandByCategoryId(a);
	}

}
